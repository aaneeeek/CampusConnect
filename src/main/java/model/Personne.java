package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;

import utils.ConnectDatabase;
import utils.UtilityCls;

public abstract class Personne {
	public String nom, prenom, mot_de_passe, idPersonne;
	public Date date_naissance;
	private static Connection pConnection = ConnectDatabase.getConnection();
	public abstract void SeConnecter();
	public abstract void CalculMoyenne();
	public abstract void VoirEdt();
	static String generateIdPersonne() throws SQLException {
			
			return UtilityCls.generateId(pConnection, "personne", "id_personne");
		}

}
