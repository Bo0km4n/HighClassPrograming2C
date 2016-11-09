<%@ page language="java" import="java.sql.*, A2C.MyDBAccess" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String application_id = (String)request.getParameter("application_id");
	
	//int application_id = Integer.parseInt(i);
%>    

<%
	// 内容: データベースにアクセスする
	// MyDBAccess のインスタンスを生成する
	MyDBAccess db = new MyDBAccess(); 
	// データベースへのアクセス
	db.open();
	// sql文の作成
	String sql = "select A.content,A.process,B.class_name,C.application_name from shortcuts A,classes B,applications C where C.application_id=" + application_id + " and A.application_id=C.application_id;";
	// メンバーを取得
	ResultSet rs = db.getResultSet(sql);
	rs.next();
	String application_name = rs.getString("application_name");
	rs.beforeFirst();
	
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"> 
    <link href="//getbootstrap.com/examples/signin/signin.css" rel="stylesheet">


<title><%= application_name %></title>
</head>
<body style="padding-top: 70px">
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
        <li><a href="/Advanced2C/user.jsp">Home</a></li>
        <li class="active"><a href="/Advanced2C/user_edit.jsp">Edit</a></li>
        <li><a href="/Advanced2C/logout">logout</a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>

<div class="container">
<h1><%= application_name %>'s shortcuts</h1>
<table class="table table-striped">
			<thead>
				<tr>
					<th>shortcut_command</th>
					<th>shortcut_proccess</th>
					<th>class</th>
				</tr>
			</thead>
			<tbody>
					<% while(rs.next()){ 	
			      String shortcut_content = rs.getString("content");	
			      String shortcut_process = rs.getString("process");
			      String class_name = rs.getString("class_name");
			      %>
			      	<tr>
			        	<td><%= shortcut_content %></td>
			        	<td><%= shortcut_process %></td>
			        	<td><%= class_name %></td>
			        </tr>
			      <% } %>
		      	
			</tbody>
		</table>
</div>
</body>
</html>