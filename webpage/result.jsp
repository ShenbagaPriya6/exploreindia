<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Quiz Result</title>
    <link rel="icon" type="image/x-icon" href="india.png">
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        .form-container {
            width: 50%;
            margin: 0 auto;
            text-align: left;
            padding: 20px;
            background-color: #f8f8f8;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>
    <header>
        <h1>Test Yourself !!</h1>
    </header>
    <h1 style="text-align:center;">Quiz Result</h1>
    <div class="form-container">
        <%
            int score=0;
            if("c".equals(request.getParameter("q1"))){
                score++;
            }
            if("b".equals(request.getParameter("q2"))){
                score++;
            }
            if("c".equals(request.getParameter("q3"))){
                score++;
            }
            if("c".equals(request.getParameter("q4"))){
                score++;
            }
            if("a".equals(request.getParameter("q5"))){
                score++;
            }
            if("d".equals(request.getParameter("q6"))){
                score++;
            }
            out.println("<p style='text-align:center;'>Your score is:"+score+"</p>");  
        %>
    </div>
    <br>
    <a href="map.html" style="text-align:center;color:black">Go Back</h1>
</body>
</html>