<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<%
    String meal = request.getParameter("meal");
    int calories = Integer.parseInt(request.getParameter("calories"));
    int proteins = Integer.parseInt(request.getParameter("proteins"));
    int carbs = Integer.parseInt(request.getParameter("carbs"));
    int fats = Integer.parseInt(request.getParameter("fats"));
    int athleteId = (Integer) session.getAttribute("userId"); // Fixed casting

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nutrition_planning", "root", "");

        String query = "INSERT INTO nutrition_plans (athlete_id, meal, calories, proteins, carbs, fats) VALUES (?, ?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(query);
        stmt.setInt(1, athleteId);
        stmt.setString(2, meal);
        stmt.setInt(3, calories);
        stmt.setInt(4, proteins);
        stmt.setInt(5, carbs);
        stmt.setInt(6, fats);

        int result = stmt.executeUpdate();

        if (result > 0) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Nutritional plan created successfully!');");
            out.println("window.location.href = 'create-nutrition-plan.jsp';");
            out.println("</script>");
        } else {
            out.println("<script type='text/javascript'>");
            out.println("alert('Failed to create nutritional plan. Please try again later.');");
            out.println("window.location.href = 'create-nutrition-plan.jsp';");
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
