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
<title>Creating a new account</title>
</head>

<body>
	<h1></h1>
	<ul>
		<li>
				<%
					String username = request.getParameter("username");
					String password = request.getParameter("password");
					String hashedUsername = PhoneGarden.byteArrayToHexString(PhoneGarden.encrypt(username));
					
					hashedUsername = new BigInteger( hashedUsername, 16 ).toString(36);
					String email = request.getParameter("email");
					String name = request.getParameter("name");
					String DOB = request.getParameter("DOB");
					password = new String(JbdcFile.encrypt(password));
					
					PhoneGarden run = new PhoneGarden();
					boolean ok = run.existUser(username);
					ok |= email.equals("");
					ok |= name.equals("");
					ok |= password.equals("");
					ok |= DOB.equals("");
					if (!ok) {
						run.insertUser(username, password, email, name, DOB, hashedUsername);
						SendEmail.send(hashedUsername, email);
						out.println("Registered sucessfully. Please activate your account with the link in your email.");
					}
					else {
						out.println("Unable to create an account, please try again");
						
					}
				%>
					
			
	</ul>

</body>
</html>