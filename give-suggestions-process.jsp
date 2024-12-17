<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<%
    // Retrieve form data
    int athleteId = Integer.parseInt(request.getParameter("athlete_id"));
    String suggestion = request.getParameter("suggestion");

    // Safely retrieve the coachId from the session
    Integer coachId = (Integer) session.getAttribute("userId");

    // Check if the coachId is valid
    if (coachId == null) {
        out.println("<script>alert('You must be logged in as a coach to give suggestions.'); window.location.href='login.jsp';</script>");
        return;
    }

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nutrition_planning", "root", "");

        // Insert the suggestion into the database
        String query = "INSERT INTO nutrition_suggestions (athlete_id, coach_id, suggestion) VALUES (?, ?, ?)";
        stmt = conn.prepareStatement(query);
        stmt.setInt(1, athleteId);
        stmt.setInt(2, coachId);
        stmt.setString(3, suggestion);

        int result = stmt.executeUpdate();

        if (result > 0) {
            out.println("<script>alert('Suggestion added successfully!'); window.location.href='coach-dashboard.jsp';</script>");
        } else {
            out.println("<script>alert('Failed to add suggestion. Please try again.'); window.location.href='give-suggestions.jsp';</script>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Error: " + e.getMessage() + "'); window.location.href='give-suggestions.jsp';</script>");
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
