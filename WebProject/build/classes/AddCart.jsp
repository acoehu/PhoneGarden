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
		try {
			String phoneName = request.getParameter("phoneName");
			Integer count = Integer.parseInt(request.getParameter("count"));

			PhoneGarden run = new PhoneGarden();
			Map<String, Integer> map = (HashMap<String, Integer>) session.getAttribute("map");
			Queue<Integer> totalNum = (LinkedList<Integer>) session.getAttribute("totalNum");
			Queue<Double> totalPrice = (LinkedList<Double>) session.getAttribute("totalPrice");
			Phone phone = run.phone(phoneName);

			int quantity = phone.quantity - count;
			if (map.containsKey(phoneName))
				quantity -= map.get(phoneName);
			//	quantity = quantity;
			if (quantity < 0) {
				out.println("Not enough phone quantity to add!");
			} else {
				out.println("Added to Cart");
				if (!map.containsKey(phoneName))
					map.put(phoneName, count);
				else
					map.put(phoneName, map.get(phoneName) + count);
				totalNum.add(count + totalNum.poll());
				totalPrice.add(phone.price + totalPrice.poll());
			}

			String site = new String("http://localhost:8080/WebProject/BrowsePhone.jsp");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site);
		} catch (Exception e) {
			System.out.println(e);
		}
	%>

</body>
</html>