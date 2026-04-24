package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalTime;
import java.util.ArrayList;

import utils.ConnectDatabase;

public class Seance {
	private static Connection connection = ConnectDatabase.getConnection();
	public String heure;
	public String jour;
	public String groupe;	
	public String salle, enseignant;
	public Seance(String heure, String jour, String groupe, String salle, String enseignant) {
		this.heure=heure;
		this.jour=jour;
		this.groupe=groupe;
		this.salle=salle;
		this.enseignant = enseignant;
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
		stmt.setTime(1, Time.valueOf(LocalTime.parse(heure)));
		stmt.setString(2, jour);
		stmt.setString(3, groupe);
		stmt.setString(4, salle);
		stmt.executeUpdate();
	}
	
	public static ArrayList<Seance> getListSeance() throws SQLException{
		ArrayList<Seance> listeSeance = new ArrayList();
		String sql = "SELECT heure, jour, sceance.id_groupe, id_salle, groupe.id_enseignant "
				+ "FROM sceance JOIN groupe ON sceance.id_groupe = groupe.id_groupe";
		PreparedStatement stmt = connection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			listeSeance.add(new Seance(rs.getTime("heure").toString(), rs.getString("jour"), rs.getString("id_groupe"), rs.getString("id_salle"), rs.getString("id_enseignant")));
		}
		return listeSeance;
	}
	
}
