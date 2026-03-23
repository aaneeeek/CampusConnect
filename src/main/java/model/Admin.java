package model;

import java.sql.Connection;
import utils.UtilityCls;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

import utils.ConnectDatabase;

public class Admin extends Personne {
	public String idAdmin;
	private static Connection connection = ConnectDatabase.getConnection();
	public Admin(String nom, String prenom, String mot_de_passe, Date date_naissance, String idPersonne, String idAdmin) throws SQLException {
		this.nom = nom;
		this.prenom = prenom;
		this.mot_de_passe = mot_de_passe;
	    this.date_naissance = date_naissance;
	    if (idPersonne.contentEquals("") && idAdmin.contentEquals("")) {
	    	this.idPersonne = generateIdPersonne();
		    this.idAdmin = generateIdAdmin();
	    }
	    else {
		    this.idPersonne = idPersonne;
		    this.idAdmin = idAdmin;
	    }
	}
	
	public void AssignerSalle() {
		
	}
	
	public void CreerPersonne(String nom, String prenom, String mot_de_passe, Date date_naissance, String id_personne) throws SQLException {
		String create_person_command = "INSERT INTO personne (id_personne, nom, prenom, date_naissance, mot_de_passe) VALUES (?, ?, ?, ?, ?)";
		PreparedStatement create_person_stmt = connection.prepareStatement(create_person_command);
		create_person_stmt.setString(1, id_personne);
		create_person_stmt.setString(2, nom);
		create_person_stmt.setString(3, prenom);
		create_person_stmt.setDate(4, date_naissance);
		create_person_stmt.setString(5, mot_de_passe);
		create_person_stmt.executeUpdate();
	}
	
	public Etudiant CreerCompteEtudiant(String nom, String prenom, String mot_de_passe, Date date_naissance, String matricule, int niveau, String filiere) throws SQLException {
		String id_personne = generateIdPersonne();
		this.CreerPersonne(nom, prenom, mot_de_passe, date_naissance, id_personne); // creates person before creating corresponding student
		String create_etudiant_command = "INSERT INTO etudiant (id_personne, matricule, niveau, filiere) VALUES (?, ?, ?, ?)";
		PreparedStatement create_etudiant_stmt = connection.prepareStatement(create_etudiant_command);
		create_etudiant_stmt.setString(1, id_personne);
		create_etudiant_stmt.setString(2, matricule);
		create_etudiant_stmt.setInt(3, niveau);
		create_etudiant_stmt.setString(4, filiere);
		create_etudiant_stmt.executeUpdate();
		return new Etudiant(nom, prenom, mot_de_passe, date_naissance, id_personne, matricule, niveau, filiere);
	}
	
	public Enseignant AjouterEnseignant(String nom, String prenom, Date date_naissance, String mot_de_passe, String statut, String departement) throws SQLException {
		String id_enseignant = Enseignant.generateIdEnseignant();
		String id_personne = generateIdPersonne();
		this.CreerPersonne(nom, prenom, mot_de_passe, date_naissance, id_personne); // creates person before creating corresponding teacher
		String create_enseignant_command = "INSERT INTO enseignant (id_enseignant, statut, departement, id_personne) VALUES (?, ?, ?, ?)";
		PreparedStatement create_enseignant_stmt = connection.prepareStatement(create_enseignant_command);
		create_enseignant_stmt.setString(1,  id_enseignant);
		create_enseignant_stmt.setString(2,  statut);
		create_enseignant_stmt.setString(3,  departement);
		create_enseignant_stmt.setString(4,  id_personne);
		create_enseignant_stmt.executeUpdate();
		return new Enseignant(nom, prenom, date_naissance, mot_de_passe, statut, departement, id_personne, id_enseignant);
	}

	public static Admin getAdmin(String idAdmin, String idPersonne) throws SQLException{
		/*
		 This method allows us to select a specific admin-user from our database. The selection is done either by administrator id (idAdmin) or person id (idPersonne)
		 if the selection id by administrator id then parameter idPersonne must be = "" but idAdmin must be != "" and vice versa
		 */
		Admin admin = null;
		String query = "";
		PreparedStatement stmt;
		if (idAdmin.contentEquals("")) {
			query = "SELECT id_administateur, personne.id_personne, nom, prenom, date_naissance, mot_de_passe FROM administrateur JOIN personne ON id_personne = ? AND personne.id_personne=administrateur.id_personne";
			stmt = connection.prepareStatement(query);
			stmt.setString(1, idPersonne);
		}
		else {
			query = "SELECT id_administateur, personne.id_personne, nom, prenom, date_naissance, mot_de_passe FROM administrateur JOIN personne ON id_administateur = ? AND personne.id_personne=administrateur.id_personne";
			stmt = connection.prepareStatement(query);
			stmt.setString(1, idAdmin);
		}
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			admin = new Admin(
					rs.getString("nom"),
					rs.getString("prenom"),
					rs.getString("mot_de_passe"),
					rs.getDate("date_naissance"),
					rs.getString("id_personne"),
					rs.getString("id_personne")
					);
			}
		return admin;	
	}
	
	public void AjouterCours() {
		
	}
	
	public void DiviserCours() {
		
	}
	
	static String generateIdAdmin() throws SQLException {
			return UtilityCls.generateId(connection, "administrateur", "id_administrateur");
		}
	
	public void ModifierEnseignant() {
		
	}
	
	public void AjouterClasse() {
		
	}
	
	public void InsererEDT() {
		
	}
	
	
	
	public void SupprimerEnseignant() {
		
	}
	
	public void SupprimerSalle() {
		
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
