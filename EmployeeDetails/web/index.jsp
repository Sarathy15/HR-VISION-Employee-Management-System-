<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    // Check for an existing session; if it doesn't exist, redirect to login page.
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp?message=Please%20login%20first");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #eef2f3;
            font-family: 'Arial', sans-serif;
            color: #333;
        }
        .header {
            text-align: center;
            padding: 40px;
            background: linear-gradient(to right, #4a90e2, #9013fe);
            color: white;
            border-radius: 0 0 20px 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .icon-box {
            transition: transform 0.3s, box-shadow 0.3s;
            text-align: center;
            margin: 20px;
            padding: 20px;
            border-radius: 15px;
            background: white;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        .icon-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }
        .icon {
            font-size: 60px;
            color: #4a90e2;
            margin-bottom: 15px;
        }
        .btn {
            width: 100%;
            font-size: 18px;
            border-radius: 25px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #3e8e41; /* Change color on hover */
            color: white;
        }
        .result {
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
        }
        @media (max-width: 768px) {
            .icon-box {
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>

<div class="header">
    <h2>HR VISION~Employee Management System</h2>
    <p>Manage your employee details efficiently!  - Designed by Team Nangathan!!!</p>
    <div class="text-right">
        <a href="LogoutServlet" class="btn btn-outline-secondary">Logout</a>
    </div>
</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-3 icon-box">
            <i class="fas fa-user-plus icon"></i>
            <h5>Add Employee</h5>
            <button class="btn btn-primary" onclick="toggleSection('addEmployee')">Add Employee</button>
            <div id="addEmployee" class="d-none">
                <form action="AddEmployeeServlet" method="post" class="mt-2">
                    <div class="form-group">
                        <label for="employeeName">Employee Name:</label>
                        <input type="text" class="form-control" id="employeeName" name="employeeName" required>
                    </div>
                    <div class="form-group">
                        <label for="employeeAge">Employee Age:</label>
                        <input type="number" class="form-control" id="employeeAge" name="employeeAge" required>
                    </div>
                    <div class="form-group">
                        <label for="employeeDepartment">Employee Department:</label>
                        <input type="text" class="form-control" id="employeeDepartment" name="employeeDepartment" required>
                    </div>
                    <button type="submit" class="btn btn-success">Add</button>
                </form>
            </div>
        </div>

        <div class="col-md-3 icon-box">
            <i class="fas fa-user-check icon"></i>
            <h5>Get Employee</h5>
            <button class="btn btn-secondary" onclick="toggleSection('getEmployee')">Get Employee</button>
            <div id="getEmployee" class="d-none">
                <form action="GetEmployeeServlet" method="post" class="mt-2">
                    <div class="form-group">
                        <label for="employeeId">Employee ID:</label>
                        <input type="number" class="form-control" id="employeeId" name="employeeId" required>
                    </div>
                    <button type="submit" class="btn btn-info">Get Employee</button>
                </form>
            </div>
        </div>

        <div class="col-md-3 icon-box">
            <i class="fas fa-list icon"></i>
            <h5>View All Employees</h5>
            <form action="ViewAllEmployeesServlet" method="post">
                <button type="submit" class="btn btn-warning">View All Employees</button>
            </form>
        </div>

        <div class="col-md-3 icon-box">
            <i class="fas fa-user-slash icon"></i>
            <h5>Delete Employee</h5>
            <button class="btn btn-danger" onclick="toggleSection('deleteEmployee')">Delete Employee</button>
            <div id="deleteEmployee" class="d-none">
                <form action="DeleteEmployeeServlet" method="post" class="mt-2">
                    <div class="form-group">
                        <label for="employeeIdToDelete">Employee ID:</label>
                        <input type="number" class="form-control" id="employeeIdToDelete" name="employeeId" required>
                    </div>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>

    <div class="result">
        <% 
            String message = request.getParameter("message");
            if (message != null) {
                out.println("<h4>" + message + "</h4>");
            }
        %>
    </div>
</div>

<script>
    function toggleSection(sectionId) {
        var section = document.getElementById(sectionId);
        section.classList.toggle('d-none');
    }
</script>

</body>
</html>