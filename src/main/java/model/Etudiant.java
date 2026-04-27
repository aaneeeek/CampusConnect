package model;

import java.sql.Connection;


import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;



import utils.ConnectDatabase;
import utils.CourseConflictException;

public class Etudiant extends Personne{
	private String matricule;
	private int niveau;
	private String filiere;
	private static Connection connection = ConnectDatabase.getConnection();
	public Etudiant(String nom, String prenom, String mot_de_passe, Date date_naissance, String idPersonne, String matricule, int niveau, String filiere) throws SQLException {
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

	public static ArrayList<Etudiant> getListeEtudiant() throws SQLException {
		ArrayList<Etudiant> liste = new ArrayList<>();
		
		String sql = "SELECT personne.id_personne, nom, prenom, date_naissance, mot_de_passe, matricule, niveau, filiere FROM etudiant JOIN personne ON etudiant.id_personne = personne.id_personne";
		PreparedStatement stmt = connection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			liste.add(new Etudiant(
					rs.getString("nom"),
					rs.getString("prenom"),
					rs.getString("mot_de_passe"),
					rs.getDate("date_naissance"),
					rs.getString("id_personne"),
					rs.getString("matricule"),
					rs.getInt("niveau"),
					rs.getString("filiere")
					));
		}
		return liste;
	}
	
	
	public static Etudiant getEtudiant(String idPersonne, String matricule) throws SQLException {
		
		Etudiant etudiant = null;
		String sql = "SELECT personne.id_personne, nom, prenom, date_naissance, mot_de_passe, matricule, niveau, filiere FROM etudiant JOIN personne ON etudiant.id_personne = personne.id_personne AND ";
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
	
	public void Sinscrire(String id_groupe) throws SQLException, CourseConflictException {
		if(Seance.isConflitSeance(getProgramme(), Groupe.getSeance(id_groupe))) {
			System.out.println("FAILED#####################################");
			throw new CourseConflictException("Conflict in time table");
		}else {
			String sql = "INSERT INTO inscrire (matricule, id_groupe) VALUES ( ?, ?)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, matricule);
			stmt.setString(2, id_groupe);
			stmt.executeUpdate();
			System.out.println("SUCCESS#####################################");
		}
		
	}
	public Map VoirNote() throws SQLException {
		Map<String, Float> Liste_note = new HashMap<>();
		String sql = "SELECT inscrire.note, cours.code_cours, groupe.nom_groupe FROM inscrire JOIN groupe ON groupe.id_groupe = inscrire.id_groupe JOIN cours ON groupe.code_cours = cours.code_cours WHERE inscrire.matricule = ?";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setString(1, this.matricule);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			Liste_note.put(rs.getString("code_cours") + "("+ rs.getString("nom_groupe") + ")", rs.getFloat("note"));
		}
		return Liste_note;
	}


	@Override
	public Map VoirEdt(Groupe g) throws SQLException {
		Map<Integer, String> EDT = new HashMap<>();
		String sql = "SELECT heure, jour FROM sceance JOIN salle ON salle.id_salle = sceance.id_salle JOIN WHERE sceance.id_groupe = ?";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setString(1, g.getidGroupe());
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			EDT.put(rs.getInt("heure"), rs.getString("jour"));
		}
		return EDT;
	}

	public String getMatricule () {
		return this.matricule;
	}
	public int getNiveau () {
		return this.niveau;
	}
	public String getFiliere () {
		return this.filiere;
	}
	
	public void setMatricule (String matricule) {
		this.matricule=matricule;
	}
	
	@Override
	public void VoirEdt() throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
	public ArrayList<Seance> getProgramme() throws SQLException{
		ArrayList<Seance> listeSeance = new ArrayList();
		String sql = "SELECT heure, jour, id_salle, id_enseignant, inscrire.id_groupe FROM sceance JOIN inscrire ON sceance.id_groupe = inscrire.id_groupe JOIN groupe ON groupe.id_groupe = inscrire.id_groupe WHERE inscrire.matricule = ? ";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setString(1, matricule);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			listeSeance.add(new Seance(rs.getTime("heure").toString(), rs.getString("jour"), rs.getString("id_groupe"), rs.getString("id_salle"), rs.getString("id_enseignant")));
		}
		return listeSeance;
	}
	
	

}
