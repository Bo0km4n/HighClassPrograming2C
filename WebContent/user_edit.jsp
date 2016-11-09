<%@ page language="java" import="java.sql.*, A2C.MyDBAccess" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
// 内容: データベースにアクセスする
 
// MyDBAccess のインスタンスを生成する
MyDBAccess db = new MyDBAccess();
 
// データベースへのアクセス
db.open();

// sql文の作成
int user_id = (int)session.getAttribute("user_id");
String sql = "select B.* from user_applications A,applications B where A.user_id = " + user_id + " and B.application_id=A.application_id;"; 
// メンバーを取得
ResultSet rs = db.getResultSet(sql);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"> 
    <link href="//getbootstrap.com/examples/signin/signin.css" rel="stylesheet">
<title>user_edit</title>
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
        <li><a href="/Advanced2C/top.html">Home</a></li>
        <li class="active"><a href="/Advanced2C/user_edit.jsp">Edit</a></li>
        <li><a href="/Advanced2C/logout">logout</a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>
</head>
<body style="padding-top: 70px">
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>application_name</th>
					<th>application_overview</th>
				</tr>
			</thead>
			<tbody>
					<% while(rs.next()){ 
			      String application_name = rs.getString("application_name");	
			      String application_overview = rs.getString("application_overview");
			      %>
			      	<tr>
			        	<td><%= application_name %></td>
			        	<td><%= application_overview %></td>
			      	</tr>
			      <% } %>
		      	
			</tbody>
		</table>
	</div>
</body>
</html>