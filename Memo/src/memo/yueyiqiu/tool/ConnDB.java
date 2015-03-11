package memo.yueyiqiu.tool;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class ConnDB {
	public Connection conn;
	public Statement stmt;
	public ResultSet rs;
	//public static String propFileName="D:/JavaEEProject/Wishwall/src/wall/yueyiqiu/util/connDB.properties";
	public static String propFileName="D:/workspace/Memo/src/connDB.properties";
	public static Properties props=new Properties();
	public static String dbclassname;
	public static String url;
	public static String dbusername;
	public static String dbpwd;
	
	
	public ConnDB(){
		try{
		props.load(new FileInputStream(propFileName));
		
		dbclassname=props.getProperty("DB_CLASS_NAME");
		url=props.getProperty("DB_URL");
		dbusername=props.getProperty("DB_USER");
		dbpwd=props.getProperty("DB_PWD");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	
	public static Connection getConnection(){
		Connection conn=null;
		
		try{
		Class.forName(dbclassname).newInstance();
		conn=DriverManager.getConnection(url, dbusername, dbpwd);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		if(conn==null){
			System.err.println("注意!!取得資料庫連線失敗!!ClassName:"+dbclassname+",URL:"+url+",帳號/密碼:"+dbusername+"/"+dbpwd );
		}
		return conn;
	}
	
	public ResultSet executeQuery(String sql){
		
		try{
		conn=this.getConnection();
		stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		rs=stmt.executeQuery(sql);
		}
		catch(Exception e){
			//System.out.println(e.printStackTrace());
			e.printStackTrace();
		}
		return this.rs;
	}
	public int executeUpdate(String sql){
		int result=0;
		try{
			conn=this.getConnection();
			stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			result=stmt.executeUpdate(sql);
		}
		catch(Exception e){
			e.printStackTrace();
			result=-1;
		}
		return result;
	}
	
	public void close(){
		
		try{
		if(this.rs!=null)
			this.rs.close();
		if(this.stmt!=null)
			this.stmt.close();
		if(this.conn!=null)
			this.conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args){
		
		ConnDB c=new ConnDB();
		System.out.println(ConnDB.dbclassname);
		Connection tt=c.getConnection();
		try {
			System.out.println(tt.getCatalog());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
	
}
