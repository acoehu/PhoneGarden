<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="JDBC.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Getting phone</title>
<link rel="stylesheet" type="text/css" href="Style.css">
</head>

<body>
	<div id="nav">
		<ul>
			<li><a href="">Home</a></li>
			<li><a href="">Products</a></li>
			<li><a href="">Services</a></li>
			<li><a href="">About</a></li>
			<li><a href="">Contact</a></li>
		</ul>
	</div>
	<%
		String phoneName = request.getParameter("name");

		PhoneGarden run = new PhoneGarden();
		if (!run.existPhone(phoneName)) {
	%>
	<form action="GetPhone.jsp" method="POST">

		<input type="submit"
			value="Phone doesn't exist, click here to search again" />
	</form>



	<%
		} else {
	%>
	<table border="2">
		<tr>
			<th>Brand</th>
			<th>Description</th>
			<th>Price</th>
			<th>Quantity</th>
		</tr>
		<%
			ResultSet rs = run.getPhone(phoneName);
				while (rs.next()) {
					
		%>
		<tr>
			<td>
				<%
					out.println(rs.getString("phoneBrand"));
				%>
			</td>
			<td>
				<%
					out.println(rs.getString("Description"));
				%>
			</td>
			<td>
				<%
					out.println(rs.getInt("Price"));
				%>
			</td>
			<td>
				<%
					out.println(rs.getInt("Quantity"));
				%>
			</td>
		</tr>


		<%
			}

			}
		%>
	</table>
</body>
</html>