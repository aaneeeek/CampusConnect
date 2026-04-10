package model;

public class Seance {
	private String heure;
	private String jour;
	
	public Seance(String heure, String jour) {
		this.heure=heure;
		this.jour=jour;
	}
	public String getHeure() {
		return heure;
	}
	public String getJour() {
		return jour;
	}
	public void setHeure(String heure ) {
		this.heure=heure;
	}
	public void setJour(String jour ) {
		this.jour=jour;
	}
}
