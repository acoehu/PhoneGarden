<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Search for Phone</title>
</head>
<h1>Provide name of the phone to get info</h1>
<body>
	<div id="nav">
		<ul>
			<li><a href="http://localhost:8080/WebProject/HomeScreen.jsp">Home</a></li>
			<li><a href="http://localhost:8080/WebProject/GetRecord.jsp">Your account</a></li>
			<li><a href="http://localhost:8080/WebProject/EditRecord.jsp">Edit your account</a></li>
			<li><a href="http://localhost:8080/WebProject/BrowsePhone.jsp">Browse</a></li>
		</ul>
	</div>

	<form action="GetPhoneInfo.jsp" method="GET">
		Name: <input type="text" name="name"> <input type="submit"
			value="Submit" />
	</form>


</body>
</html>