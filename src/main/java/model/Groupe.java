package model;

public class Groupe {
	private String nom_groupe, code_cours, idGroupe, idEnseignant;
	private int volume_horaire;
	private int capacite;
	
	
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
	
	
	
}
