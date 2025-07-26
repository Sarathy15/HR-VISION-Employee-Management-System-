<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
</head>
<body>
    <h2>Add New Employee</h2>
    <form action="AddEmployeeServlet" method="post">
        <label for="employeeName">Employee Name:</label>
        <input type="text" id="employeeName" name="employeeName" required><br><br>

        <label for="employeeAge">Employee Age:</label>
        <input type="number" id="employeeAge" name="employeeAge" required><br><br>

        <label for="employeeDepartment">Employee Department:</label>
        <input type="text" id="employeeDepartment" name="employeeDepartment" required><br><br>

        <button type="submit">Add Employee</button>
    </form>
</body>
</html>