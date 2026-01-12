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






