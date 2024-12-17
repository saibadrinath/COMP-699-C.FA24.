<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coach Dashboard - Nutrition Planning System</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Coach Dashboard</h1>
        <nav>
            <ul>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>

    <section class="main-content">
        <h2>Welcome, Coach <%= session.getAttribute("email") %>!</h2>
        <div>
            <h3>Coach Options</h3>
            <ul>
                <li><a href="view-nutritional-plans.jsp">View Nutritional Plans</a></li>
                <li><a href="give-suggestions.jsp">Give Suggestions</a></li>
                <li><a href="view-fitness-details.jsp">View Fitness Details</a></li>
            </ul>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 Nutrition Planning System. All rights reserved.</p>
    </footer>
</body>
</html>
