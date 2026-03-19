package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.ConnectDatabase;

public class Etudiant extends Personne{
	public String matricule;
	public int niveau;
	public String filiere;
	private static Connection connection = ConnectDatabase.getConnection();
	public Etudiant(String nom, String prenom, String mot_de_passe, Date date_naissance, String idPersonne, String matricule, int niveau, String filiere) {
		this.nom = nom;
		this.prenom = prenom;
		this.mot_de_passe = mot_de_passe;
	    this.date_naissance = date_naissance;
		this.matricule = matricule;
		this.niveau = niveau;
		this.filiere = filiere;
		if (idPersonne.contentEquals("")) {this.idPersonne = generateIdPersonne();}
	    else {this.idPersonne = idPersonne;}
	}
	
	public static Etudiant getEtudiant(String idPersonne, String matricule) throws SQLException {
		Etudiant etudiant = null;
		String sql = "SELECT personne.id_personne, nom, prenom, data_naissance, mot_de_passe, matricule, niveau, filiere FROM etudiant JOIN personne ON etudiant.id_personne = personne.id_personne AND ";
		sql += matricule.contentEquals("")?"personne.id_personne = ?":"matricule = ?";
		PreparedStatement stmt = connection.prepareStatement(sql);
		if (matricule.contentEquals("")) {stmt.setString(1, idPersonne);}
		else {stmt.setString(1, matricule);}
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			etudiant = new Etudiant(
					rs.getString("nom"),
					rs.getString("prenom"),
					rs.getString("mot_de_passe"),
					rs.getDate("date_naissance"),
					rs.getString("id_personne"),
					rs.getString("matricule"),
					rs.getInt("niveau"),
					rs.getString("filiere")
					);
		}
		return etudiant;
	}
	
	public void Sinscrire() {
		
	}
	public void VoirNote() {
		
	}

	
	@Override
	public void SeConnecter() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void CalculMoyenne() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void VoirEdt() {
		// TODO Auto-generated method stub
		
	}

}
