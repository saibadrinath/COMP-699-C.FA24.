<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Nutritional Plans - Nutrition Planning System</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Nutritional Plans</h1>
        <nav>
            <ul>
                <li><a href="coach-dashboard.jsp">Dashboard</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>

    <section class="main-content">
        <h2>All Nutritional Plans</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>Plan ID</th>
                    <th>Athlete ID</th>
                    <th>Meal</th>
                    <th>Calories</th>
                    <th>Proteins</th>
                    <th>Carbs</th>
                    <th>Fats</th>
                    <th>Created At</th>
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

                        // Fetch all nutritional plans
                        String query = "SELECT * FROM nutrition_plans ORDER BY created_at DESC";
                        stmt = conn.prepareStatement(query);
                        rs = stmt.executeQuery();

                        // Display data in table rows
                        while (rs.next()) {
                            int planId = rs.getInt("plan_id");
                            int athleteId = rs.getInt("athlete_id");
                            String meal = rs.getString("meal");
                            int calories = rs.getInt("calories");
                            int proteins = rs.getInt("proteins");
                            int carbs = rs.getInt("carbs");
                            int fats = rs.getInt("fats");
                            Timestamp createdAt = rs.getTimestamp("created_at");

                            %>
                            <tr>
                                <td><%= planId %></td>
                                <td><%= athleteId %></td>
                                <td><%= meal %></td>
                                <td><%= calories %></td>
                                <td><%= proteins %></td>
                                <td><%= carbs %></td>
                                <td><%= fats %></td>
                                <td><%= createdAt %></td>
                            </tr>
                            <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>");
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
