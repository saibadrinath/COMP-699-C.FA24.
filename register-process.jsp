<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<%
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String role = request.getParameter("role");
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    try {
        // Connect to the database
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nutrition_planning", "root", "");
        
        // Check if the email already exists
        stmt = conn.prepareStatement("SELECT * FROM users WHERE email = ?");
        stmt.setString(1, email);
        rs = stmt.executeQuery();
        
        if (rs.next()) {
            out.println("<p>Email already registered. Please try another one.</p>");
        } else {
            // Insert new user into the database
            stmt = conn.prepareStatement("INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)");
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, role);
            int result = stmt.executeUpdate();
            
            if (result > 0) {
                out.println("<p>Registration successful! You can now <a href='login.jsp'>log in</a>.</p>");
            } else {
                out.println("<p>Registration failed. Please try again.</p>");
            }
        }
        
    } catch (Exception e) {
        e.printStackTrace();
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
