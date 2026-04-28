package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.ConnectDatabase;

public class Groupe {
	public String nom_groupe, code_cours, idGroupe, idEnseignant;
	private int volume_horaire;
	private int capacite;
	private static Connection connection = ConnectDatabase.getConnection();
	
	
	public Groupe(String nom_groupe, int volume_horaire, int capacite, String idGroupe, String idEnseignant, String code_cours) {
		this.nom_groupe=nom_groupe;
		this.volume_horaire=volume_horaire;
		this.capacite = capacite;
		this.code_cours = code_cours;
		this.idGroupe = idGroupe;
		this.idEnseignant = idEnseignant;
	}
	public int CapaciteGroupe() {
			return 0;
		}
	
	public void AssiterSeance() {
		
	}
	
	public static ArrayList<Seance> getSeance(String id_groupe) throws SQLException {
		ArrayList<Seance> listeSeance = new ArrayList();
		String sql = "SELECT heure, jour, groupe.id_groupe, id_salle, id_enseignant FROM sceance JOIN groupe ON groupe.id_groupe = sceance.id_groupe AND groupe.id_groupe = ?";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setString(1, id_groupe);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			listeSeance.add(new Seance(rs.getTime("heure").toString(), rs.getString("jour"), rs.getString("id_groupe"), rs.getString("id_salle"), rs.getString("id_enseignant")));
		}
		return listeSeance;
	}
	
	public String getNom_groupe() {
		return this.nom_groupe;
	}
	public String getCode_cours() {
		return this.code_cours;
	}
	public String getidGroupe() {
		return this.idGroupe;
	}
	public String getidEnseignat() {
		return this.idEnseignant;
	}
	
	public void setNom_groupe(String nom_groupe) {
		this.nom_groupe = nom_groupe;
	}
	public void setCode_cours(String code_cours) {
		this.code_cours=code_cours;
	}
	public void setidGroupe(String idGroupe) {
		this.idGroupe = idGroupe;
	}
	public String setidEnseignat() {
		return this.idEnseignant;
	}
	
	public ArrayList<String> getEtudiant() throws SQLException{
		ArrayList<String> listeEtudiant = new ArrayList();
		String sql = "SELECT etudiant.matricule FROM etudiant JOIN inscrire ON inscrire.matricule = etudiant.matricule AND inscrire.id_groupe = ?";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setString(1, idGroupe);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			listeEtudiant.add(rs.getString("matricule"));
		}
		return listeEtudiant;
	}
	
	
	
}
