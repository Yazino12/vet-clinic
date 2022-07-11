/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon','February 3, 2020',0,'1',10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon','November 15, 2018',2,'1',8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu','January 7, 2021',1,'0',15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon','May 12, 2017',5,'1',11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander','February 8, 2020',0,'0',-11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon','November 15, 2021',2,'1',-5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle','April 2, 1993',3,'0',-12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon','June 12, 2005',1,'1',-45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon','June 7, 2005',7,'1',20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom','October 13, 1998',3,'1',17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto','May 14, 2022',4,'1',22);

INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');
UPDATE animals SET species_id = 2 WHERE animals.name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon','Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon','Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander','Squirtle','Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon','Boarmon');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher',45,'April 23, 2000');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith',26,'January 17, 2019');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez',64,'May 4, 1981');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness',38,'June 8, 2008');
INSERT INTO specializations(species_id,vets_id) VALUES (1,1);
INSERT INTO specializations(species_id,vets_id) VALUES (2,3);
INSERT INTO specializations(species_id,vets_id) VALUES (1,3);
INSERT INTO specializations(species_id,vets_id) VALUES (2,4);
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (1,1,'May 24, 2020');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (1,3,'July 22, 2020');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (2,4,'February 2, 2021');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (3,2,'January 5, 2020');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (3,2,'March 8, 2020');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (3,2,'May 14, 2020');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (4,3,'May 4, 2021');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (5,4,'February 24, 2021');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (6,2,'December 21, 2019');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (6,1,'August 10, 2020');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (6,2,'April 7, 2021');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (7,3,'September 29, 2019');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (8,4,'October 03, 2020');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (8,4,'November 04, 2020');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (9,2,'January 24, 2019');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (9,2,'May 15, 2019');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (9,2,'February 27, 2020');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (9,2,'August 3, 2020');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (10,3,'May 24, 2020');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (10,1,'January 11, 2021');


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
