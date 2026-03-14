CREATE TABLE personne(
	id_personne VARCHAR(20) PRIMARY KEY,
	nom VARCHAR(30),
	prenom VARCHAR(30),
	date_naissance DATE,
	mot_de_passe VARCHAR(30)
);

CREATE TABLE administrateur(
	id_administrateur VARCHAR(20) PRIMARY KEY,
	id_personne VARCHAR(20),
	FOREIGN KEY (id_personne) REFERENCES personne(id_personne)
);

CREATE TABLE etudiant(
	matricule VARCHAR(8) PRIMARY KEY,
	niveau INTEGER,
	filiere VARCHAR(20),
	id_personne VARCHAR(20),
	FOREIGN KEY (id_personne) REFERENCES personne(id_personne)
);

CREATE TABLE enseignant(
	id_enseignant VARCHAR(20) PRIMARY KEY,
	statut VARCHAR(10),
	departement VARCHAR(10),
	id_personne VARCHAR(20),
	FOREIGN KEY (id_personne) REFERENCES personne(id_personne)
);

CREATE TABLE cours(
	code_cours VARCHAR(20) PRIMARY KEY,
	intituler VARCHAR(30),
	description VARCHAR(400),
	volume_horraire INTEGER,
	capacite INTEGER,
	id_enseignant VARCHAR(20),
	FOREIGN KEY (id_enseignant) REFERENCES enseignant(id_enseignant)
);

CREATE TABLE groupe(
	id_groupe VARCHAR(20) PRIMARY KEY,
	nom_groupe VARCHAR(20),
	volume_horraire INTEGER,
	capacite INTEGER,
	id_enseignant VARCHAR(20),
	code_cours VARCHAR(20),
	FOREIGN KEY (id_enseignant) REFERENCES enseignant(id_enseignant),
	FOREIGN KEY (code_cours) REFERENCES cours(code_cours)
);

CREATE TABLE inscrire(
	note FLOAT,
	matricule VARCHAR(8),
	id_groupe VARCHAR(20),
	FOREIGN KEY (matricule) REFERENCES etudiant(matricule),
	FOREIGN KEY (id_groupe) REFERENCES groupe(id_groupe)
);

CREATE TABLE salle(
	id_salle VARCHAR(20) PRIMARY KEY,
	capacite INTEGER,
	type_salle VARCHAR(20)
);

CREATE TABLE sceance(
	id_sceance VARCHAR(20) PRIMARY KEY,
	heure TIME,
	jour VARCHAR(10),
	id_groupe VARCHAR(20),
	id_salle VARCHAR(20),
	FOREIGN KEY (id_groupe) REFERENCES groupe(id_groupe),
	FOREIGN KEY (id_salle) REFERENCES salle(id_salle)
);