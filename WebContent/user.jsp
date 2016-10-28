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
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">AdvancedInformation2C</a>
    </div>
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/Advanced2C/top.html">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="/Advanced2C/logout">logout</a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>
</head>
<body style="padding-top: 70px">
	<div class="container">
		<div Align="center">	
			<%= user_name %><p>
			<%= user_id %><p>
			<%= session_id %>
		</div>	
	</div>	
</body>
</html>