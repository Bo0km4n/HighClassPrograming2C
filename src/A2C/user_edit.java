package A2C;
import java.io.*;
import java.sql.*;

import A2C.MyDBAccess;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


public class user_edit extends HttpServlet{
	private PreparedStatement statement;
	
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException , ServletException{
		RequestDispatcher rd = null;
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		
		
		String tmp = req.getParameter("application_id");
		int application_id = Integer.parseInt(tmp);
		HttpSession session = req.getSession(true);
		int user_id = (int)session.getAttribute("user_id");
		String sql = "insert into user_applications values(?,?)";
		
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
            
            statement=con.prepareStatement(sql);
			statement.setInt(1,user_id);
			statement.setInt(2,application_id);
			statement.executeUpdate();
			statement.close();
			con.close();
			//res.sendRedirect("/Advanced2C/user_edit.jsp");
			
		}catch(Exception e){
			e.printStackTrace();
			rd = req.getRequestDispatcher("/err.jsp");
		}finally{
			res.sendRedirect("/Advanced2C/user_edit.jsp");
		}
	}
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException , ServletException{
		doGet(req,res);
	}
}
