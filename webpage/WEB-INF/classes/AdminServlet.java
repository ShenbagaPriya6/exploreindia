import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/mysql";
    static final String USER = "root";
    static final String PASS = "SHN2606";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String doctype = "<!DOCTYPE html>\n";

        out.println(doctype + "<html>\n" + "<body>\n"
                + "<h1>Form result</h1>\n");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            PreparedStatement st = conn.prepareStatement("INSERT INTO event_details (state, category, eventName, bookingPossibility,description) VALUES (?, ?, ?, ?,?)");
            st.setString(1, request.getParameter("state"));
            st.setString(2, request.getParameter("category"));
            st.setString(3, request.getParameter("eventName"));
            st.setString(4, request.getParameter("bookingPossibility"));
            st.setString(5, request.getParameter("description"));
            st.executeUpdate();
            out.println("<h6>Inserted Successfully</h6></body></html>");
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            out.println("<h6>Error: " + e.getMessage() + "</h6></body></html>");
            e.printStackTrace();
        }
    }
}
