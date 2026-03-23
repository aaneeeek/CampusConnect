package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UtilityCls {
	public static String generateId(Connection connection, String tableName, String pkName) throws SQLException {
		String newId = "1";
		String sql = "SELECT " + pkName + " FROM " + tableName + " WHERE " + pkName + " <> '' "+ " ORDER BY " + pkName + "::integer "  +" DESC LIMIT 1";
		PreparedStatement stmt = connection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			String last_id = rs.getString(pkName);
			if (last_id != null && !last_id.contentEquals("")) {
				newId = String.valueOf(Integer.parseInt(last_id) + 1);
			}
		}
		return newId;
	}
}
