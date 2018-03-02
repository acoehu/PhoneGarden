<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="JDBC.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Getting data</title>
<link rel="stylesheet" type="text/css" href="Style.css">
<style>
#cart {
	float: right;
	color: pink;
}
</style>
</head>

<body>
	<%
		if (session.isNew()) {
			session.invalidate();
			String site = new String("http://localhost:8080/WebProject/HomeScreen.jsp");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site);
		} else {
	%>
	<div id="nav">
		<ul>
			<li><a href="http://localhost:8080/WebProject/HomeScreen.jsp">Home</a></li>
			<li><a href="http://localhost:8080/WebProject/GetRecord.jsp">Your
					account</a></li>
			<li><a href="http://localhost:8080/WebProject/EditRecord.jsp">Edit
					your account</a></li>
			<li><a href="http://localhost:8080/WebProject/BrowsePhone.jsp">Browse</a></li>
			<li><a href="http://localhost:8080/WebProject/Logout.jsp">Logout</a></li>
		</ul>
	</div>
	<a id='cart' href="http://localhost:8080/WebProject/Cart.jsp"><h3>
			Cart:
			<%
		Queue<Integer> totalNum = (LinkedList<Integer>) session.getAttribute("totalNum");
			out.println(totalNum.peek());
	%>
		</h3></a>
	<table border="2">
		<tr>
			<th>Real name</th>
			<th>Email</th>
			<th>Date of Birth</th>
		</tr>
		<%
			String username = (String) session.getAttribute("username");
			PhoneGarden run = new PhoneGarden();
			ResultSet rs = run.get(username);
			while (rs.next()) {
		%>
		<tr>
			<td>
				<%
					out.println(rs.getString("RealName"));
				%>
			</td>
			<td>
				<%
					out.println(rs.getString("DOB"));
				%>
			</td>
			<td>
				<%
					out.println(rs.getString("Email"));
				%>
			</td>

		</tr>


		<%
			}
		%>
	</table>
	<%}
	
	%>

</body>
</html>