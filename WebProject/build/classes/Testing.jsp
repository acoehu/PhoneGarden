<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Please create an account:</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	function checkExist() {

		var name = document.getElementById("name").value;
		if (name) {
			$.ajax({
				type : 'post',
				url : 'TestingAjax.jsp',

				data : {
					name : name,
				},
				success : function(data) {

					var json = data;
					var a = JSON.parse(json);
					var line = "";
					for (i = 0; i < a.length; i++) {
						line += "<h3><img src='" + a[i].picture + "' height = '30' width = '100'> " + a[i].name + ":</h3>";
						line+="<ul>"
						line += "<li>Brand: " + a[i].brand + "</li>";
						line += "<li>Description: " + a[i].brand + "</li>";
						line += "<li>Price: " + a[i].brand + "</li>";
						line += "<li>Quantity: " + a[i].brand + "</li>";
						line+="</ul>";
//						line += a[i].name + " " + a[i].brand + " " + a[i].description + " " + a[i].price + " " + a[i].quantity;
						
						line += "<br>"
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
	Enter your username:
	<input type="text" name="name" id="name" value=" "
		onblur="checkExist()" />
	
	<br>
	
	<script>checkExist();</script>

	<div id="print"></div>


</body>
</html>