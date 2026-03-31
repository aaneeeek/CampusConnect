package model;

public class Cours {
	
	public String code_cours;
	public String intituler;
	public String description;
	public int volume_horaire;
	public int capacite;
	public int idEnseignant;

	public Cours(String code_cours, String intituler, String description, int volume_horaire, int capacite) {
		this.code_cours =code_cours;
		this.description = description;
		this.volume_horaire = volume_horaire;
		this.capacite = capacite;
	}
	
	public Enseignant getResponsable() {
		Enseignant enseignant = null;
		return enseignant;
	}

}
