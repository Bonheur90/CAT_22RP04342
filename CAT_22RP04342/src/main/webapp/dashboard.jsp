<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="dash.css">
<title>Employee Recorded</title>
</head>
<body><br><br>

<button><a href="employee.jsp" style="text-decoration:none;" class="active">Add new Employee</a></button>
<button><a href="retrieve.jsp" style="text-decoration:none;" class="active">Retrieve</a></button>
<div class="logout"><button><a href="logout.jsp" style="text-decoration:none;">Log Out</a></button><br><br><br>

</div>

<hr>
<center>

<p><b>
List of Recorded Employees!!!
</b></p>

<table border="1">
 <tr>
  <th>Emplyee Code</th>
  <th>Emplyee Name </th>
  <th>Emplyee Address</th>
  <th>Emplyee phone</th>
  <th colspan="2">ACTION</th>
   
 </tr>
 <%
 String url="jdbc:mysql://localhost:3306/emp_22rp04342";
 String user = "root";
 String pass = "";
 
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      
      try {
    	  Class.forName("com.mysql.cj.jdbc.Driver");
    	  conn = DriverManager.getConnection(url,user,pass);
    	  stmt = conn.createStatement();
    	  String sql = "SELECT* FROM employee";
    	  rs = stmt.executeQuery(sql);
    	  
    	  while (rs.next()){
    		  int id = rs.getInt("employeecode");
    		  String name = rs.getString("employeename");
    		  String address = rs.getString("employeeaddress");
    		  int phone = rs.getInt("employeephone");
    		  
 %>
         <tr>  
         
         <td> <%= id %> </td>
         <td> <%= name %> </td>
         <td> <%= address %> </td>
         <td> <%= phone %> </td>
         <td><a href="update.jsp?employeecode= <%= id %>">Update</a> </td>
         <td><a href="delete.jsp?employeecode= <%= id %>">Delete</a> </td>
         
         </tr>
  <%
  
    	  }
      } catch (Exception e) {
    	  e.printStackTrace();
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
         }
 
 
 
 
 
</table>

</center>


</body>
</html>