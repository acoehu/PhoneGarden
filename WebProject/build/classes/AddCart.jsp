<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="JDBC.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.concurrent.TimeUnit"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="Style.css">
<title>Adding phone to cart</title>
</head>

<body>

	<%
		String phoneName = request.getParameter("phoneName");
		Integer count = Integer.parseInt(request.getParameter("count"));

		PhoneGarden run = new PhoneGarden();
		Map<String, Integer> map = (Map<String, Integer>) session.getAttribute("map");
		;
		Queue<Integer> totalNum = (Queue<Integer>) session.getAttribute("totalNum");
		Queue<Double> totalPrice = (Queue<Double>) session.getAttribute("totalPrice");
		Phone phone = run.phone(phoneName);
		System.out.println(phone.toString());
		int quantity = phone.quantity - count;
		if (map.containsKey(phoneName))
			quantity -= map.get(phoneName);
		if (quantity < 0) {
	%>
	<h1>There're not enough quanity of this product!!</h1>
	<%
		} else {
	%>
	<h1>Added successful</h1>
	<%
		if (!map.containsKey(phoneName)) {
				map.put(phoneName, count);
			} else
				map.put(phoneName, map.get(phoneName) + count);
			totalNum.add(count + totalNum.poll());
			totalPrice.add(phone.price + totalPrice.poll());
		}

		TimeUnit.SECONDS.sleep(10);
		out.println("Redirecting to browse phone");
		String site = new String("http://localhost:8080/WebProject/BrowsePhone.jsp");
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site);
	%>

</body>
</html>