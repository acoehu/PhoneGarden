<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Please create an account:</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="Style.css">
<script>
	function checkExist() {

		var name = document.getElementById("phoneName").value;

		if (name) {
			$.ajax({
				type : 'post',
				url : 'ExistPhone.jsp',
				data : {
					phoneName : name,
				},
				success : function(response) {

					$("#status").html(response);
				},
				error : function(response) {

					$("#status").html(response);
				}
			});
		}
	}
	$(function() {
		$("#spinner").spinner();
		$("#datepicker").datepicker();
		$("button").button();
	});
</script>
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
		<br> Enter your phone brand:<input type="text" name="phoneBrand" /><br>
		<br> Enter picture link:<input type="text" name="picture" /><br>
		<br> Enter description: <input type="text" name="description" /><br>
		<br> Enter price: <input type="number" name="price" /><br>
		<br> Enter quantity: <input type="number" name="quantity" /><br>
		<br> <input type="submit" value="Add" /><br>
	</form>



</body>
</html>