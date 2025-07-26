<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Get Employee Details</title>
</head>
<body>
    <h2>Get Employee Details</h2>
    <form method="post" action="GetEmployeeServlet">
        <label for="employeeId">Employee ID:</label>
        <input type="text" id="employeeId" name="employeeId" required>
        <input type="submit" value="Get Details">
    </form>

    <% 
        String employeeId = request.getParameter("employeeId");
        if (employeeId != null) {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeDB", "root", "password");

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
    %>
</body>
</html>