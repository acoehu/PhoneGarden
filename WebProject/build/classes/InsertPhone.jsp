<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="JDBC.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Activating account</title>
<link rel="stylesheet" type="text/css" href="Style.css">

</head>

<body>
	<div id="nav">
		<ul>
			<li><a href="http://localhost:8080/WebProject/HomeAdmin.jsp">Home</a></li>
			<li><a href="http://localhost:8080/WebProject/NewPhone.jsp">Create
					new phone</a></li>
			<li><a href="http://localhost:8080/WebProject/AddPhone.jsp">Add
					phone quantity</a></li>
			<li><a href="http://localhost:8080/WebProject/GetPhone.jsp">Get
					phone detail</a></li>
			<li><a href="http://localhost:8080/WebProject/BrowsePhone.jsp">Browse</a></li>
		</ul>
	</div>
	<h1></h1>
	<ul>
		<li>
			<%
				String phoneName = request.getParameter("phoneName");
				String phoneBrand = request.getParameter("phoneBrand");
				String picture = request.getParameter("picture");
				String description = request.getParameter("description");
				int price = Integer.parseInt(request.getParameter("price"));
				int quantity = Integer.parseInt(request.getParameter("quantity"));
				PhoneGarden run = new PhoneGarden();
				if (!run.existPhone(phoneName)) {
					run.insertPhone(phoneName, phoneBrand, picture, description, price, quantity);

					out.println("Phone added");
				} else {
					out.println("Unable to add phone");

				}
			%>
		
	</ul>

</body>
</html>