<html>
<body bgcolor="grey">
<%@page import="java.sql.*" %>
<br><br>
	
	<table align="center" width="1000px" border="1px">
		<tr>
			<th>ID</th>
			<th>Employee Name</th>
			<!-- <th>Password</th> -->  <!-- for dr. profile password is not required -->
			<!--  <th>Manager Name</th> -->
			<th>Phone</th>
			<th>email</th>	
			<th>days</th>	
			<th>Status</th>	
			<th>Department</th>	
			<th>Action</th>	
		</tr>
		
		<%	
		Connection con=null;
				
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		String url="jdbc:mysql://localhost:3306/mondee";
		String username="root";
		String password="root";
		
		con=DriverManager.getConnection(url, username, password);
		
		// GETTING SESSION VALUES FROM SERVER i.e(specialist)
//		int id=(Integer)session.getAttribute("id");   // we have to convert it into Object
		
		/* String specialist=(String)session.getAttribute("specialist");
		
		session.getAttribute("id");
		 *///session.getAttribute("specialist");
		
		 String dept=(String)session.getAttribute("dept");
		 
		PreparedStatement ps=con.prepareStatement("select * from apply_leave where dept=?");
	//	ps.setString(1,specialist);
		ps.setString(1,dept);
		
		
		ResultSet rs=ps.executeQuery();
			
		while(rs.next())
		{
			%>
			<tr style="text-align:center;"> <!--  for new line -->
			<td><%= rs.getInt(1)%></td>  <!-- rs.getInt(1) has appointment ID value -->
			<td><%= rs.getString("ename")%></td>
													<!-- <td><%-- <%= rs.getString(3)%> --%></td>  -->  <!-- for dr. profile password is not required -->
													<%-- <td><%= rs.getString("mname")%></td> --%>
			<td><%= rs.getString("phone")%></td>
			<td> <%= rs.getString("email")%></td>
			<td><%= rs.getString("days")%></td>
			<td><%= rs.getString("status")%></td>
			<td><%= rs.getString("dept")%></td>
			<td><a href="accept.jsp?lid=<%=rs.getInt(1)%>"> ACCEPT |<a href="reject.jsp?lid=<%=rs.getInt(1)%>"><font color="darkorange"> | REJECT</td>	
					
			</tr>
			<%
		}
	
		%>	
	</table>
	
	
	<br><br><br>
	<a href="index.html"><h2 align="center">Logout</h2></a>
</body>
</html>



<!-- 



leave_mgmt
	
	applied days	2
	remaining		20-2;	
	eid				
	ename
	status
	



 -->
















