/*DROP TABLE T_FREQUENTE;
DROP TABLE T_MANGE;
DROP TABLE T_SERT;
DROP TABLE T_PERSONNE;
DROP TABLE T_PIZZERIA;
DROP TABLE T_PIZZA;
DROP TABLE T_CATEGORIE;*/

 

CREATE TABLE T_PERSONNE
 (
   Nom VARCHAR2(128) PRIMARY KEY ,
   Age NUMBER(2) NOT NULL,
   Sexe CHAR(1),
   CONSTRAINT ck_T_PERSONNE CHECK (Sexe IN ('M','F'))
 );
 
CREATE TABLE T_PIZZERIA
 (
   Pizzeria VARCHAR2(128) PRIMARY KEY,
   Ville VARCHAR2(128),
   DateCreation Date
 );
 
CREATE TABLE T_CATEGORIE
 (
   CodeCategorie CHAR(3) PRIMARY KEY,
   Categorie VARCHAR2(128)
 );
 
CREATE TABLE T_PIZZA
 (
   Pizza VARCHAR2(128) PRIMARY KEY,
   CodeCategorie CHAR(3),
   CONSTRAINT fk_pizza_categorie FOREIGN KEY (CodeCategorie) REFERENCES T_CATEGORIE (CodeCategorie)
 );
 
CREATE TABLE T_FREQUENTE
 (
   Nom VARCHAR2(128),
   Pizzeria VARCHAR2(128),
   PRIMARY KEY(Nom, Pizzeria),
   CONSTRAINT fk_frequente_T_PERSONNE FOREIGN KEY (Nom) REFERENCES T_PERSONNE (Nom),
   CONSTRAINT fk_frequente_pizzeria FOREIGN KEY (Pizzeria) REFERENCES T_PIZZERIA (Pizzeria)
);
 
CREATE TABLE T_MANGE
(
   Nom VARCHAR2(128),
   Pizza VARCHAR2(128),
   PRIMARY KEY(Nom, Pizza),   
   CONSTRAINT fk_mange_T_PERSONNE FOREIGN KEY (Nom) REFERENCES T_PERSONNE (Nom),
   CONSTRAINT fk_mange_pizza FOREIGN KEY (Pizza) REFERENCES T_PIZZA (Pizza) 
 );
 
 CREATE TABLE T_SERT
 (
   Pizzeria VARCHAR2(128),
   Pizza VARCHAR2(128),
   Prix NUMBER(5,2) NOT NULL,
   PRIMARY KEY (Pizzeria, Pizza),
   CONSTRAINT fk_sert_pizzeria FOREIGN KEY (Pizzeria) REFERENCES T_PIZZERIA (Pizzeria),
   CONSTRAINT fk_sert_pizza FOREIGN KEY (Pizza) REFERENCES T_PIZZA (Pizza)
); 

/* Insertion des données dans la table T_PERSONNE */
INSERT INTO T_PERSONNE VALUES ('Bob', 23, 'M');
INSERT INTO T_PERSONNE VALUES ('Lisa', 11, 'F');
INSERT INTO T_PERSONNE VALUES ('Julie', 88, 'F');
INSERT INTO T_PERSONNE VALUES ('Juliette', 19, 'F');
INSERT INTO T_PERSONNE VALUES ('Gustave', 25, 'M');
INSERT INTO T_PERSONNE VALUES ('Michel', 24, 'M');
INSERT INTO T_PERSONNE VALUES ('Sam', 12, 'M');
INSERT INTO T_PERSONNE VALUES ('Faustine', 28, 'F');
INSERT INTO T_PERSONNE VALUES ('Lison', 49, 'M');
INSERT INTO T_PERSONNE VALUES ('Vincent', 50, 'M');
INSERT INTO T_PERSONNE VALUES ('Roberto',25,'M');

/* Insertion des données dans la table PIZZERIA */
INSERT INTO T_PIZZERIA VALUES ('Pizza Dijon', 'Dijon', TO_DATE('12/03/2006', 'DD/MM/YYYY'));
INSERT INTO T_PIZZERIA VALUES ('Pizza Rapido', 'Dijon', TO_DATE('01/01/2014', 'DD/MM/YYYY'));
INSERT INTO T_PIZZERIA VALUES ('Speed Pizza', 'Dijon', TO_DATE('20/09/2000', 'DD/MM/YYYY'));
INSERT INTO T_PIZZERIA VALUES ('Pizza Italia', 'Dijon', TO_DATE('18/08/2006', 'DD/MM/YYYY'));
INSERT INTO T_PIZZERIA VALUES ('Pizza Gogo', 'Dijon', TO_DATE('18/09/1983', 'DD/MM/YYYY'));

/* Insertion des données dans la table CATEGORIE*/
INSERT INTO T_CATEGORIE VALUES ('Veg', 'Végétarienne');
INSERT INTO T_CATEGORIE VALUES ('Lig', 'Light');
INSERT INTO T_CATEGORIE VALUES ('Nor', 'Normal');

/* Insertion des données dans la table PIZZA */
INSERT INTO T_PIZZA VALUES ('Marinara', 'Veg');
INSERT INTO T_PIZZA VALUES ('Tradizionale', 'Nor');
INSERT INTO T_PIZZA VALUES ('Reine', 'Nor');
INSERT INTO T_PIZZA VALUES ('Margherita', 'Veg');
INSERT INTO T_PIZZA VALUES ('Quatre fromages','Veg');
INSERT INTO T_PIZZA VALUES ('Calzone','Nor');
INSERT INTO T_PIZZA VALUES ('Sicilienne', 'Lig');
INSERT INTO T_PIZZA VALUES ('Napolitaine','Nor');
INSERT INTO T_PIZZA VALUES ('Romaine','Nor');

/* Insertion des données dans la table T_FREQUENTE */
INSERT INTO T_FREQUENTE VALUES ('Bob','Pizza Dijon');
INSERT INTO T_FREQUENTE VALUES ('Bob','Pizza Gogo');
INSERT INTO T_FREQUENTE VALUES ('Bob','Pizza Rapido');
INSERT INTO T_FREQUENTE VALUES ('Lisa','Pizza Italia');
INSERT INTO T_FREQUENTE VALUES ('Julie','Pizza Gogo');
INSERT INTO T_FREQUENTE VALUES ('Julie','Pizza Dijon');
INSERT INTO T_FREQUENTE VALUES ('Juliette','Pizza Italia');
INSERT INTO T_FREQUENTE VALUES ('Juliette','Pizza Gogo');
INSERT INTO T_FREQUENTE VALUES ('Juliette','Pizza Rapido');
INSERT INTO T_FREQUENTE VALUES ('Juliette','Speed Pizza');
INSERT INTO T_FREQUENTE VALUES ('Gustave','Pizza Dijon');
INSERT INTO T_FREQUENTE VALUES ('Gustave','Pizza Italia');
INSERT INTO T_FREQUENTE VALUES ('Michel','Pizza Italia');
INSERT INTO T_FREQUENTE VALUES ('Michel','Speed Pizza');
INSERT INTO T_FREQUENTE VALUES ('Sam','Pizza Gogo');
INSERT INTO T_FREQUENTE VALUES ('Sam','Pizza Italia');
INSERT INTO T_FREQUENTE VALUES ('Sam','Pizza Dijon');
INSERT INTO T_FREQUENTE VALUES ('Faustine','Pizza Dijon');
INSERT INTO T_FREQUENTE VALUES ('Lison','Pizza Rapido');
INSERT INTO T_FREQUENTE VALUES ('Lison','Pizza Italia');
INSERT INTO T_FREQUENTE VALUES ('Vincent','Pizza Rapido');
INSERT INTO T_FREQUENTE VALUES ('Vincent','Speed Pizza');
INSERT INTO T_FREQUENTE VALUES ('Vincent','Pizza Italia');

/* Insertion des données dans la table T_MANGE */
INSERT INTO T_MANGE VALUES ('Bob','Marinara');
INSERT INTO T_MANGE VALUES ('Bob','Sicilienne');
INSERT INTO T_MANGE VALUES ('Bob','Reine');
INSERT INTO T_MANGE VALUES ('Bob','Quatre fromages');
INSERT INTO T_MANGE VALUES ('Lisa','Sicilienne');
INSERT INTO T_MANGE VALUES ('Julie','Sicilienne');
INSERT INTO T_MANGE VALUES ('Juliette','Tradizionale');
INSERT INTO T_MANGE VALUES ('Juliette','Napolitaine');
INSERT INTO T_MANGE VALUES ('Juliette','Reine');
INSERT INTO T_MANGE VALUES ('Juliette','Romaine');
INSERT INTO T_MANGE VALUES ('Gustave','Napolitaine');
INSERT INTO T_MANGE VALUES ('Gustave','Romaine');
INSERT INTO T_MANGE VALUES ('Michel','Margherita');
INSERT INTO T_MANGE VALUES ('Michel','Napolitaine');
INSERT INTO T_MANGE VALUES ('Michel','Reine');
INSERT INTO T_MANGE VALUES ('Michel','Romaine');
INSERT INTO T_MANGE VALUES ('Sam','Calzone');
INSERT INTO T_MANGE VALUES ('Sam','Marinara');
INSERT INTO T_MANGE VALUES ('Faustine','Sicilienne');
INSERT INTO T_MANGE VALUES ('Faustine','Reine');
INSERT INTO T_MANGE VALUES ('Faustine','Tradizionale');
INSERT INTO T_MANGE VALUES ('Faustine','Romaine');
INSERT INTO T_MANGE VALUES ('Faustine','Napolitaine');
INSERT INTO T_MANGE VALUES ('Lison','Marinara');
INSERT INTO T_MANGE VALUES ('Lison','Napolitaine');
INSERT INTO T_MANGE VALUES ('Lison','Reine');
INSERT INTO T_MANGE VALUES ('Lison','Quatre fromages');
INSERT INTO T_MANGE VALUES ('Vincent','Marinara');
INSERT INTO T_MANGE VALUES ('Vincent','Napolitaine');
INSERT INTO T_MANGE VALUES ('Vincent','Reine');
INSERT INTO T_MANGE VALUES ('Vincent','Quatre fromages');
INSERT INTO T_MANGE VALUES ('Vincent', 'Calzone') ;

/* Insertion des données dans la table T_SERT */
INSERT INTO T_SERT VALUES ('Pizza Dijon','Marinara',9);
INSERT INTO T_SERT VALUES ('Pizza Dijon','Tradizionale',11);
INSERT INTO T_SERT VALUES ('Pizza Dijon','Reine',12);
INSERT INTO T_SERT VALUES ('Pizza Dijon','Margherita',13);
INSERT INTO T_SERT VALUES ('Pizza Dijon','Napolitaine',9);
INSERT INTO T_SERT VALUES ('Pizza Rapido','Marinara',9);
INSERT INTO T_SERT VALUES ('Pizza Rapido','Quatre fromages',16);
INSERT INTO T_SERT VALUES ('Pizza Rapido','Tradizionale',17);
INSERT INTO T_SERT VALUES ('Pizza Rapido','Sicilienne',18);
INSERT INTO T_SERT VALUES ('Speed Pizza','Quatre fromages',19);
INSERT INTO T_SERT VALUES ('Speed Pizza','Tradizionale',9);
INSERT INTO T_SERT VALUES ('Speed Pizza','Reine',11);
INSERT INTO T_SERT VALUES ('Speed Pizza','Calzone',12);
INSERT INTO T_SERT VALUES ('Speed Pizza','Napolitaine',13);
INSERT INTO T_SERT VALUES ('Pizza Italia','Marinara',9);
INSERT INTO T_SERT VALUES ('Pizza Italia','Romaine',15);
INSERT INTO T_SERT VALUES ('Pizza Italia','Reine',16);
INSERT INTO T_SERT VALUES ('Pizza Italia','Margherita',17);
INSERT INTO T_SERT VALUES ('Pizza Italia','Sicilienne',18);
INSERT INTO T_SERT VALUES ('Pizza Italia','Napolitaine',19);
INSERT INTO T_SERT VALUES ('Pizza Italia','Tradizionale',9);
INSERT INTO T_SERT VALUES ('Pizza Gogo','Quatre fromages',19);
INSERT INTO T_SERT VALUES ('Pizza Gogo','Tradizionale',9);
INSERT INTO T_SERT VALUES ('Pizza Gogo','Margherita',11);
INSERT INTO T_SERT VALUES ('Pizza Gogo','Calzone',12);
INSERT INTO T_SERT VALUES ('Pizza Gogo','Romaine',13);

/*Partie 1*/
/*1*/
SELECT Nom
FROM T_Personne
WHERE Sexe = 'F';

/*2*/
SELECT Pizza
FROM T_Mange
WHERE Nom = 'Vincent';

/*3*/
SELECT Nom
FROM T_Personne
WHERE Age >= 60
UNION
    (SELECT Nom 
    FROM T_Frequente
    WHERE Pizzeria = 'Pizza Gogo');
SELECT DISTINCT(T_Personne.Nom)
FROM T_Personne INNER JOIN T_Frequente ON (T_Personne.Nom = T_Frequente.Nom)
WHERE (Age >= 60) OR (Pizzeria = 'Pizza Gogo');

/*4*/
SELECT Pizza
FROM T_SERT
WHERE Prix < 10
INTERSECT
    (SELECT Pizza 
    FROM T_Personne INNER JOIN T_Mange ON (T_Personne.Nom = T_Mange.Nom)
    WHERE Sexe = 'F');
SELECT DISTINCT(T_Sert.Pizza)
FROM T_Sert INNER JOIN T_Mange ON (T_Sert.Pizza = T_Mange.Pizza) INNER JOIN T_personne ON (T_Mange.Nom = T_Personne.Nom)
WHERE (Prix < 10) AND (Sexe = 'F');

/*5*/
/*La première est fausse car ca renvoie la liste des pizzas qui sont mangés par au moins une personne de moins de 25 ans.*/
SELECT Pizza
FROM T_Mange
WHERE T_Mange.Pizza NOT IN (
                      SELECT T_Mange.Pizza
                      FROM T_Mange INNER JOIN T_Personne ON (T_Mange.Nom = T_Personne.Nom)
                      WHERE Age > 25);
SELECT Pizza
FROM T_Mange
MINUS
(SELECT T_Mange.Pizza
FROM T_Mange INNER JOIN T_Personne ON (T_Mange.Nom = T_Personne.Nom)
WHERE Age > 25);

/*6*/
SELECT T_Personne.Nom
FROM T_Personne INNER JOIN T_Mange ON (T_Personne.Nom = T_Mange.Nom) INNER JOIN T_Sert ON (T_Mange.Pizza = T_Sert.Pizza)  
WHERE (Sexe = 'F') AND (Pizzeria = 'Pizza Gogo');

/*7*/
SELECT T_Sert.Pizzeria
FROM T_Personne INNER JOIN T_Mange ON (T_Personne.Nom = T_Mange.Nom) INNER JOIN T_Sert ON (T_Mange.Pizza = T_Sert.Pizza)
WHERE (T_Sert.Prix <= 10) AND (T_Personne.Nom = 'Gustave')
INTERSECT
(SELECT T_Sert.Pizzeria
FROM T_Personne INNER JOIN T_Mange ON (T_Personne.Nom = T_Mange.Nom) INNER JOIN T_Sert ON (T_Mange.Pizza = T_Sert.Pizza)
WHERE (T_Sert.Prix <= 10) AND (T_Personne.Nom = 'Faustine'));

/*8*/
SELECT T_Mange.Nom
FROM T_Mange INNER JOIN T_Sert ON (T_Mange.Pizza = T_Sert.Pizza)
WHERE Pizzeria = 'Pizza Gogo';

SELECT T_Frequente.Nom
FROM T_Frequente
WHERE Pizzeria = 'Pizza Gogo';

SELECT T_Mange.Nom
FROM T_Mange INNER JOIN T_Sert ON (T_Mange.Pizza = T_Sert.Pizza)
WHERE Pizzeria = 'Pizza Gogo'
MINUS
(SELECT T_Frequente.Nom
FROM T_Frequente
WHERE Pizzeria = 'Pizza Gogo');

/*Partie 2*/
/*1*/
SELECT Pizzeria
FROM T_Pizzeria
WHERE EXTRACT(YEAR FROM DateCreation) = '2006';

SELECT Pizzeria
FROM T_Pizzeria
WHERE TO_CHAR(DateCreation, 'YYYY') = '2006';

/*2*/
SELECT Pizzeria
FROM T_Pizzeria
WHERE TO_CHAR(DATECREATION, 'YYYY/MM/DD') = '1983/09/18';

SELECT Pizzeria
FROM T_Pizzeria
WHERE DateCreation = TO_DATE('18/09/1983', 'DD/MM/YYYY');

/*3*/
SELECT AVG(LENGTH(Pizza)) AS Moyenne
FROM T_Pizza;

/*4*/
SELECT Pizza
FROM T_Mange
WHERE UPPER(Nom) = '&nomVar';

/*5*/
SELECT Nom, COUNT(Pizza) AS nombreDePizzaMangé
FROM T_Mange
GROUP BY Nom
ORDER BY nombreDePizzaMangé DESC;

/*6*/
SELECT Nom, COUNT(Pizza) AS nombreDePizzaMangé
FROM T_Mange
GROUP BY Nom
UNION
(SELECT Nom, 0
FROM T_Personne
WHERE T_Personne.Nom NOT IN (SELECT T_Mange.Nom
                            FROM T_Mange))
ORDER BY nombreDePizzaMangé DESC;
                            
SELECT T_Personne.Nom, NVL(SubTotal.nombreDePizzaMangé, 0) AS T
FROM T_Personne
LEFT OUTER JOIN
(SELECT Nom, COUNT(Pizza) AS nombreDePizzaMangé
FROM T_Mange
GROUP BY Nom
ORDER BY nombreDePizzaMangé DESC) SubTotal
ON T_Personne.Nom = SubTotal.Nom;

SELECT T_Personne.Nom, NVL(SubTotal.nombreDePizzaMangé, 0)
FROM T_Personne
LEFT OUTER JOIN
            (SELECT Nom, COUNT(Pizza) AS nombreDePizzaMangé
            FROM T_Mange
            GROUP BY Nom) SubTotal
ON T_Personne.Nom = SubTotal.Nom;

/*7*/
SELECT Pizzeria, MIN(Prix) AS prixDeLaPizzaLaPlusChère, MAX(Prix) AS prixDeLaPizzaLaMoinsChère, COUNT(Pizza) AS nombreDePizza
FROM T_Sert
GROUP BY Pizzeria;

/*8*/
SELECT Pizzeria, MIN(Prix) AS prixDeLaPizzaLaPlusChère, MAX(Prix) AS prixDeLaPizzaLaMoinsChère, COUNT(Pizza) AS nombreDePizza
FROM T_Sert
GROUP BY Pizzeria
HAVING COUNT(Pizza) < 5;

/*9*/
SELECT T_Mange.Nom, COUNT(T_mange.Pizza)
FROM T_Mange INNER JOIN T_Pizza ON (T_Mange.Pizza = T_Pizza.Pizza) INNER JOIN T_Categorie ON (T_Pizza.CodeCategorie = T_Categorie.CodeCategorie)
WHERE T_Categorie.Categorie = 'Végétarienne'
GROUP BY T_Mange.Nom;

/*10*/
SELECT T_Mange.Nom, COUNT(T_mange.Pizza)
FROM T_Mange INNER JOIN T_Pizza ON (T_Mange.Pizza = T_Pizza.Pizza) INNER JOIN T_Categorie ON (T_Pizza.CodeCategorie = T_Categorie.CodeCategorie)
WHERE T_Categorie.Categorie = 'Végétarienne'
GROUP BY T_Mange.Nom
HAVING COUNT(T_mange.Pizza) >= 2;

/*11*/
SELECT T_Mange.Nom, COUNT(T_mange.Pizza)
FROM T_Mange INNER JOIN T_Pizza ON (T_Mange.Pizza = T_Pizza.Pizza)
WHERE T_Mange.Nom IN (
                        SELECT T_Mange.Nom
                        FROM T_Mange INNER JOIN T_Pizza ON (T_Mange.Pizza = T_Pizza.Pizza) INNER JOIN T_Categorie ON (T_Pizza.CodeCategorie = T_Categorie.CodeCategorie)
                        WHERE T_Categorie.Categorie = 'Végétarienne')
GROUP BY T_Mange.Nom;

/*12*/
SELECT T_Mange.Nom
FROM T_Mange INNER JOIN T_Pizza ON (T_Mange.Pizza = T_Pizza.Pizza) INNER JOIN T_Categorie ON (T_Pizza.CodeCategorie = T_Categorie.CodeCategorie)
WHERE (T_Categorie.Categorie = 'Végétarienne')
INTERSECT
(SELECT T_Mange.Nom
FROM T_Mange INNER JOIN T_Pizza ON (T_Mange.Pizza = T_Pizza.Pizza) INNER JOIN T_Categorie ON (T_Pizza.CodeCategorie = T_Categorie.CodeCategorie)
WHERE (T_Categorie.Categorie = 'Light'));

/*13*/
SELECT MAX(COUNT(T_Mange.Pizza)) AS maximum
FROM T_Mange INNER JOIN T_Pizza ON (T_Mange.Pizza = T_Pizza.Pizza)
GROUP BY T_Mange.Nom;

/*14*/
SELECT T_Mange.Nom, COUNT(T_Mange.Pizza)
FROM T_Mange INNER JOIN T_Pizza ON (T_Mange.Pizza = T_Pizza.Pizza)
GROUP BY T_Mange.Nom
HAVING COUNT(T_Mange.Pizza) = (SELECT MAX(COUNT(T_Mange.Pizza)) AS maximum
                                FROM T_Mange INNER JOIN T_Pizza ON (T_Mange.Pizza = T_Pizza.Pizza)
                                GROUP BY T_Mange.Nom);

/*15*/
SELECT T_Mange.Nom, COUNT(T_Mange.Pizza)
FROM T_Mange INNER JOIN T_Pizza ON (T_Mange.Pizza = T_Pizza.Pizza)
WHERE T_Mange.Pizza = (
SELECT T_Mange.Pizza
FROM T_Mange INNER JOIN T_Pizza ON (T_Mange.Pizza = T_Pizza.Pizza)
WHERE T_Mange.Nom = 'Lisa')
GROUP BY T_Mange.Nom;