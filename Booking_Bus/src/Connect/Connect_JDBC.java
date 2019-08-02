package Connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect_JDBC {
	public static Connection getJDBC_Connection() {
		
		final String url="jdbc:mysql://localhost:3306/hotel_management?autoReconnect=true&useSSL=false";
		final String user="root";
		final String password="m2505446";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(url,user,password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
