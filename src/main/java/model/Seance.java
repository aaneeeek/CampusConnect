package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import utils.ConnectDatabase;

public class Seance {
	private static Connection connection = ConnectDatabase.getConnection();
	private String heure;
	private String jour;
	private String groupe;	
	private String salle;
	public Seance(String heure, String jour, String groupe, String salle) {
		this.heure=heure;
		this.jour=jour;
		this.groupe=groupe;
		this.salle=salle;
	}
	public String getHeure() {
		return heure;
	}
	public String getJour() {
		return jour;
	}
	public void setHeure(String heure ) {
		this.heure=heure;
	}
	public void setJour(String jour ) {
		this.jour=jour;
	}
	public void enregistrer() throws SQLException {
		String sql = "INSERT INTO sceance (heure, jour, id_groupe, id_salle) VALUES (?, ?, ?, ?)";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setString(1, heure);
		stmt.setString(2, jour);
		stmt.setString(3, groupe);
		stmt.setString(4, salle);
		stmt.executeUpdate();
	}
	
}
