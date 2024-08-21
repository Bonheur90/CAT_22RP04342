<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import= "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="style.css">
<title>Insert title here</title>
</head>
<body>
<h1>EMPLOYEE MANAGEMENT SYSTEM</h1><br>
<form method="POST">
<h2>Insert an Employee</h2>
<hr>
<input type="text" name="name" placeholder="enter employee name">
<br><br>
<input type="address" name="address" placeholder="enter your address">
<br><br>
<input type="phone" name="phone" placeholder="enter phone number">
<br><br>
<button name="submit">Send</button>

</form>

    <%
        if ( request.getParameter("submit") != null) {
        	String name = request.getParameter("name");
        	String address = request.getParameter("address");
        	String phone = request.getParameter("phone");
        	
        	String url="jdbc:mysql://localhost:3306/emp_22rp04342";
      	  String user = "root";
      	  String pass = "";
      	  
      	 Connection conn = null;
   	  PreparedStatement pstmt = null;
   	  
   	     try {
   	    	 
   	    	 Class.forName("com.mysql.cj.jdbc.Driver");
   		  conn = DriverManager.getConnection(url,user,pass);
   		  
   		  String sql = "INSERT INTO employee (employeename,address,phone) VALUES (?, ?, ?)";
   		  pstmt = conn.prepareStatement(sql);
   		  pstmt = setString(1, name);
   		  pstmt = setString(2, address);
   		  pstmt = setString(3, phone);
   		  
   		  pstmt = executeUpdate();
   		  
   		  out.println("<h3>New employee is Recorded Successful!!!</h3>");
		  out.println("<p>Name:" + name + "</p>");
		  response.sendRedirect("dashboard.jsp");
		  
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