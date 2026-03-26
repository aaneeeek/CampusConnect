package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.http.HttpSession;
import model.Admin;
import model.Enseignant;
import model.Etudiant;

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
	
	public static boolean permission(String type_compte_necessaire, String identifiant, HttpSession session) throws Exception {
		
		if (session == null){
			System.out.println("#######################");
			return false;
		}
		String type_compte = (String) session.getAttribute("type_compte");
		if (type_compte.equals(type_compte_necessaire)) {
			if (!identifiant.contentEquals("")) {
				if (type_compte.equals("etudiant")) {
					Etudiant etudiant = (Etudiant) session.getAttribute("personne");
					if (etudiant != null && etudiant.matricule == identifiant) {return true;}
					else {return false;}
				}else if (type_compte.equals("enseignant")) {
					Enseignant enseignant = (Enseignant) session.getAttribute("personne");
					if (enseignant != null && enseignant.idEnseignant == identifiant) {return true;}
					else {return false;}
				}else if (type_compte.equals("administrateur")) {
					Admin admin = (Admin) session.getAttribute("personne");
					if (admin != null && admin.idAdmin == identifiant) {return true;}
					else {return false;}
				}
				
			}else {return true;}
		}
		else {return false;}
		return false;
	}
}
