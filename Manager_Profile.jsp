<html>
<body bgcolor="cyan">
<%@page import="java.sql.*" %>
<br><br>
	
	<table align="center" width="1000px" border="1px">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<!-- <th>Password</th> -->  <!-- for dr. profile password is not required -->
			<th>Email</th>
			<th>Phone</th>
			<th>Department</th>
			<th>Address</th>	
		</tr>
		
		<%	
		Connection con=null;
		PreparedStatement ps=null;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		String url="jdbc:mysql://localhost:3306/mondee";
		String username="root";
		String password="root";
		
		con=DriverManager.getConnection(url, username, password);
		
		// GETTING SESSION VALUES FROM SERVER (session value is created in Login_manager.jsp)
		int id=(Integer)session.getAttribute("id");   // we have to convert it into Object
		// session.getAttribute("id");
//		session.getAttribute("specialist");
		
		
		ps=con.prepareStatement("select * from manager where id=?");
		ps.setInt(1, id);
		
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			%>
			<tr style="text-align:center;"> <!--  for new line -->
			<td><%= rs.getInt(1)%></td>
			<td><%= rs.getString(2)%></td>
			<!-- <td><%= rs.getString(3)%></td>  -->  <!-- for dr. profile password is not required -->
			<td><%= rs.getString(3)%></td>
			<td><%= rs.getString(5)%></td>
			<td><%= rs.getString(7)%></td>
			<td><%= rs.getString(6)%></td>
			</tr>
			<%
		}
	
		%>	
	</table>	
	
	<br><br><br>
	<a href="index.html"><h2 align="center">Logout</h2></a>
</body>
</html>