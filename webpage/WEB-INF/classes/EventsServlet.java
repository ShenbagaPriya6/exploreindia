import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
@WebServlet("/EventsServlet")
public class EventsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/mysql";
    static final String USER = "root";
    static final String PASS = "SHN2606";
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        String stateName = request.getParameter("state");
        String categoryName = request.getParameter("category");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            PreparedStatement stmt = conn.prepareStatement("SELECT eventName, bookingPossibility, description FROM event_details WHERE state=? AND category=?");
            stmt.setString(1, stateName);
            stmt.setString(2, categoryName);
            ResultSet rs = stmt.executeQuery();
            List<Event> events = new ArrayList<>();
            while (rs.next()) {
                String eventName = rs.getString("eventName");
                String bookingPossibility = rs.getString("bookingPossibility");
                String description = rs.getString("description");
                events.add(new Event(eventName, bookingPossibility, description));
            }
            JSONArray jsonArray = new JSONArray();
            for (Event event : events) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("eventName", event.getEventName());
                jsonObject.put("bookingPossibility", event.getBookingPossibility());
                jsonObject.put("description", event.getDescription());
                jsonArray.put(jsonObject);
            }
            String json = jsonArray.toString();
            out.println(json);
            rs.close();
            stmt.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            JSONObject errorJson = new JSONObject();
            errorJson.put("error", e.getMessage());
            out.println(errorJson.toString());
        }
    }
    class Event {
        private String eventName;
        private String bookingPossibility;
        private String description;

        public Event(String eventName, String bookingPossibility,String description) {
            this.eventName = eventName;
            this.bookingPossibility = bookingPossibility;
            this.description=description;
        }
        public String getEventName() {
            return eventName;
        }
        public String getBookingPossibility() {
            return bookingPossibility;
        }
         public String getDescription() {
            return description;
        }
    }
}

