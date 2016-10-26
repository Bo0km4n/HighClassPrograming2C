package A2C;
import java.io.*;
import java.sql.*;
public class test_jdbc {
	public static void main(String[] args) {
        int id;
        String name;
        try {
            // JDBCドライバの登録
            String driver = "org.postgresql.Driver";
            // データベースの指定
            String server   = "localhost";   // PostgreSQL サーバ ( IP または ホスト名 )
            String dbname   = "advancedinformation2c";         // データベース名
            String url = "jdbc:postgresql://" + server + "/" + dbname;
            String user     = "al14031";         //データベース作成ユーザ名
            String password = "yuyakatuya21";     //データベース作成ユーザパスワード
            Class.forName (driver);
            // データベースとの接続
            Connection con = DriverManager.getConnection(url, user, password);
            // テーブル照会実行
            Statement stmt = con.createStatement ();
            String sql = "SELECT * FROM applications";
            ResultSet rs = stmt.executeQuery (sql);
            // テーブル照会結果を出力
            while(rs.next()){
               id = rs.getInt("application_id");
               name = rs.getString("application_name");
               String overview = rs.getString("application_overview");
               System.out.println("ID：" + id);
               System.out.println("名前：" + name);
               System.out.println("概要:"+overview);
           
            }
            // データベースのクローズ
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
            System.err.println("SQL failed.");
            e.printStackTrace ();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace ();
        }
    }
}
