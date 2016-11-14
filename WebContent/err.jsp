<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
    
    <%
    HttpSession session_s = request.getSession(false);
    String user_name = (String)session_s.getAttribute("user_name");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ERROR!</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"> 
    <link href="//getbootstrap.com/examples/signin/signin.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="alert alert-danger" role="alert">何らかのエラーが発生しました</div>
		
			<% if (user_name==null){ %>
			<form action = "top.html" method="GET">
        	<input type = "submit" class="btn btn-primary" value="戻る" />
    		</form>
    		<% }else{ %>
    		<form action = "user.jsp" method="GET">
        	<input type = "submit" class="btn btn-primary" value="戻る" />
    		</form>
    		<% } %>
	</div>
</body>
</html>