package model;

public class Groupe {
	public String nom_groupe;
	public int volume_horaire;
	public int capacite;
	
	public Groupe(String nom_groupe, int volume_horaire, int capacite) {
		this.nom_groupe=nom_groupe;
		this.volume_horaire=volume_horaire;
		this.capacite = capacite;
	}
	
		public Groupe() {
		// TODO Auto-generated constructor stub
	}

		public int CapaciteGroupe() {
			return 0;
		}
	
	public void AssiterSeance() {
		
	}
}
