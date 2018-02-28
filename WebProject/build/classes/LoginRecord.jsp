<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="JDBC.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
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
			password = new String(PhoneGarden.encrypt(password));
			PhoneGarden run = new PhoneGarden();
			if (run.login(username, password, "Account")) {
				if (run.checkActivate(username) == 0) {
		%>
	
	<form action="SendActivation.jsp" method="POST">
		<input type="hidden" name="username"
			value="<%out.print(request.getParameter("username"));%>">
		<br> <br> <input type="submit"
			value="Account not verified, click here to send activation link again" />
	</form>
	<%
		} else {
				out.println("Login sucessfully!");
				session.setAttribute("username", username);
				Queue<Integer> totalNum = new LinkedList<>();
				Queue<Double> totalPrice = new LinkedList<>();
				totalNum.add(0);
				totalPrice.add(0.0);
				Map<String, Integer> map = new HashMap<String, Integer>();
				session.setAttribute("map", map);
				session.setAttribute("totalNum", totalNum);
				session.setAttribute("totalPrice", totalPrice);
				
				String site = new String("http://localhost:8080/WebProject/HomeScreen.jsp");
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", site);
			}
		} else {
			out.println("Wrong password or username!");
	%>
	<form action="Login.jsp" method="POST">
		<input type="submit" value="Click here to try again" />
	</form>

	<%
		}
	%>



</body>
</html>