package A2C;

import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class register extends HttpServlet{
	private PreparedStatement statement;
	private ResultSet resultset;
	
	
	public void doGet (HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		RequestDispatcher rd = null;
		request.setCharacterEncoding("UTF-8");
		try{
			
			// JDBCドライバの登録
            String driver = "org.postgresql.Driver";
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
			String name = request.getParameter("name");
			String user_password = request.getParameter("password");
			
				
				String sql = "insert into users values(?,?,?)";
				//sql挿入
				statement=con.prepareStatement(sql);
				statement.setInt(1,id);
				statement.setString(2,user_password);
				statement.setString(3,name);
				statement.executeUpdate();
				statement.close();
				con.close();
				String message_success = "登録が完了しました";
				request.setAttribute("message_success", message_success);
				 rd = request.getRequestDispatcher("/register_success.jsp");
			
			
		}catch(Exception e){
			e.printStackTrace();
			rd = request.getRequestDispatcher("/err.jsp");
		}finally{
			rd.forward(request,response);
			
		}
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	        doGet(request,response);
	    }

}
