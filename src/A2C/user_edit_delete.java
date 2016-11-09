package A2C;
import java.io.*;
import java.sql.*;

import A2C.MyDBAccess;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

public class user_edit_delete extends HttpServlet{
	
	public void doGet(HttpServletRequest req,HttpServletResponse res)throws IOException , ServletException{
		RequestDispatcher rd = null;
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		String tmp = req.getParameter("application_id");
		int application_id = Integer.parseInt(tmp);
		HttpSession session = req.getSession(true);
		int user_id = (int)session.getAttribute("user_id");
		String sql = "delete from user_applications where user_id=" + user_id + " and " + "application_id=" + application_id + ";";
		
		
		try{
			MyDBAccess db = new MyDBAccess();
			db.open();
			db.executeUpdate(sql);
			db.close();			
		}catch(Exception e){
			e.printStackTrace();
			rd = req.getRequestDispatcher("/err.jsp");
		}finally{
			res.sendRedirect("/Advanced2C/user_edit.jsp");
		}
	}
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException ,ServletException{
		doGet(req,res);
	}
}
