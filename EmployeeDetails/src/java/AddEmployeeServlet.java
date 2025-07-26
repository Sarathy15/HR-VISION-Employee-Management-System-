import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    static final String DB_URL = "jdbc:mysql://localhost:3306/EmployeeDB";
    static final String USER = "root";          // MySQL username
    static final String PASS = "sarathy";      // MySQL password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get parameters from the form
        String employeeName = request.getParameter("employeeName");
        String ageStr = request.getParameter("employeeAge");
        String employeeDepartment = request.getParameter("employeeDepartment");

        // Convert age to an integer
        int employeeAge = Integer.parseInt(ageStr);

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

          
            String sql = "INSERT INTO Employees (Name, Age, Department) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, employeeName);
            pstmt.setInt(2, employeeAge);
            pstmt.setString(3, employeeDepartment);
            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                out.println("<h3>Employee added successfully!</h3>");
            } else {
                out.println("<h3>Error adding employee.</h3>");
            }
        } catch (SQLException se) {
            se.printStackTrace();
            out.println("<h3>Database error!</h3>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Server error!</h3>");
        } finally {
            // Clean-up environment
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}