package model;

public abstract class Personne {
String nom;
String prenom;
String mot_de_passe;
public Personne(String nom, String prenom, String mot_de_passe) {
	this.nom = nom;
	this.prenom = prenom;
	this.mot_de_passe = mot_de_passe;
}
public abstract void SeConnecter();
public abstract void CalculMoyenne();
public abstract void VoirEdt();

}
