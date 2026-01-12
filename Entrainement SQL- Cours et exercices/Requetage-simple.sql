/* Voici un exemple de table simple, décrivant des étudiants. Chaque ligne est appelée un tuple ou enregistrement. Chaque colonne est appelée un attribut ou une variable.


Table Etudiant:
IdEtu
	Nom
	Prenom
	Sexe
	Age 
 1
	Remin
	Norbert
	H
	19 
 3
	Constant
	Raphaelle
	F
	20 
 4
	Fleurot
	Isabelle
	F
	19 
 5
	Yannic
	Sandrine
	F
	18 
 6
	Josse
	Francis
	H
	20 */

table Etudiant
(
    IdEtu int,
    Nom varchar(50),
    Prenom varchar(50),
    Sexe char(1),
    Age int
);

insert into Etudiant values (1, 'Remin', 'Norbert', 'H', 19);
insert into Etudiant values (3, 'Constant', 'Raphaelle', 'F', 20);
insert into Etudiant values (4, 'Fleurot', 'Isabelle', 'F', 19);
insert into Etudiant values (5, 'Yannic', 'Sandrine', 'F', 18);
insert into Etudiant values (6, 'Josse', 'Francis', 'H', 20);

/* Contrainte de domaine

Tout attribut a un domaine de valeurs, qui sont ici les suivants :

    IdEtu : entier,
    Nom, Prenom : chaîne de caractères
    Sexe : un seul caractère, éventuellement limité à H et F
    Age : entier aussi

Ceci a pour but d'éviter au maximum les erreurs introduites lors d'insertion de données.
  */

/* Clé externe
  */

table Etudiant
(
    IdEtu int,
    Nom varchar(50),
    Prenom varchar(50),
    Sexe char(1),
    Age int,
    IdCours int,
    primary key (IdEtu),
    foreign key (IdCours) references Cours(IdCours)
);

insert into Etudiant values (1, 'Remin', 'Norbert', 'H', 19, 1);
insert into Etudiant values (3, 'Constant', 'Raphaelle', 'F', 20, 3);
insert into Etudiant values (4, 'Fleurot', 'Isabelle', 'F', 19, 4);
insert into Etudiant values (5, 'Yannic', 'Sandrine', 'F', 18, 5);
insert into Etudiant values (6, 'Josse', 'Francis', 'H', 20, 6);

/*  requête pour modifier un attribut */

update Etudiant
set Sexe = 'F'
where Sexe = 'H';

update Etudiant
set Sexe = 'H'
where Sexe = 'F';

/*  requête pour supprimer un tuple */

delete from Etudiant
where Sexe = 'F';

/*  requête pour supprimer un attribut */

alter table Etudiant
drop Sexe;

/*  requête pour ajouter un attribut */

alter table Etudiant
add Sexe char(1);

/* requête permettant de récupérer la liste des étudiants  */

SELECT *
FROM Etudiant
LIMIT 5;

/* création de la base de données 
 Étape 1 : Création de la base de données (en requête ou via
 lʼinterface de PHPMyAdmin */
 
CREATE DATABASE entreprise;
USE entreprise;

/*Étape 2 : Création des tables */
Tables departements CREATE TABLE departments(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_departement VARCHAR(100)
);

Tables employes CREATE TABLE employes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(150),
    id_departement INT,
    date_embauche DATE,
    FOREIGN KEY (id_departement) REFERENCES departments(id)
);

/* Étape 3 : Insertion de données  */

INSERT INTO departements (nom) VALUES
    ('Informatique'),
    ('Marketing'),
    ('Ressources humaines'),
    ('Finance'),;


INSERT INTO employes (nom, prenom, email, id_departement, date_embauche)
VALUES (
        'Durand',
        'Sophie',
        'sophie.durand@email.com',
        1,
        '2022-05-10'
    ),
    (
        'Morel',
        'Julien',
        'julien.morel@email.com',
        1,
        '2023-03-15'
    ),
    (
        'Roche',
        'Claire',
        'claire.roche@email.com',
        2,
        '2021-08-20'
    ),
    (
        'Petit',
        'Karim',
        'karim.petit@email.com',
        3,
        '2020-11-01'
    ),
    (
        'Lopez',
        'Anna',
        'anna.lopez@email.com',
        4,
        '2024-01-10'
    ),
    (
        'Nguyen',
        'Thomas',
        'thomas.nguyen@email.com',
        2,
        '2022-12-05'
    );


/*
 Exercices – Requêtes avec jointures
 Exercice 1 – Jointure simple : employés et départements
 Objectif : Utiliser une jointure INNER JOIN .
 Énoncé :
 Affichez le prénom, le nom et le nom du département de chaque employé
 */


SELECT e.prenom,
    e.nom,
    d.nom
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id;


/*
 Exercice 2 – Trier les résultats
 Objectif : Ajouter un tri à une jointure.
 Énoncé :
 Affichez les mêmes informations que lʼexercice précédent, triées par nom de
 département (ordre alphabétique).
 */


SELECT e.prenom,
    e.nom,
    d.nom
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
ORDER BY d.nom;


/* Exercice 3 – Filtrer sur un champ de la table liée
 Objectif : Appliquer un filtre sur une table jointe.
 Énoncé :
 Affichez les employés qui travaillent dans le département "Informatique".
 */


SELECT e.prenom,
    e.nom,
    d.nom
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
WHERE d.nom = 'Informatique';


/*  Exercice 4 – Employés embauchés après une certaine date
 Objectif : Utiliser un filtre sur une date dans une requête avec jointure.
 Énoncé :
 Affichez les employés (nom, prénom, email, nom du département) embauchés
 après le 1er janvier 2022. */


SELECT e.prenom,
    e.nom,
    e.email,
    d.nom
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
WHERE e.date_embauche > '2022-01-01';


/* Exercice 5 – Compter les employés par département
 Objectif : Utiliser COUNT() avec GROUP BY et une jointure.
 Énoncé :
 Affichez le nom des départements avec le nombre dʼemployés dans chacun
 dʼeux.  */


SELECT d.nom,
    COUNT(*) AS nb_employes
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
GROUP BY d.nom;


/* Exercice 6 – Afficher uniquement les départements ayant au
 moins 2 employés
 Objectif : Utiliser HAVING après un GROUP BY .
 Énoncé :
 Affichez uniquement les départements ayant au moins 2 employés.
 */


SELECT d.nom,
    COUNT(*) AS nb_employes
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
GROUP BY d.nom
HAVING nb_employes >= 2;


/*  Exercice 7 – Jointure externe : LEFT JOIN
 Objectif : Comprendre LEFT JOIN et les employés sans département
 (hypothétique).
 Énoncé :
 Modifiez un employé pour quʼil nʼait pas de département (mettre id_departement à
 NULL ), puis affichez tous les employés avec leur département (sʼil existe).
  Exemple de modification avant la requête :
 UPDATE employes SET id_departement = NULL WHERE nom = 'Lopez';
 */

 
UPDATE employes
SET id_departement = NULL
WHERE nom = 'Lopez';
SELECT e.prenom,
    e.nom,
    d.nom
FROM employes e
    LEFT JOIN departements d ON e.id_departement = d.id;

/* Série dʼexercices – Les
 jointures (suite) */


/* Exercice 8 – Utiliser des alias pour plus de lisibilité
 Objectif : Renommer les tables et colonnes dans une requête avec jointure.
 Énoncé :
 Affichez les colonnes suivantes pour tous les employés, en utilisant des alias :
 prénom de lʼemployé
 nom de lʼemployé
 nom du département (alias : departement )
 date dʼembauche  */


SELECT e.prenom,
    e.nom,
    d.nom AS departement,
    e.date_embauche
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id;


/*  Exercice 9 – Trier les employés selon leur date dʼembauche
 Objectif : Utiliser ORDER BY pour organiser les résultats.
 Énoncé :
 Affichez les noms, prénoms, départements et dates dʼembauche des employés,
 triés du plus ancien au plus récent.
 */


SELECT e.prenom,
    e.nom,
    d.nom AS departement,
    e.date_embauche
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
ORDER BY e.date_embauche;


/* Exercice 10 – Départements sans employés
 Objectif : Utiliser une jointure externe ( LEFT JOIN ) avec une condition sur les
 valeurs manquantes.
 Énoncé :
 Affichez la liste des départements qui nʼont aucun employé.
 */


SELECT d.nom AS departement
FROM employes e
    LEFT JOIN departements d ON e.id_departement = d.id
WHERE e.id_departement IS NULL;


/*   Exercice 11 – Employés seuls dans leur département
 Objectif : Utiliser une sous-requête dans la clause WHERE .
 Énoncé :
 Affichez les employés qui sont les seuls employés dans leur département.
 */


SELECT e.prenom,
    e.nom,
    d.nom AS departement
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
WHERE e.id_departement IN (
        SELECT id_departement
        FROM employes
        GROUP BY id_departement
        HAVING COUNT(*) = 1
    )


    /* Exercice 12 – Les deux départements avec le plus dʼemployés
     Objectif : Combiner JOIN , GROUP BY , ORDER BY et LIMIT .
     Énoncé :
     Affichez les 2 départements qui comptent le plus grand nombre dʼemployés,
     ainsi que le nombre dʼemployés par département.
     */
SELECT d.nom AS departement,
    COUNT(*) AS nb_employes
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
GROUP BY d.nom
ORDER BY nb_employes DESC
LIMIT 2
    /*  Exercice 13 – Afficher le nombre de collègues par employé
     Objectif : Utiliser une sous-requête dans la liste SELECT .
     Énoncé :
     Pour chaque employé, affichez :
     son nom et prénom
     le nombre total dʼemployés dans le même département
     */
SELECT e.prenom,
    e.nom,
    (
        SELECT COUNT(*)
        FROM employes e2
        WHERE e2.id_departement = e.id_departement
    ) AS nb_collegues
FROM employes e
ORDER BY nb_collegues DESC


    /*  Exercice 14 – Répartition des embauches par année
     Objectif : Regrouper les données selon une expression issue dʼune fonction
     (YEAR()).
     Énoncé :
     Affichez le nombre dʼemployés embauchés par année, en vous appuyant sur
     la colonne date_embauche .
     */


SELECT YEAR(date_embauche) AS annee,
    COUNT(*) AS nb_employes
FROM employes
GROUP BY annee


    /*  Exercice 15 – Employés embauchés après un autre employé du
     même département
     Objectif : Utiliser une sous-requête corrélée avec une comparaison de dates.
     Énoncé :
     Affichez les employés qui ont été embauchés après au moins un autre
     employé appartenant au même département.
     */

     
SELECT e.prenom,
    e.nom,
    d.nom AS departement,
    e.date_embauche
FROM employes e
    INNER JOIN departements d ON e.id_departement = d.id
WHERE e.date_embauche > (
        SELECT MAX(date_embauche)
        FROM employes e2
        WHERE e2.id_departement = e.id_departement
            AND e2.date_embauche < e.date_embauche
    )



