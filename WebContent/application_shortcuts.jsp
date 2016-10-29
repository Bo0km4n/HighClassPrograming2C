<%@ page language="java" import="java.sql.*, A2C.MyDBAccess" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String i = (String)request.getAttribute("application_id");
	int application_id = Integer.parseInt(i);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%= application_id %></title>
</head>
<body>
<%= application_id %>
</body>
</html>