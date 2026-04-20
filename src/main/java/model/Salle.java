package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.ConnectDatabase;

public class Salle {
	public int capacite;
	public String type_salle;
	public String idSalle;
	private static Connection connection = ConnectDatabase.getConnection();
	
	public Salle(int capacite, String idSalle, String type_salle) {
		this.capacite = capacite;
		this.type_salle = type_salle;
		this.idSalle = idSalle;
	}
	public int CapaciteSalle() {
		return 0;
	}
	
	public void AfficherProgrammeSalle() {
		
	}
	
	public static ArrayList<Salle> getListeSalle() throws SQLException{
		ArrayList<Salle> listeSalles = new ArrayList();
		String sql = "SELECT * FROM salle";
		PreparedStatement stmt = connection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			listeSalles.add(new Salle(rs.getInt("capacite"), rs.getString("id_salle"), rs.getString("type_salle")));
		}
;		return listeSalles;
	}
}
