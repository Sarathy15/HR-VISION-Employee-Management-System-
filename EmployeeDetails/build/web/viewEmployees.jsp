<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View All Employees</title>

    <!-- Linking to external CSS for styles and animations -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #00b4db, #0083b0); /* Gradient background */
            color: white;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        h2 {
            text-align: center;
            font-size: 36px;
            margin-bottom: 30px;
            animation: fadeIn 2s ease-in-out;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            opacity: 0;
            animation: slideIn 1s forwards ease-in-out;
        }

        table th, table td {
            padding: 15px;
            text-align: center;
        }

        table th {
            background-color: #333;
            font-size: 18px;
        }

        table td {
            background-color: rgba(255, 255, 255, 0.3);
        }

        table tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.1);
        }

        table tr:hover {
            background-color: rgba(255, 255, 255, 0.4);
            transform: scale(1.05);
            transition: all 0.3s ease-in-out;
        }

        /* Animation for the table sliding in */
        @keyframes slideIn {
            from {
                transform: translateX(-100%);
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        /* Animation for fading in the header */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Add a subtle shadow effect to the page */
        .container {
            padding: 30px;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.1);
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>All Employees</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>Department</th>
            </tr>
            <%
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeDB", "root", "password");

                    String sql = "SELECT * FROM Employees";
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt("ID") + "</td>");
                        out.println("<td>" + rs.getString("Name") + "</td>");
                        out.println("<td>" + rs.getInt("Age") + "</td>");
                        out.println("<td>" + rs.getString("Department") + "</td>");
                        out.println("</tr>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>Database error occurred!</p>");
                } finally {
                    try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
                    try { if (pstmt != null) pstmt.close(); } catch (SQLException ignored) {}
                    try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
                }
            %>
        </table>
    </div>

    <script>
        // Adding a smooth sliding animation to the table when it loads
        window.onload = function() {
            const table = document.querySelector('table');
            setTimeout(() => {
                table.style.transform = 'translateX(0)';
                table.style.opacity = '1';
            }, 200); // Delay the slide-in effect
        };
    </script>

</body>
</html>
