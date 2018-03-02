<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="JDBC.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Getting data</title>
<link rel="stylesheet" type="text/css" href="Style.css">
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

	<table border="2">
		<tr>
			<th>Phone</th>
			<th>Quantity</th>
			<th>Price</th>
		</tr>
		<%
			PhoneGarden run = new PhoneGarden();
				Map<String, Integer> map = (HashMap<String, Integer>) session.getAttribute("map");
				Queue<Integer> totalNum = (LinkedList<Integer>) session.getAttribute("totalNum");
				Queue<Double> totalPrice = (LinkedList<Double>) session.getAttribute("totalPrice");
				for (Map.Entry<String, Integer> k : map.entrySet()) {
		%>
		<tr>
			<td>
				<%
					out.println(k.getKey());
				%>
			</td>
			<td>
				<%
					out.println(k.getValue());
				%>
			</td>
			<td>
				<%
					Phone phone = run.phone(k.getKey());
							out.println((double) phone.price * k.getValue());
				%>
			</td>

		</tr>


		<%
			}
		%>
		<tr>
			<td>Total</td>
			<td>
				<%
					out.println(totalNum.peek());
				%>
			</td>
			<td>
				<%
					out.println(totalPrice.peek());
				%>
			</td>
		</tr>
	</table>
	<%
		}
	%>

</body>
</html>