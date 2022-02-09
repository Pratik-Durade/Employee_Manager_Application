<html>
<body bgcolor="cyan">
<%@page import="java.sql.*"%>

<%
Connection con=null;
PreparedStatement pst=null;
Class.forName("com.mysql.cj.jdbc.Driver");

String url="jdbc:mysql://localhost:3306/mondee";
String username="root";
String password="root";

con=DriverManager.getConnection(url, username, password);

System.out.println("\n\n \tDATA ADDED SUCCESSFULLY... \n");
	
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String pass=request.getParameter("password");
	
	String phone=request.getParameter("phone");
		long mobile=Long.parseLong(phone);
		
	String address=request.getParameter("address");
	String dept=request.getParameter("department");
		
	String query="insert into manager (name,email,password,phone,address,dept) values(?,?,?,?,?,?)";

	pst=con.prepareStatement(query);
	pst.setString(1, name);
	pst.setString(2, email);
	pst.setString(3, pass);
	pst.setLong(4, mobile);
	pst.setString(5, address);
	pst.setString(6, dept);
	int count=pst.executeUpdate();
	
	if(count!=0)
		
		response.sendRedirect("./manager_login.html");

%>
	//<h1 align="center">Registered Successfully...</h1>
</body>
</html>
</html>
