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

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    static final String DB_URL = "jdbc:mysql://localhost:3306/EmployeeDB";
    static final String USER = "root"; // MySQL username
    static final String PASS = "sarathy"; // MySQL password

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get employee ID from the form
        String employeeIdStr = request.getParameter("employeeId");

        // Validate input
        if (employeeIdStr == null || employeeIdStr.isEmpty()) {
            out.println("<h3>Please provide a valid Employee ID.</h3>");
            return;
        }

        int employeeId = Integer.parseInt(employeeIdStr);
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Register JDBC driver and open connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // SQL delete statement
            String sql = "DELETE FROM Employees WHERE ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, employeeId);

            // Execute the delete
            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                out.println("<h3>Employee deleted successfully!</h3>");
            } else {
                out.println("<h3>No employee found with the given ID.</h3>");
            }
        } catch (SQLException se) {
            se.printStackTrace();
            out.println("<h3>Database error occurred!</h3>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Server error occurred!</h3>");
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