<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Process</title>
</head>
<body>
    <% 
        String username = request.getParameter("Username");
        session.setAttribute("user",username);
        String password = request.getParameter("Password");
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "SHN2606");

            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();
            if (rs.next()) {
    %>
    <script>
        window.location.href = "map.jsp";
    </script>
    <%      } else {
              
    %>
    <script>
        alert("Username or password is incorrect. Please try again.");
        window.history.back(); 
    </script>
    <%      }
        } catch (SQLException | ClassNotFoundException e) {
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
            e.printStackTrace(); // Print stack trace for debugging
        } 
    %>
</body>
</html>
