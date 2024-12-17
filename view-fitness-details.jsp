<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Fitness Details - Nutrition Planning System</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Fitness Details</h1>
        <nav>
            <ul>
                <li><a href="coach-dashboard.jsp">Dashboard</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>

    <section class="main-content">
        <h2>All Fitness Details</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>Tracking ID</th>
                    <th>Athlete ID</th>
                    <th>Exercise</th>
                    <th>Duration (minutes)</th>
                    <th>Intensity</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Database connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nutrition_planning", "root", "");

                        // Fetch all fitness details
                        String query = "SELECT * FROM fitness_tracking ORDER BY date DESC";
                        stmt = conn.prepareStatement(query);
                        rs = stmt.executeQuery();

                        // Display data in table rows
                        while (rs.next()) {
                            int trackingId = rs.getInt("tracking_id");
                            int athleteId = rs.getInt("athlete_id");
                            String exercise = rs.getString("exercise");
                            int duration = rs.getInt("duration");
                            String intensity = rs.getString("intensity");
                            Timestamp date = rs.getTimestamp("date");

                            %>
                            <tr>
                                <td><%= trackingId %></td>
                                <td><%= athleteId %></td>
                                <td><%= exercise %></td>
                                <td><%= duration %></td>
                                <td><%= intensity %></td>
                                <td><%= date %></td>
                            </tr>
                            <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                        e.printStackTrace();
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
            </tbody>
        </table>
    </section>

    <footer>
        <p>&copy; 2024 Nutrition Planning System. All rights reserved.</p>
    </footer>
</body>
</html>
