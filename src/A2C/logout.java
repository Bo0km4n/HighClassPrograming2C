package A2C;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class logout extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		RequestDispatcher rd = null;
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		session.invalidate();
		session = request.getSession(false);
		rd = request.getRequestDispatcher("/top.html");
		rd.forward(request, response);
		if (session == null){
	        System.out.println("セッションは破棄されました");
	      }else{
	        System.out.println("セッションが残っています");
	      }
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		doGet(request,response);
	}
}
