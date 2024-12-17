<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Give Suggestions - Nutrition Planning System</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Give Suggestions</h1>
        <nav>
            <ul>
                <li><a href="coach-dashboard.jsp">Dashboard</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>

    <section class="main-content">
        <h2>Provide Suggestions for an Athlete</h2>
        <form action="give-suggestions-process.jsp" method="POST">
            <label for="athlete-id">Athlete ID:</label>
            <input type="number" id="athlete-id" name="athlete_id" required>

            <label for="suggestion">Suggestion:</label>
            <textarea id="suggestion" name="suggestion" rows="5" cols="30" required></textarea>

            <button type="submit">Submit Suggestion</button>
        </form>
    </section>

    <footer>
        <p>&copy; 2024 Nutrition Planning System. All rights reserved.</p>
    </footer>
</body>
</html>
