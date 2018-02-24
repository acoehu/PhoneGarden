<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="JDBC.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
	
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con =(Connection) DriverManager.getConnection("jdbc:mysql://localhost/PhoneGarden", "root", "password");
            PreparedStatement ps = con.prepareStatement("SELECT  * FROM phone WHERE " +
                    "PhoneName = ?");
            ps.setString(1,request.getParameter("phoneName"));
            ResultSet res = ps.executeQuery();
            if(res.first()){
                out.print("Phone already exist");
            }else{
                out.print("Phone is valid");
            }
        }catch (Exception e){
            System.out.println(e);  
        }
%>