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

String ename=(String)session.getAttribute("ename");  // session
int id=(Integer)session.getAttribute("id");			// session



int days=(Integer)session.getAttribute("day");			// session
int rd=20;
rd=rd-days;		// remaining days...
			// session

String status=(String)session.getAttribute("status");  // session



String sql="insert into leave_mgmt(applied_days,remaining_days,eid,ename,status) values(?,?,?,?,?)";

		//int eid=(Integer)session.getAttribute("id");  // GETTING SESSION VALUE FROM Login_Employee.jsp

PreparedStatement ps=con.prepareStatement(sql);

ps.setInt(1,days);
ps.setInt(2,rd);
ps.setInt(3,id);
ps.setString(4,ename);
ps.setString(5,status);	

// int remaining_days=20;

int x=ps.executeUpdate();

if(x!=0)
	// remaining_days=remaining_days-days;

	//session.setAttribute("remaining_days");
	response.sendRedirect("Remaining_Leaves.jsp");
%>
 
 <h1>Apllied Successfully...</h1>

</body>
</html>