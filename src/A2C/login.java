package A2C;
import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
public class login extends HttpServlet{
	private PreparedStatement statement;
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
			throws ServletException, IOException{
		RequestDispatcher rd = null;
		request.setCharacterEncoding("UTF-8");
try{
			
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
            

			String User_id = request.getParameter("User_id");
			int id = Integer.parseInt(User_id);
			String user_password = request.getParameter("password");
			
				
				String sql = "select * from users where id=? and password=?";
				//sql挿入
				statement=con.prepareStatement(sql);
				statement.setInt(1,id);
				statement.setString(2,user_password);
				statement.executeUpdate();
				statement.close();
				con.close();
								
				//user.jspへセッション作成用のidを設定
				request.setAttribute("user_id",id);
				
				 rd = request.getRequestDispatcher("/user.jsp");
			
			
		}catch(Exception e){
			e.printStackTrace();
			rd = request.getRequestDispatcher("/err.jsp");
		}finally{
			rd.forward(request,response);
			
		}
	}
	
}
