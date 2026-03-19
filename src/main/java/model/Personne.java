package model;

import java.sql.Date;

public abstract class Personne {
	public String nom, prenom, mot_de_passe, idPersonne;
	public Date date_naissance;
	
	public abstract void SeConnecter();
	public abstract void CalculMoyenne();
	public abstract void VoirEdt();
	static String generateIdPersonne() {
			
			return "";
		}

}
