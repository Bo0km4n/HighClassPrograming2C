<%@ page language="java" import="java.sql.*, A2C.MyDBAccess,java.io.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String application_id = (String)request.getParameter("application_id");
	String class_id_servlet = (String)request.getParameter("class_id_servlet");
%>    

<%
	// 内容: データベースにアクセスする
	// JDBCドライバの登録
            // データベースの指定
            String server   = "localhost";   // PostgreSQL サーバ ( IP または ホスト名 )
            String dbname   = "advancedinformation2c";         // データベース名
            String url = "jdbc:postgresql://" + server + "/" + dbname;
            String user     = "al14031";         //データベース作成ユーザ名
            String password = "yuyakatuya21";     //データベース作成ユーザパスワード
            Class.forName ("org.postgresql.Driver").newInstance();
            // データベースとの接続
            Connection con = DriverManager.getConnection(url, user, password);
            Statement statement = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); //ショートカット一覧取得用
            Statement statement2 = con.createStatement(); //分類一覧取得用
            
	// sql文の作成
	String sql;
	
    //class_select.javaよりclass_idを選択しているか
    	
		if((class_id_servlet == null) || (class_id_servlet.equals("all"))){
		sql = "select A.content,A.process,B.class_name,C.application_name from shortcuts A,classes B,applications C where C.application_id =" + application_id; 
		String sql_sub =" and A.application_id=c.application_id and A.class_id=B.class_id;";
		sql += sql_sub;
		}else{
			sql = "select A.content,A.process,B.class_name,C.application_name from shortcuts A,classes B,applications C where C.application_id=" + application_id;
			String sql_sub = " and B.class_id=" + class_id_servlet + " and A.application_id=C.application_id and A.class_id=B.class_id";
			sql += sql_sub;
		}
            
		String class_sql = "select distinct B.class_id,B.class_name,C.application_name,C.application_id from shortcuts";
		String class_sql2 = " A,classes B,applications C where C.application_id = " + application_id + " and A.application_id=c.application_id and A.class_id=B.class_id;";
		class_sql += class_sql2;
	// メンバーを取得
	//SQL文の実行
	    boolean retval = statement.execute(sql);
		ResultSet rs = statement.getResultSet();
		
		retval = statement2.execute(class_sql);
		ResultSet rs_class = statement2.getResultSet();
		rs.next(); 													//application_nameの取得の為１行目にカーソル移動
		String application_name = rs.getString("application_name");
		rs.beforeFirst(); 											//ショートカット一覧表示のとき一行目が表示されなくなるため一行目の手前に戻す
		
 %>
 
<!-- html　開始 --> 
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

<!-- 分類による抽出 class_select.javaへ -->
	<form class="form-horizontal" action="class_select" method="post">
		  <div class="form-group">
		    <label for="number" class="control-label col-xs-2">If you want to show shortcuts for the classes</label>
		    <div class="col-xs-3">
		      <select class="form-control" name="class_id_servlet">
		      <% while(rs_class.next()){ 
		    	  String class_name = rs_class.getString("class_name");	
			      int class_id = rs_class.getInt("class_id");
		      %>
		        <option value= <%=class_id %>><%= class_name %></option> 
		      <% } %>
		      	<option value="all">全て</option>
		      </select>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-xs-offset-2 col-xs-10">
		      <button type="submit" class="btn btn-primary">抽出</button>
		    </div>
		  </div>
		  <input type="hidden" name="application_id" value=<%= application_id %>>
		</form>
<!-- 分類による抽出終了 -->

<!-- アプリケーションショートカットの一覧表示  -->
		
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
<!-- 一覧表示終了 -->
<%
	rs.close();
	rs_class.close();
	statement.close();
	statement2.close();
	// Connectionのオブジェクトをクローズします。
    con.close();
%>
</div>
</body>
</html>