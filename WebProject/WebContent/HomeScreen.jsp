<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Welcome to the home screen</title>
<%@ page import="JDBC.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<link rel="stylesheet" type="text/css" href="Style.css">
</head>
<h1>Please select your action:</h1>
<script>
	function Test() {
		alert("GREAT");
	}
</script>
<style>
#cart {
	float: right;
	color: pink;
}
</style>
<body>

	<%
		if (session.isNew()) {
	%>
	<form action="NewRegister.jsp" method="POST">
		<input type="submit" value="Register new account" />
	</form>
	<form action="Login.jsp" method="POST">
		<input type="submit" value="Log in in your account" />
	</form>

	<%
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

	<%
		}
	%>

</body>
</html>