<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Track Fitness - Nutrition Planning System</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body> 
    <header>
        <h1>Track Your Fitness</h1>
        <nav>
            <ul>
                <li><a href="athlete-dashboard.jsp">Dashboard</a></li>
            </ul>
        </nav>
    </header>

    <section class="main-content">
        <h2>Fitness Progress</h2>
        <form action="track-fitness-process.jsp" method="POST">
            <label for="exercise">Exercise:</label>
            <input type="text" id="exercise" name="exercise" required>

            <label for="duration">Duration (minutes):</label>
            <input type="number" id="duration" name="duration" required>

            <label for="intensity">Intensity:</label>
            <input type="text" id="intensity" name="intensity" required>

            <button type="submit">Track Fitness</button>
        </form>
    </section>

    <footer>
        <p>&copy; 2024 Nutrition Planning System. All rights reserved.</p>
    </footer>
</body>
</html>
