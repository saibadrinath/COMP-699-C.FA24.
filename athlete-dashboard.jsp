<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Athlete Dashboard - Nutrition Planning System</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Athlete Dashboard</h1>
        <nav>
            <ul>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>

    <section class="main-content">
        <h2>Welcome, <%= session.getAttribute("email") %>!</h2>
        <div>
            <h3>Manage Your Nutrition</h3>
            <ul>
                <li><a href="create-nutrition-plan.jsp">Create Nutritional Plan</a></li>
                <li><a href="view-coach-suggestions.jsp">View Suggestions from Coaches</a></li>
                <li><a href="track-fitness.jsp">Track Fitness</a></li>
            </ul>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 Nutrition Planning System. All rights reserved.</p>
    </footer>
</body>
</html>
