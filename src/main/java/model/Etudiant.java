package model;

public class Etudiant extends Personne{
	private String matricule;
	private String niveau;
	private String filiere;
	private float note;
	public Etudiant(String nom, String prenom, String mot_de_passe, String matricule, String niveau, String filiere, float note) {
		super(nom, prenom, mot_de_passe);
		this.matricule=matricule;
		this.niveau=niveau;
		this.filiere=filiere;
		this.note=note;
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
