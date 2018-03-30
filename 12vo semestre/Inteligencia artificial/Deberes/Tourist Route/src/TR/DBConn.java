package TR;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	public String user="root";
	public String pass="admin";
	public String dbName = "st";
	public String url = "jdbc:mysql://localhost:3306/"+dbName;
	public Connection conn=null;
	
	public DBConn(){
		try{
			Class.forName("com.mysql.jdbc.Connection");
			conn = (Connection)DriverManager.getConnection(url,user,pass);
			if(conn!=null){
				System.out.println("Connection to Data Base successful");
			}
		}catch(Exception e){
			e.printStackTrace();
			
		}
	}

}