<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import "java.sql.*, jakarta.servlet.http.*, jakarta.servlet.*"%>
    <%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1> EMPLOYEE MANAGEMENT SYSTEM</h1><hr><br>

   <form method="POST"></form>
   
    <h2><center>Signin</center></h2>
    <hr>
    <input type="email" name="email" placeholder="enter your email"><br><br>
    <input type="password" name="password" placeholder="enter your password"><br><br>
    <p> I don't have an account</p>
    </form>
    
    <%
    
    if (request.getParameter("submit") != null) {
    	String email = request.getParameter("email");
    	String password = request.getParameter("password");
    	
    	  String url = "jdbc:mysql://localhost:3306/emp_22rp04342";
          String user = "root"; 
          String pass = "";
          
          Connection conn = null;
          PreparedStatement pstmt = null;
          ResultSet rs = null;
          
          try{
        	  Class.forName("com.mysql.cj.jdbc.Driver");
        	  
        	  conn = DriverManager.getConnection(url,user,pass);
        	  
        	  
        	  String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        	  pstmt = conn.prepareStatement(sql);
              pstmt.setString(1, email);
              pstmt.setString(2, password); 
              rs = pstmt.executeQuery();
              
              
              if (rs.next()) {
            	  
            	  HttpSession session = request.getSession();
            	  session.setAttribute("usersEmail", email);
            	  
            	  out.println("<h3><Login Successful!!!</h3>");
            	  out.println("<p>Welcome, " + email + "!!!</p>");
            	  response.sendRedirect("dashboard.jsp");
              
              } else {
            	  out.println("<h3>Invalid email or password!</h3>");
            	
              }
              
          } catch (Exception e){
        	  out.println("<h3> Error: " + e.getMessage() + "</h3>");
        	  
          } finally {
        	  
        	//  if (rs != null) try {rs.close();} catch (SQLException e) {}
        	// if (pstmt != null) try {pstmt.close();} catch (SQLException e) {}
        	//  if (conn != null) try {conn.close();} catch (SQLException e) {}
        	  
          }
    }
    
    %>

</body>
</html>