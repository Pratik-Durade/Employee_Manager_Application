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
	
	String fn=request.getParameter("first_name");
	String ln=request.getParameter("last_name");
	String email=request.getParameter("email");
	String pass=request.getParameter("password");
	String phone=request.getParameter("phone");
		long mobile=Long.parseLong(phone);
	String sal=request.getParameter("salary");
		int salary=Integer.parseInt(sal);
	
	String dept=request.getParameter("department");
	String address=request.getParameter("address");
		
	String query="insert into employee (first_name,last_name,email,password,phone,salary,dept,address) values(?,?,?,?,?,?,?,?)";

	pst=con.prepareStatement(query);
	pst.setString(1, fn);
	pst.setString(2, ln);
	pst.setString(3, email);
	pst.setString(4, pass);
	pst.setLong(5, mobile);
	pst.setInt(6, salary);
	pst.setString(7, dept);
	pst.setString(8, address);
	int count=pst.executeUpdate();
	
	if(count!=0)
		response.sendRedirect("employee_login.html");

%>
	<h1 align="center">Registered Successfully...</h1>
</body>
</html>
</html>
