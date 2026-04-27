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

--CREATION DU PREMIER COMPTE ADMINISTRATEUR
INSERT INTO personne VALUES ('1', 'Admin', 'Superuser', '2006-05-30', 'password');
INSERT INTO administrateur VALUES ('1', '1');

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

INSERT INTO salle VALUES 
	('25BP1', 30, 'Salle de TP'),
	('12BP1', 20, 'Salle de TP'),
	('20BP1', 35, 'Salle de TP'),
	('Atelier A1', 300, 'Salle de CM'),
	('25BS2', 30, 'Salle de TP'),
	('11BP1', 210, 'Salle de CM'),
	('BP1', 30, 'Salle de TP'),
	('25BP2', 30, 'Salle de TP'),
	('05RS1', 30, 'Salle de TD'),
	('06BP1', 30, 'Salle de TP'),
	('Amphi 1100 I', 100, 'Salle de CM'),
	('25CP1', 100, 'Salle de CM'),
	('25BA1', 30, 'Salle de TP'),
	('Amphi 1100 II', 150, 'Salle de CM'),
	('07BP1', 30, 'Salle de TP'),
	('05AP1', 30, 'Salle de TD'),
	('16BS1', 30, 'Salle de TP');

CREATE TABLE sceance(
	heure TIME,
	jour VARCHAR(10),
	id_groupe VARCHAR(20),
	id_salle VARCHAR(20),
	FOREIGN KEY (id_groupe) REFERENCES groupe(id_groupe),
	FOREIGN KEY (id_salle) REFERENCES salle(id_salle),
	PRIMARY KEY(heure, jour, id_groupe, id_salle)
);



-- =========================
-- PERSONNES (for students & teachers)
-- =========================
INSERT INTO personne VALUES 
('2', 'Doe', 'John', '2002-03-12', 'pass123'),
('3', 'Smith', 'Alice', '2001-07-25', 'pass123'),
('4', 'Nguyen', 'David', '1990-11-05', 'pass123'),
('5', 'Kouam', 'Brice', '1985-09-17', 'pass123');

-- =========================
-- ENSEIGNANTS
-- =========================
INSERT INTO enseignant VALUES
('ENS1', 'Permanent', 'INFO', '4'),
('ENS2', 'Vacataire', 'GENIE', '5');

-- =========================
-- ETUDIANTS
-- =========================
INSERT INTO etudiant VALUES
('ETU00001', 2, 'INFO', '2'),
('ETU00002', 3, 'INFO', '3');

-- =========================
-- COURS
-- =========================
INSERT INTO cours VALUES
('C001', 'Programmation Java', 'Cours de base en Java', 60, 40, 'ENS1'),
('C002', 'Base de Donnees', 'Introduction aux bases de donnees', 45, 35, 'ENS2');

-- =========================
-- GROUPES
-- =========================
INSERT INTO groupe VALUES
('G1', 'Groupe A', 30, 25, 'ENS1', 'C001'),
('G2', 'Groupe B', 25, 20, 'ENS2', 'C002');

-- =========================
-- INSCRIPTIONS
-- =========================
INSERT INTO inscrire VALUES
(15.5, 'ETU00001', 'G1'),
(13.0, 'ETU00002', 'G2');

-- =========================
-- SEANCES
-- =========================
INSERT INTO sceance VALUES
('07:30:00', 'Lundi', 'G1', '25BP1'),
('12:00:00', 'Mardi', 'G2', '12BP1');

