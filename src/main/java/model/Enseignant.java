package model;

public class Enseignant extends Personne{
	private String statut;
	private String departement;
	
	public Enseignant(String nom, String prenom, String mot_de_passe, String statut, String departement) {
		super(nom,prenom,mot_de_passe);
		this.statut = statut;
		this.departement = departement;
		
	}
	
	public void RemplirNote() {
		
	}
public void AnimerSeance() {
		
	}
public void ModifierNote() {
	
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
