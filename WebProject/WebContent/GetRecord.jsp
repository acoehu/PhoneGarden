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

</head>

<body>
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

</body>
</html>