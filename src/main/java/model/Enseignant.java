package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.ConnectDatabase;
import utils.UtilityCls;

public class Enseignant extends Personne{
	Etudiant etudiant = new Etudiant(); 
	public String statut, departement, idEnseignant;
	private static Connection connection = ConnectDatabase.getConnection();
	public Enseignant(String nom, String prenom, Date date_naissance, String mot_de_passe, String statut, String departement, String idPersonne, String idEnseignant) throws SQLException {
		this.nom = nom;
		this.prenom = prenom;
		this.mot_de_passe = mot_de_passe;
	    this.date_naissance = date_naissance;
		this.statut = statut;
		this.departement = departement;
		this.idEnseignant = idEnseignant.contentEquals("")?generateIdEnseignant():idEnseignant;
		this.idPersonne = idPersonne.contentEquals("")?generateIdPersonne():idPersonne;
	}
	
	public static ArrayList<Enseignant> getListeEnseignant() throws SQLException{
		ArrayList<Enseignant> listeEnseignant = new ArrayList<>();
		String sql = "SELECT id_enseignant, statut, departement, personne.id_personne, nom, prenom, date_naissance, mot_de_passe FROM enseignant JOIN personne ON enseignant.id_personne = personne.id_personne";
		PreparedStatement stmt = connection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			listeEnseignant.add(new Enseignant(
					rs.getString("nom"),
					rs.getString("prenom"),
					rs.getDate("date_naissance"),
					rs.getString("mot_de_passe"),
					rs.getString("statut"),
					rs.getString("departement"),
					rs.getString("id_personne"),
					rs.getString("id_enseignant")
					));
		}
		return listeEnseignant;
	}
	public static Enseignant getEnseignant(String idEnseignant, String idPersonne) throws SQLException {
		Enseignant enseignant = null;
		String sql = "SELECT id_enseignant, statut, departement, personne.id_personne, nom, prenom, date_naissance, mot_de_passe FROM enseignant JOIN personne ON enseignant.id_personne = personne.id_personne AND ";
		PreparedStatement stmt = null;
		if (idEnseignant.contentEquals("")) {
			sql += "personne.id_personne = ?";
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, idPersonne);
		}
		else {
			sql += "id_enseignant = ?";
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, idEnseignant);
		}
		ResultSet rs = stmt.executeQuery();
		if (rs.next()){
			enseignant = new Enseignant(
					rs.getString("nom"),
					rs.getString("prenom"),
					rs.getDate("date_naissance"),
					rs.getString("mot_de_passe"),
					rs.getString("statut"),
					rs.getString("departement"),
					rs.getString("id_personne"),
					rs.getString("id_enseignant")
					);
		}
		return enseignant;
	}
	
	public static String generateIdEnseignant() throws SQLException {
		
		return UtilityCls.generateId(connection, "enseignant", "id_enseignant");
	}
	
	public void RemplirNote(String matricule, Float note, String id_groupe ) throws SQLException {
		String sql = "UPDATE inscrire SET note = ? WHERE matricule = ? AND id_groupe = ? ";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setFloat(1, note);
		stmt.setString(2, matricule);
		stmt.setString(3, id_groupe);
		stmt.executeUpdate();
	}
	
	public void ModifierNote(String matricule, Float note, String id_groupe) throws SQLException {
		String sql = "UPDATE inscrire SET note = ? WHERE matricule = ? AND id_groupe = ? ";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setFloat(1, note);
		stmt.setString(2, matricule);
		stmt.setString(3, id_groupe);
		stmt.executeUpdate();
	}

	@Override
	public void VoirEdt() {
		// TODO Auto-generated method stub
		
	}

	

}
