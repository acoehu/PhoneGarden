<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="JDBC.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.gson.Gson"%>
<%
	PhoneGarden run = new PhoneGarden();
	String search = request.getParameter("name");
	List<Phone> result = new ArrayList<>();
	ResultSet rs = run.getAllPhone();
	search = search.toLowerCase();
	if (search.equals(" ")){ 
		
		
		while (rs.next()) {
			
			Phone phone = run.phone(rs.getString("PhoneName"));
			result.add(phone);
	
		}
	}
	else {
		while(rs.next()) {
			String name = rs.getString("PhoneName");
			Phone phone = run.phone(rs.getString("PhoneName"));
			if (name.length() >= search.length()) {
				name = name.substring(0, search.length());
				if (name.toLowerCase().equals(search)) {
					result.add(phone);
				}
			}
		}
	 	
	}
	Gson gson = new Gson();
	String k = gson.toJson(result);
	out.print(k);
%>