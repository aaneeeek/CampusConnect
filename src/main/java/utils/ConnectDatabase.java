package utils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDatabase {
	private static String url = "jdbc:postgresql://db:5432/DB_NAME";
	private static String user = "DB_USER";
	private static String password = "DB_PASSWORD";
	
	public static Connection getConnection() {
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(url, user, password);
		}catch(SQLException error) {
			error.printStackTrace();
		}
		return connection;
	}
}
