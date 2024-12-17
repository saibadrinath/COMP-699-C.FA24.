<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    
    // Declare database connection and statement objects
    Connection conn = null;
    PreparedStatement stmt = null; 
    ResultSet rs = null;
    
    try {
        // Load MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Establish database connection
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nutrition_planning", "root", "");
        
        // Prepare SQL query to check user credentials
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, email);
        stmt.setString(2, password);
        rs = stmt.executeQuery();
        
        if (rs.next()) {
            // If user is found, retrieve their role and user ID
            String role = rs.getString("role");
            int userId = rs.getInt("user_id");
            
            // Store user data in session for further access
            session.setAttribute("userId", userId);
            session.setAttribute("email", email);
            session.setAttribute("role", role);
            
            // Redirect based on user role
            if ("athlete".equals(role)) {
                response.sendRedirect("athlete-dashboard.jsp");
            } else if ("coach".equals(role)) {
                response.sendRedirect("coach-dashboard.jsp");
            }
        } else {
            out.println("<p>Invalid login credentials. Please try again.</p>");
        }
        
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error occurred: " + e.getMessage() + "</p>");
    } finally {
        // Close resources in the finally block to avoid resource leakage
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
