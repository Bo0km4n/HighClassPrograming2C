package A2C;
import java.sql.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import A2C.MyDBAccess;
public class application_shortcuts extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		MyDBAccess db = new MyDBAccess();
		RequestDispatcher rd = null;
		HttpSession session = request.getSession(false);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String tmp = request.getParameter("application_id");
		int application_id = Integer.parseInt(tmp);
		String sql = "select * from shortcuts where application_id="+ application_id + ";";
		try{
			/**
			 *  user_idとapplication_idの紐付け
			 */
			db.open();
			ResultSet rs = db.getResultSet(sql);
			
			
			
			rd = request.getRequestDispatcher("/application_shortcuts.jsp");
			
		}catch(Exception e)
		{
			e.printStackTrace();
			rd =  request.getRequestDispatcher("/err.jsp");
		}finally{
			rd.forward(request, response);
		}
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		doGet(request,response);
	}
}
