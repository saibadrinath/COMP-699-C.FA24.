<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Nutritional Plan - Nutrition Planning System</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Create Nutritional Plan</h1>
        <nav>
            <ul>
                <li><a href="athlete-dashboard.jsp">Dashboard</a></li>
            </ul>
        </nav>
    </header> 

    <section class="main-content">
        <form action="create-nutrition-plan-process.jsp" method="POST">
            <label for="meal">Meal:</label>
            <input type="text" id="meal" name="meal" required>

            <label for="calories">Calories:</label>
            <input type="number" id="calories" name="calories" required>

            <label for="proteins">Proteins:</label>
            <input type="number" id="proteins" name="proteins" required>

            <label for="carbs">Carbs:</label>
            <input type="number" id="carbs" name="carbs" required>

            <label for="fats">Fats:</label>
            <input type="number" id="fats" name="fats" required>

            <button type="submit">Create Plan</button>
        </form>
    </section>

    <footer>
        <p>&copy; 2024 Nutrition Planning System. All rights reserved.</p>
    </footer>
</body>
</html>
