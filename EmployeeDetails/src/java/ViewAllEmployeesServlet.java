import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/ViewAllEmployeesServlet")
public class ViewAllEmployeesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    static final String DB_URL = "jdbc:mysql://localhost:3306/EmployeeDB"; // Make sure the database name is correct
    static final String USER = "root";          // MySQL username
    static final String PASS = "sarathy";      // MySQL password

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Connection conn = null;
        Statement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();

            String sql = "SELECT * FROM Employees"; // Ensure your table name is correct
            ResultSet rs = stmt.executeQuery(sql);

            out.println("<h2>All Employees</h2>");
            out.println("<table class='table table-striped'>");
            out.println("<tr><th>ID</th><th>Name</th><th>Age</th><th>Department</th></tr>");

            while (rs.next()) {
                int id = rs.getInt("ID"); // Assuming your column names are ID, Name, Age, and Department
                String name = rs.getString("Name");
                int age = rs.getInt("Age");
                String department = rs.getString("Department");
                out.println("<tr><td>" + id + "</td><td>" + name + "</td><td>" + age + "</td><td>" + department + "</td></tr>");
            }
            out.println("</table>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Database error occurred!</h3>");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception se) {
                se.printStackTrace();
            }
        }
    }
}