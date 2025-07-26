import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;  
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/GetEmployeeServlet")
public class GetEmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static final String DB_URL = "jdbc:mysql://localhost:3306/EmployeeDB";
    static final String USER = "root";
    static final String PASS = "sarathy";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String employeeId = request.getParameter("employeeId");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            String sql = "SELECT * FROM Employees WHERE ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(employeeId));
            rs = pstmt.executeQuery();

            if (rs.next()) {
                out.println("<h3>Employee Details:</h3>");
                out.println("<p>ID: " + rs.getInt("ID") + "</p>");
                out.println("<p>Name: " + rs.getString("Name") + "</p>");
                out.println("<p>Age: " + rs.getInt("Age") + "</p>");
                out.println("<p>Department: " + rs.getString("Department") + "</p>");
            } else {
                out.println("<p>No employee found with ID: " + employeeId + "</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Database error occurred!</p>");
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
            try { if (pstmt != null) pstmt.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
        }
    }
}