👨‍💼HR VISION (Employee Management System ) – A Three-Tier Java Web Application

A complete web-based Employee Management System built using Java, JSP, Servlets, MySQL, and JDBC, following the three-tier architecture. This system allows you to add, view, and delete employees with a stylish UI and efficient backend processing.


---

🔍 Project Overview

The Employee Management System is designed to simplify the management of employee data through a clean and user-friendly interface. It supports basic CRUD operations (Create, Read, Delete) and stores employee information in a MySQL database.

💡 Built as part of a college project with a focus on:

Three-tier architecture (Presentation, Business Logic, and Data Access layers)

Servlet and JSP integration

Modular, maintainable code

Attractive and modern frontend interface



---

🎯 Features

✅ Add a new employee with full details
✅ View all employee records in a tabular format
✅ Delete employee by ID
✅ Responsive and modern JSP user interface
✅ Organized three-tier architecture


---

💻 Technologies Used

Java (Servlets, JDBC)

JSP (Java Server Pages)

HTML5 & CSS3 (Frontend styling)

MySQL (Database)

Apache Tomcat (Web Server)

NetBeans (IDE)



---

🧩 Project Architecture

Three-Tier Structure:

1. 🖥 Presentation Layer (View)

index.jsp, addEmployee.jsp, viewEmployees.jsp



2. 🧠 Business Logic Layer (Controller)

AddEmployeeServlet.java

ViewAllEmployeesServlet.java

DeleteEmployeeServlet.java



3. 💾 Data Access Layer (Model)

Employee.java (model class)

EmployeeDAO.java (database operations)





---

🗃 Database

Database: employee_management

Table: employees

📄 Table structure:

Column	Type

id	INT (Primary)
name	VARCHAR(100)
age	INT
department	VARCHAR(100)
email	VARCHAR(100)


📌 Sample SQL setup is included in employee_management.sql.


---

🧪 How to Run the Project

1. Install Apache Tomcat & MySQL


2. Create the database using employee_management.sql


3. Import the project into NetBeans or any Java IDE


4. Configure your MySQL database username & password in EmployeeDAO.java


5. Build and deploy the project on Tomcat


6. Open your browser and go to: http://localhost:8080/EmployeeManagementSystem/


🧠 Learning Outcomes

✅ Understood the structure of enterprise-level applications
✅ Learned servlet-JSP communication
✅ Implemented MVC (Model View Controller) in Java
✅ Handled database connections using JDBC
✅ Designed responsive JSP pages


---

📌 Folder Structure

. ├── src/
│   ├── controller/ (Servlets)
│   ├── model/ (DAO & JavaBeans)
├── web/
│   ├── index.jsp
│   ├── addEmployee.jsp
│   ├── viewEmployees.jsp
├── lib/ (JARs)
│   └── mysql-connector.jar
├── employee_management.sql
└── README.md


---

🚀 Future Improvements

Edit/Update employee details

Login authentication for admin

Pagination and search filters

RESTful API for mobile integration



---

🙋‍♂ Author

Sarathy p — Integrated M.Tech (CSE - Data Science)
