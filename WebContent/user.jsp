<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <% int user_id = (int)session.getAttribute("user_id"); 
    String user_name = (String)session.getAttribute("user_name");
    String session_id = session.getId();
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"> 
    <link href="//getbootstrap.com/examples/signin/signin.css" rel="stylesheet">
<title><%= user_name %></title>
</head>
<body>
	<div class="container">
		<div Align="center">	
			<%= user_name %><p>
			<%= user_id %><p>
			<%= session_id %>
		</div>	
	</div>	
</body>
</html>