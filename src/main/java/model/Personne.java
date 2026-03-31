package model;

import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.ConnectDatabase;
import utils.UtilityCls;

public abstract class Personne {
	public String nom, prenom, mot_de_passe, idPersonne;
	public Date date_naissance;
	private static Connection pConnection = ConnectDatabase.getConnection();
	public static void SeConnecter(String identifiant, String mot_de_passe, String type_compte, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sql = "";
		if (type_compte.equals("enseignant")) {
			sql = "SELECT personne.id_personne, nom, prenom, date_naissance, mot_de_passe, id_enseignant, statut, departement FROM personne JOIN enseignant ON enseignant.id_personne = personne.id_personne WHERE id_enseignant = ? AND mot_de_passe = ? ";
		}else if (type_compte.equals("etudiant")) {
			sql = "SELECT personne.id_personne, nom, prenom, date_naissance, mot_de_passe, matricule, niveau, filiere FROM personne JOIN etudiant ON etudiant.id_personne = personne.id_personne WHERE matricule = ? AND mot_de_passe = ? ";
		}else if (type_compte.equals("administrateur")) {
			sql = "SELECT personne.id_personne, nom, prenom, date_naissance, mot_de_passe, id_administrateur FROM personne JOIN administrateur ON administrateur.id_personne = personne.id_personne WHERE id_administrateur = ? AND mot_de_passe = ? ";
		}
		PreparedStatement stmt = pConnection.prepareStatement(sql);
		stmt.setString(1, identifiant);
		stmt.setString(2, mot_de_passe);
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			session.setAttribute("type_compte", type_compte);
			if (type_compte.contentEquals("enseignant")) {
				session.setAttribute("personne", new Enseignant(rs.getString("nom"), rs.getString("prenom"), rs.getDate("date_naissance"), rs.getString("mot_de_passe"), rs.getString("statut"), rs.getString("departement"), rs.getString("id_personne"), rs.getString("id_enseignant")));
				response.sendRedirect(request.getContextPath() + "/acceuilEnseignant");
			}else if (type_compte.contentEquals("etudiant")) {
				session.setAttribute("personne", new Etudiant(rs.getString("nom"), rs.getString("prenom"), rs.getString("mot_de_passe"), rs.getDate("date_naissance"), rs.getString("id_personne"), rs.getString("matricule"), rs.getInt("niveau"), rs.getString("filiere")));
				response.sendRedirect(request.getContextPath() + "/acceuilEtudiant");
			}else if (type_compte.contentEquals("administrateur")) {
				session.setAttribute("personne", new Admin(rs.getString("nom"), rs.getString("prenom"), rs.getString("mot_de_passe"), rs.getDate("date_naissance"), rs.getString("id_personne"), rs.getString("id_administrateur")));
				response.sendRedirect(request.getContextPath() + "/acceuilAdmin");
			}
		} else {
			response.getWriter().println("<h1>FAILED TO LOGIN</h1>");
		}
		
		
	}
	public abstract void CalculMoyenne();
	public abstract void VoirEdt();
	static String generateIdPersonne() throws SQLException {
			return UtilityCls.generateId(pConnection, "personne", "id_personne");
		}

}
