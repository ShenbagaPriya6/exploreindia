<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up Process</title>
</head>
<body>
    <% 
        String newUsername = request.getParameter("newUsername");
        session.setAttribute("user",newUsername);
        String newEmail = request.getParameter("newEmail");
        String newPassword = request.getParameter("newPassword");
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "SHN2606");

            String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, newUsername);
            stmt.setString(2, newEmail);
            stmt.setString(3, newPassword);
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
    %>
    <script>
        window.location.href = "map.jsp";
    </script>
    <%      } else {
                out.println("<h2>Error: Signup failed</h2>");
            }
        } catch (SQLException | ClassNotFoundException e) {
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
            e.printStackTrace(); 
        } 
    %>
</body>
</html>
