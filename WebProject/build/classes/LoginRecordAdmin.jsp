<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="JDBC.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login attempt</title>
</head>

<body>
	<h1>Attempting to login..</h1>
	
		<p>
				<%
					String username = request.getParameter("username");
					String password = request.getParameter("password");
					//password = new String(PhoneGarden.encrypt(password));
					PhoneGarden run = new PhoneGarden();
					if (run.login(username, password, "Admin")) {
							out.println("Login sucessfully!");
							String site = new String("http://localhost:8080/WebProject/HomeAdmin.jsp");
					         response.setStatus(response.SC_MOVED_TEMPORARILY);
					         response.setHeader("Location", site);
						}
					else {
						out.println("Nope");
					}
				
				%>
			
	

</body>
</html>