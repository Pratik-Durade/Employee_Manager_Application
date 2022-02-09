
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

String id1=request.getParameter("lid");  // accepting this values from QUERY STRING i.e. <a href="accept.jsp?id=<%=rs.getInt(1)>
int id=Integer.parseInt(id1);

//String dname=(String)session.getAttribute("name");  // GETTING SESSION VALUE FROM DoctorLogin.java

PreparedStatement ps=con.prepareStatement("update apply_leave set status=? where lid=?");

	ps.setString(1, "Rejected");
	ps.setInt(2, id);
//	ps.setInt(3, aid);
	
	int x=ps.executeUpdate();
	
	if(x!=0)
		response.sendRedirect("View_Leave.jsp");
%>

</body>
</html>