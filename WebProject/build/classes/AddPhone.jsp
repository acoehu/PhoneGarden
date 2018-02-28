<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Please create an account:</title>
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
	<form action="InsertPhone.jsp" onsubmit="return validateForm()"
		method="post" name="regF">
		Enter phone name:<input type="text" name="phoneName" id="phoneName"
			onblur="checkExist()" /><span id="status"></span><br>
		<br> Enter quantity: <input type="number" name="quantity" /><br>
		<br> <input type="submit" value="Add" /><br>
	</form>



</body>
</html>