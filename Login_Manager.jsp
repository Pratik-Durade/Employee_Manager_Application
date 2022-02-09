<html>
<body bgcolor="grey">
<%@page import="java.sql.*" %>

<%
Connection con=null;
PreparedStatement ps=null;

Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/mondee";
String un="root";
String pass="root";

con=DriverManager.getConnection(url, un, pass);

String username=request.getParameter("name");
String password=request.getParameter("password");



String query="select * from manager where name=? and password=? ";

ps=con.prepareStatement(query);
ps.setString(1,username);
ps.setString(2,password );

	// SETTING SESSION VALUE
		
ResultSet rs=ps.executeQuery();

	if(rs.next())
		session.setAttribute("id",rs.getInt(1));
		session.setAttribute("dept",rs.getString(7));
		
		response.sendRedirect("manager_home.html");
	/* 	// CREATING SEESION VALUES FOR APPLY APPOINTMENT PAGE AND ALL PAGES ALSO
		session.setAttribute("id", rs.getInt(1));		// patient id from patient table */
		
		//response.sendRedirect("./patient_home.html");

%>
<h1>Wrong Username or Password!</h1>
</body>
</html>