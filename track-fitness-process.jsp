<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<%
    String exercise = request.getParameter("exercise");
    int duration = Integer.parseInt(request.getParameter("duration"));
    String intensity = request.getParameter("intensity");
    int athleteId = (Integer) session.getAttribute("userId"); // Fixed casting
    
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nutrition_planning", "root", "");

        String query = "INSERT INTO fitness_tracking (athlete_id, exercise, duration, intensity) VALUES (?, ?, ?, ?)";
        stmt = conn.prepareStatement(query);
        stmt.setInt(1, athleteId);
        stmt.setString(2, exercise);
        stmt.setInt(3, duration);
        stmt.setString(4, intensity);

        int result = stmt.executeUpdate();

        if (result > 0) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Fitness data tracked successfully!');");
            out.println("window.location.href = 'track-fitness.jsp';");
            out.println("</script>");
        } else {
            out.println("<script type='text/javascript'>");
            out.println("alert('Failed to track fitness. Please try again later.');");
            out.println("window.location.href = 'track-fitness.jsp';");
            out.println("</script>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
