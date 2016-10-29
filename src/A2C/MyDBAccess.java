package A2C;

import java.sql.*;

public class MyDBAccess {
 
    private String driver;
    private String url;
    private String user;
    private String password;
    private Connection connection;
    private Statement statement;
    private ResultSet resultset;
 
    /**
     * コンストラクタ
     * @param driver ドライバー
     * @param url URL
     * @param user ユーザー名
     * @param password パスワード
     */
    public MyDBAccess(String driver, String url, String user, String password) {
        this.driver = driver;
        this.url = url;
        this.user = user;
        this.password = password;
    }
 
    /**
     * 引数なしのコンストラクタ
     * 既定値を使用する
     */
    public MyDBAccess() {
        driver = "org.postgresql.Driver";
        url = "jdbc:postgresql://localhost:5432/advancedinformation2c";
        user = "al14031";
        password = "yuyakatuya";
    }
    
    
    /**
     * データベースへの接続を行う
     */
    public synchronized void open() throws Exception {
        Class.forName(driver);
        connection = DriverManager.getConnection(url, user, password);
        statement = connection.createStatement();
    }
 
    /**
     * SQL 文を実行した結果の ResultSet を返す
     * @param sql SQL 文
     */
    public ResultSet getResultSet(String sql) throws Exception {
        if ( statement.execute(sql) ) {
            return statement.getResultSet();
        }
        return null;
    }
 
    /**
     * Select SQL 文の実行
     * @param sql SQL 文
     */
    public void execute(String sql) throws Exception {
        statement.execute(sql);
    }
    
    /**
     * INSERT 文の実行
     */
 
    public void executeUpdate(String sql) throws Exception{
    	statement.executeUpdate(sql);
    }
    
    /**
     * データベースへのコネクションのクローズ
     */
    public synchronized void close() throws Exception {
        if ( resultset != null ) resultset.close();
        if ( statement != null ) statement.close();
        if ( connection != null ) connection.close();
    }
}