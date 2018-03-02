<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="JDBC.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<html>
<head>

<title>Please create an account:</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link rel="stylesheet" type="text/css" href="Style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
#cart {
	float: right;
	color: pink;
}
</style>
<script>
	$(function() {
		$("#spinner").spinner();

	});

	function checkExist() {

		var name = document.getElementById("name").value;
		if (name) {
			$
					.ajax({
						type : 'post',
						url : 'Search.jsp',

						data : {
							name : name,
						},
						success : function(data) {

							var json = data;
							var a = JSON.parse(json);

							var line = "<div id='accordion'>";
							for (i = 0; i < a.length; i++) {
								line += "<div><h1><img src='" + a[i].picture + "' height = '70' width = '150'> "
										+ "<br>" + a[i].name + "</h1>";
								line += " <form action = 'AddCart.jsp' method = 'POST'>";
								line += "<input type='hidden' name='phoneName' value='"+ a[i].name +  "'>";
								line += "<input name='count' value = '1' type = 'hidden'>";
								line += "<input type = 'submit' value = 'Add to cart'> ";
								line += "</form></div>";

								line += "<div><ul>";
								line += "<li>Brand: " + a[i].brand + "</li>";
								line += "<li>Description: " + a[i].description
										+ "</li>";
								line += "<li>Price: " + a[i].price + "</li>";
								line += "<li>Quantity: " + a[i].quantity
										+ "</li>";
								line += "</ul></div></div>";
								//						line += a[i].name + " " + a[i].brand + " " + a[i].description + " " + a[i].price + " " + a[i].quantity;

							}
							//<img src="https://www.w3.org/html/logo/badge/html5-badge-h-css3-semantics.png" width="165" height="64" alt="HTML5" title="HTML5">

							document.getElementById("print").innerHTML = line;
							$('#status').html(data);
						},
						error : function(response) {

							$("#status").html(response);
						}
					});
		}
	}
	$(function() {
		$("#accordion").accordion({
			active : false,
			collapsible : true
		});
	});
</script>

</head>

<body>
	<%
		if (session.isNew()) {
			session.invalidate();
			String site = new String("http://localhost:8080/WebProject/HomeScreen.jsp");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site);
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
	<a id='cart' href ="http://localhost:8080/WebProject/Cart.jsp"><h3>
		Cart:
		<%
		Queue<Integer> totalNum = (LinkedList<Integer>) session.getAttribute("totalNum");
			out.println(totalNum.peek());
	%>
	</h3></a>
	<br>
	<h3 id='warning'></h3>


	<br> Search phone:
	<input type="text" name="name" id="name" value=" "
		onblur="checkExist()" />

	<br>
	<script>
		checkExist();
	</script>

	<div id="print"></div>
	<%
		}
	%>



</body>
</html>