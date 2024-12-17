<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coach Suggestions - Nutrition Planning System</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Suggestions from Coaches</h1>
        <nav>
            <ul>
                <li><a href="athlete-dashboard.jsp">Dashboard</a></li>
            </ul>
        </nav>
    </header>

    <section class="main-content">
        <h2>Suggestions for You</h2>
        <%
    // Fetch suggestions from the database
    int athleteId = (Integer) session.getAttribute("userId"); // Fixed casting
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nutrition_planning", "root", "");
        String query = "SELECT * FROM nutrition_suggestions WHERE athlete_id = ?";
        stmt = conn.prepareStatement(query);
        stmt.setInt(1, athleteId);
        rs = stmt.executeQuery();

        while (rs.next()) {
            String suggestion = rs.getString("suggestion");
            out.println("<p>" + suggestion + "</p>");
        }
    } catch (Exception e) {
        out.println("<p>Error occurred: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

    </section>

    <footer>
        <p>&copy; 2024 Nutrition Planning System. All rights reserved.</p>
    </footer>
</body>
</html>
