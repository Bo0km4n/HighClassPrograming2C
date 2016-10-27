<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%
        request.setCharacterEncoding("UTF-8");
        String result = (String)request.getAttribute("message_success");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"> 
    <link href="//getbootstrap.com/examples/signin/signin.css" rel="stylesheet">
<title>登録成功</title>
</head>
<body>
	<div class="container">
		<div Align="center">
			<font color = "#0000ff"><b><%= result %>></b></font><br>
			<form action = "top.html" method="GET">
        	<input type = "submit" value="戻る" />
    		</form>
		</div>
	</div>
</body>
</html>