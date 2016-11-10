package A2C;
import java.io.*;
import java.sql.*;

import A2C.MyDBAccess;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.ServletContext;

public class class_select extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;UTF-8");
		PrintWriter out = response.getWriter();
		String application_id = (String)request.getParameter("application_id");
		String class_id_servlet = request.getParameter("class_id_servlet");
		//out.println(application_id);
		//System.out.println(class_id_servlet);
		// このWebアプリケーションの設定を取得
	      ServletContext context = request.getServletContext();
	      // このWebアプリケーション内にあるページ（移動先のページ）を決定
	      RequestDispatcher rd = context.getRequestDispatcher("/application_shortcuts.jsp");
	      // 移動先のページに移動
	      rd.forward(request, response);	
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		doGet(request,response);
	}
}
