<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="style.css">
<title>EMS</title>

</head>
<body>
<h1> EMPLOYEE MANAGEMENT SYSTEM</h1>

   <form method="POST">
   
   <h2><center>SIGNUP</center></h2>
   <hr><br>
   <input type="text" name="username" placeholder="Enter your Username">
    <br><br>
    <input type="email" name="email" placeholder="Enter your email">
    <br><br>
    <input type="password" name="password" placeholder="Enter your Password">
    <br><br>
   <button name="submit">SignUp</button>
   </form>
   
   <%
      if (request.getParameter("submit") != null) {
    	  String username = request.getParameter("username");
    	  String email = request.getParameter("email");
    	  String password = request.getParameter("password");
    	  
    	  
    	  String url="jdbc:mysql://localhost:3306/emp_22rp04342";
    	  String user = "root";
    	  String pass = "";
    	  
    	  Connection conn = null;
    	  PreparedStatement pstmt = null;
    	  
    	  try {
    		  
    		  Class.forName("com.mysql.cj.jdbc.Driver");
    		  conn = DriverManager.getConnection(url,user,pass);
    		  
    		  
    		  String sql = "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";
    		  pstmt = conn.prepareStatement(sql);
    		  pstmt.setString(1, username);
              pstmt.setString(2, email);
              pstmt.setString(3, password);
    		  pstmt.executeUpdate();
    		  
    		  out.println("<h3>Signup Successful!!!</h3>");
    		  response.sendRedirect("index.jsp");
    		  
    	  }  catch (Exception e) {
    		  out.println("<h3>Error: "+ e.getMessage()+ "</h3>");
    	  } finally {
    		  if (pstmt != null) try{ pstmt.close(); } catch (SQLException e){}
    		  if (conn != null) try{ conn.close(); } catch (SQLException e){}
    	  }
      }
   
   
   %>


</body>
</html>