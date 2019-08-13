package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnect {
	 // Kết nối vào MySQL.
	 public static Connection getMySQLConnection() throws SQLException,
	         ClassNotFoundException {
	     String hostName = "localhost"; 
	     String dbName = "bookbus";
	     String userName = "root";
	     String password = "Huyen711";
	     return getMySQLConnection(hostName, dbName, userName, password);
	 }
	 
	 public static Connection getMySQLConnection(String hostName, String dbName,
	         String userName, String password) throws SQLException,
	         ClassNotFoundException {
	     Class.forName("com.mysql.jdbc.Driver");
	     String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;
	     Connection conn = DriverManager.getConnection(connectionURL, userName,
	             password);
	     return conn;
	 }
		 /*public static void main (String[] args) throws SQLException,ClassNotFoundException {
			 
				System.out.println("Get connection ... ");

				// Lấy ra đối tượng Connection kết nối vào database.
				Connection conn = getMySQLConnection();

				System.out.println("Get connection " + conn);

				System.out.println("Done!");
		 }*/
}
