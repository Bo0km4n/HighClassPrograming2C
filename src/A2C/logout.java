package A2C;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class logout extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		RequestDispatcher rd = null;
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		session.invalidate();
		rd = request.getRequestDispatcher("/top.html");
		rd.forward(request, response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		doGet(request,response);
	}
}
