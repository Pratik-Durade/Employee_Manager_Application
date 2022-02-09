<html>
<body bgcolor="grey">
<%@page import="java.sql.*" %>
<br><br>
	
	<table align="center" width="1000px" border="1px">
		<tr>
			<th>ID</th>
			<th>Applied Days</th>
			<th>Remaining Days</th>
			<th>Emp-ID</th>	
			<th>Emp-Name</th>	
			<th>Status</th>	
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
		
		// String dept=(String)session.getAttribute("dept");
		 
		
		
		// int remaining_days=20;
				
		int id=(Integer)session.getAttribute("id");
		/*String ename=(String)session.getAttribute("ename");
		String applied_days=(String)session.getAttribute("days");
		String remaining_days=(String)session.getAttribute("remaining_days");
		String status=(String)session.getAttribute("status"); */
				
		PreparedStatement ps=con.prepareStatement("select * from leave_mgmt where eid=?");
	//	ps.setString(1,specialist);
	//	ps.setString(1,dept);
	
		ps.setInt(1,id);
		ResultSet rs=ps.executeQuery();
		
		// session.setAttribute("status",rs.getInt(9));
		// session.setAttribute("days",rs.getInt(7));
		
		while(rs.next())
		{
			%>
			<tr style="text-align:center;"> <!--  for new line -->
			<td><%= rs.getInt(1)%></td>  <!-- rs.getInt(1) has appointment ID value -->
			<td><%= rs.getInt("applied_days")%></td>
													<!-- <td><%-- <%= rs.getString(3)%> --%></td>  -->  <!-- for dr. profile password is not required -->
													<%-- <td><%= rs.getString("mname")%></td> --%>
			<td><%= rs.getInt("remaining_days")%></td>
			<td> <%= rs.getInt(4)%></td>
			<td><%= rs.getString(5)%></td>
			<td><%= rs.getString(6)%></td>
			<%-- <td><%= rs.getString(6)%></td> --%>
		<%-- <td><a href="accept.jsp?lid=<%=rs.getInt(1)%>"> ACCEPT |<a href="reject.jsp?lid=<%=rs.getInt(1)%>"><font color="darkorange"> | REJECT</td>	 --%>		
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
















