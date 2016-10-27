package A2C;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class login_check1 extends HttpServlet {

    protected Connection conn = null;

    public void init() throws ServletException{
        String url = "jdbc:postgresql://localhost:5432/advancedinformation2c";
        String user = "al14031";
        String password = "yuyakatuya21";

        try {
            Class.forName("org.postgresql.Driver").newInstance();
            conn = DriverManager.getConnection(url, user, password);
        }catch (ClassNotFoundException e){
            log("ClassNotFoundException:" + e.getMessage());
        }catch (SQLException e){
            log("SQLException:" + e.getMessage());
        }catch (Exception e){
            log("Exception:" + e.getMessage());
        }
    }

    public void destory(){
        try{
            if (conn != null){
                conn.close();
            }
        }catch (SQLException e){
            log("SQLException:" + e.getMessage());
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException{

            response.setContentType("text/html; charset=Shift_JIS");
            PrintWriter out = response.getWriter();

            String user_id = request.getParameter("User_id");
            
            String pass = request.getParameter("password");

            HttpSession session = request.getSession(true);

            boolean check = authUser(user_id, pass, session);
            if (check){
                /* 認証済みにセット */
                session.setAttribute("login", "OK");

                /* 認証成功後は必ずuser.jspを呼びだす */
                response.sendRedirect("/Advanced2C/user.jsp");
            }else{
                /* 認証に失敗したら、ログイン画面に戻す */
                session.setAttribute("status", "Not Auth");
                response.sendRedirect("/Advanced2C/login.html");
            }
        }

        protected boolean authUser(String user, String pass, HttpSession session){
            if (user == null || user.length() == 0  || pass == null || pass.length() == 0){
                return false;
            }
            try {
            	int user_id = Integer.parseInt(user);
                String sql = "SELECT * FROM users WHERE user_id = ? and password = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);

                pstmt.setInt(1, user_id);
                pstmt.setString(2, pass);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()){
                    int userid = rs.getInt("user_id");
                    
                    String user_name = rs.getString("name");

                    session.setAttribute("user_id", userid);
                    session.setAttribute("user_name", user_name);

                    return true;
                }else{
                    return false;
                }
            }catch (SQLException e){
                log("SQLException:" + e.getMessage());
                return false;
            }
        }
    }
