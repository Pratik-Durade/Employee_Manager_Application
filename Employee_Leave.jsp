<html>
<body bgcolor="grey">
<%@page import="java.sql.*" %>

<%
Connection con=null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/mondee";
String un="root";
String pass="root";

con=DriverManager.getConnection(url, un, pass);

String ename=request.getParameter("ename");

String phone=request.getParameter("phone");
long mobile=Long.parseLong(phone);

String email=request.getParameter("email");
String no_of_days=request.getParameter("days");

int days=Integer.parseInt(no_of_days);

String dept=request.getParameter("department");

String sql="insert into apply_leave(id,ename,mname,phone,email,days,dept,status) values(?,?,?,?,?,?,?,?)";

		int eid=(Integer)session.getAttribute("id");  // GETTING SESSION VALUE FROM Login_Employee.jsp

PreparedStatement ps=con.prepareStatement(sql);

ps.setInt(1,eid);
ps.setString(2,ename);
ps.setString(3,"None");		// don't know which doctor will accept the req.
ps.setLong(4,mobile);
ps.setString(5,email);
ps.setInt(6,days);
ps.setString(7,dept);
ps.setString(8,"Pending");

int remaining_days=20;

int x=ps.executeUpdate();

if(x!=0)
	response.sendRedirect("Leave_Applied.jsp");
%>
 
 <h1>Apllied Successfully...</h1>

</body>
</html>