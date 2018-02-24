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
<title>Sending verify email</title>
</head>

<body>
	<h1></h1>
	<ul>
		<li>
				<%
					String username = request.getParameter("username");
					String hashedUsername = PhoneGarden.byteArrayToHexString(PhoneGarden.encrypt(username));
					hashedUsername = new BigInteger( hashedUsername, 16 ).toString(36);
					
					PhoneGarden run = new PhoneGarden();
					String email = run.getEmail(username);
					SendEmail.send(hashedUsername, email);
					out.println("Verification link sent to your email");
					
				%>
					
			
	</ul>

</body>
</html>