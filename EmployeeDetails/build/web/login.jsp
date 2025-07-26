<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HR VISION!!! - Login</title>
    
    <!-- Bootstrap 4.5.2 for responsiveness -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- Google Fonts for modern typography -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        /* Background Image - Ensure the path is correct */
        body {
            font-family: 'Poppins', sans-serif;
            background: url('images/manjummel-boys-ott.png') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }
        
        /* Dark Overlay for Readability */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: 1;
        }
        
        /* HR Vision Title */
        .header-container {
            position: absolute;
            top: 20px;
            width: 100%;
            text-align: center;
            z-index: 10;
        }
        .header-container h1 {
            font-size: 42px;
            font-family: 'Montserrat', sans-serif;
            font-weight: 700;
            color: #fff;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3);
        }
        
        /* Glassmorphism Effect */
        .login-container {
            position: relative;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            padding: 40px;
            width: 100%;
            max-width: 400px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(255, 255, 255, 0.2);
            text-align: center;
            transition: transform 0.3s ease-in-out;
            z-index: 11;
        }

        .login-container:hover {
            transform: translateY(-5px);
        }
        
        h2 {
            color: #fff;
            font-size: 28px;
            font-weight: 700;
        }
        
        .form-group label {
            color: #fff;
            font-weight: 500;
        }
        
        .form-control {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            border-radius: 8px;
            padding: 12px;
            color: #fff;
            transition: all 0.3s ease;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.3);
            outline: none;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
        }
        
        .btn {
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            color: #fff;
            border: none;
            padding: 12px;
            width: 100%;
            font-size: 18px;
            border-radius: 8px;
            margin-top: 20px;
            transition: all 0.3s ease;
        }
        
        .btn:hover {
            background: linear-gradient(135deg, #ff4b2b, #ff416c);
            transform: scale(1.05);
        }
        
        .text-danger {
            font-weight: bold;
            color: #ff4b2b;
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    
    <!-- HR Vision Title -->
    <div class="header-container">
        <h1>HR VISION</h1>
    </div>
    
    <div class="container login-container">
        <h2>Login to Your Account</h2>
        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Login</button>
        </form>
        <%
            String message = request.getParameter("message");
            if (message != null) {
                out.println("<p class='text-danger'>" + message + "</p>");
            }
        %>
    </div>
</body>
</html>