<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="JDBC.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Adding phone to cart</title>
</head>

<body>

	<%
		String phoneName = request.getParameter("phoneName");
		Integer count =Integer.parseInt(request.getParameter("count"));
		Map<String, Integer> map = (Map<String,Integer>) session.getAttribute("map");;
		Queue<Integer> total = (Queue<Integer>) session.getAttribute("total");
		if (!map.containsKey(phoneName)) {
			map.put(phoneName, count);
			
		}
		else map.put(phoneName, map.get(phoneName) + count);
		total.add(count + total.poll());
		
		
		String site = new String("http://localhost:8080/WebProject/BrowsePhone.jsp");
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site);
	%>

</body>
</html>