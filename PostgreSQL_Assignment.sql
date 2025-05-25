-- Active: 1747460960782@@localhost@5432@conservation_db
CREATE DATABASE conservation_db;

-- rangers table 
CREATE TABLE rangers(
    id SERIAL PRIMARY KEY,
    rangers_name VARCHAR(100) NOT NULL,
    rangers_region VARCHAR(100)
);
drop table rangers;
INSERT INTO rangers (rangers_name, rangers_region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range'),
('David Storm', 'Grassland Sector'),
('Eva Stone', 'Coastal Zone'),
('Frank Blade', 'Rainforest Reserve');

SELECT * FROM  rangers ; 

-- species table 
CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    species_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL,
    discovery_date DATE,
    conservation_status VARCHAR(100)
);
-- drop TABLE species;
INSERT INTO species (species_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered'),
('Great Indian Bustard', 'Ardeotis nigriceps', '1861-01-01', 'Endangered'),
('Indian Pangolin', 'Manis crassicaudata', '1822-01-01', 'Endangered');

SELECT * FROM species;
UPDATE species
SET conservation_status = 'Vulnerable' 
WHERE conservation_status = 'Critically Endangered';
--  sightings table 
CREATE TABLE sightings(
    id SERIAL PRIMARY KEY,
    sighting_time  TIMESTAMP NOT NULL,
    sighting_location VARCHAR(100) NOT NULL,
    sighting_notes VARCHAR(500),
    rangers_id INT NOT NULL,
    species_id INT NOT NULL,
    Foreign Key (rangers_id) REFERENCES rangers (id),
    Foreign Key (species_id) REFERENCES species (id)
);
INSERT INTO sightings (sighting_time, sighting_location, sighting_notes, rangers_id, species_id) VALUES
('2024-05-10 07:45:00', 'Peak Ridge',        'Camera trap image captured', 1, 1),
('2024-05-12 16:20:00', 'Bankwood Area',     'Juvenile seen',              2, 2),
('2024-05-15 09:10:00', 'Bamboo Grove East', 'Feeding observed',           3, 3),
('2024-05-18 18:30:00', 'Snowfall Pass',     NULL,                         2, 1),
('2024-05-20 06:55:00', 'Riverbend Valley',  'Tracks found near water',    1, 4),
('2024-05-22 13:40:00', 'Foggy Ridge',       'Nest discovered',            3, 2);

-- drop Table sightings;
SELECT * FROM sightings;

-- problem - 1  
INSERT INTO rangers (rangers_name, rangers_region) VALUES
('Derek Fox', 'Coastal Plains');

-- SELECT * FROM rangers;

-- problem - 2
SELECT  count(DISTINCT ID) AS unique_species_count FROM species;

-- problem - 3
SELECT * FROM sightings  
WHERE sighting_location ILIKE '%Pass%';

-- problem - 4
SELECT rangers_name , count(*) As total_sightings  FROM rangers 
GROUP BY rangers_name;

-- problem - 5
SELECT species_name As common_name  FROM species s 
LEFT JOIN sightings si ON s.id = si.species_id 
WHERE si.species_id IS NULL;

-- problem - 6

SELECT s.species_name As common_name ,  si.sighting_time , r.rangers_name FROM 
sightings si
INNER JOIN species s  ON  si.species_id = s.id
INNER JOIN rangers r  ON  si.rangers_id = r.id 
ORDER BY si.sighting_time DESC LIMIT 2 ;

-- problem - 7 
SELECT extract(year FROM discovery_date) FROM species;

UPDATE species 
set conservation_status = 'Historic'
WHERE extract(year FROM discovery_date) > 1800 ;