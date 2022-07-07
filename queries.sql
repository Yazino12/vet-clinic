/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '01-01-2016' AND '01-01-2019';
SELECT name from animals WHERE (neutered = '1' AND escape_attempts < 3);
SELECT date_of_birth from animals WHERE (name = 'Agumon' OR name = 'Pikachu');
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = '1';
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
	UPDATE animals SET species = NULL;
	ROLLBACK;
COMMIT;

BEGIN;
	UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
	UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
	DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
	DELETE FROM animals WHERE date_of_birth > 'January 01, 2022';
SAVEPOINT here;
	UPDATE animals SET weight_kg = weight_kg * (-1);
ROLLBACK TO SAVEPOINT here;
	UPDATE animals SET weight_kg = weight_kg * (-1) WHERE weight_kg < 0;
COMMIT;
SELECT * from animals;

SELECT COUNT(*) FROM animals;
SELECT COUNT(escape_attempts) from animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) 
FROM animals WHERE date_of_birth 
BETWEEN 'January 01, 1990' AND 'Jan 01, 2000' 
GROUP BY species;

SELECT animals.name FROM animals JOIN owners ON owners.id = animals.owner_id 
WHERE owners.full_name = 'Melody Pond';
SELECT animals.name FROM animals JOIN species ON species.id = animals.species_id WHERE species.name = 'Pokemon';
SELECT owners.full_name, animals.name FROM owners FULL JOIN animals ON owners.id = animals.owner_id;
SELECT species.name, COUNT(animals.name) FROM species JOIN animals ON species.id = animals.species_id GROUP BY species.name;
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id 
WHERE species.id = 2 AND owners.id = 2;
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
select owners.full_name, count(animals.owner_id) FROM owners JOIN animals ON owners.id = animals.owner_id 
GROUP BY owners.full_name ORDER BY count(animals.owner_id) DESC LIMIT 1;















