CREATE DATABASE IF NOT EXISTS stackoverflow;
--
USE stackoverflow;
--
SELECT DATABASE() AS db;
--
SHOW TABLES;
DESCRIBE users;
OPTIMIZE TABLE users;
ANALYZE TABLE users;
SHOW INDEXES FROM users;
--
SELECT * FROM stackoverflow.users;
EXPLAIN SELECT * FROM stackoverflow.users;
--
SELECT COUNT(*) AS number_of_rows FROM stackoverflow.users;
EXPLAIN SELECT COUNT(*) AS number_of_rows FROM stackoverflow.users;
--
SELECT * FROM users ORDER BY displayname DESC, location ASC, reputation DESC LIMIT 635558;
EXPLAIN SELECT * FROM users ORDER BY displayname DESC, location ASC, reputation DESC LIMIT 635558;
--
SELECT * FROM users WHERE id = 5000;
EXPLAIN SELECT * FROM users WHERE id = 5000;
--
ALTER TABLE users ADD PRIMARY KEY(id);
--
SELECT * FROM users ORDER BY displayname DESC, location ASC, reputation DESC LIMIT 635558;
EXPLAIN SELECT * FROM users ORDER BY displayname DESC, location ASC, reputation DESC LIMIT 635558;
--
SELECT * FROM users ORDER BY id ASC;
SELECT * FROM users ORDER BY id DESC;
--
EXPLAIN SELECT * FROM users ORDER BY id ASC;
EXPLAIN SELECT * FROM users ORDER BY id DESC;
--
SELECT * FROM users WHERE id = 5000;
EXPLAIN SELECT * FROM users WHERE id = 5000;
--
SELECT * FROM users;
SELECT * FROM users ORDER BY id ASC;
SELECT * FROM users ORDER BY displayname ASC;
SELECT displayname FROM users ORDER BY displayname ASC;
SELECT location FROM users ORDER BY displayname ASC;
SELECT id FROM users ORDER BY displayname ASC;
--
EXPLAIN SELECT * FROM users;
EXPLAIN SELECT * FROM users ORDER BY id ASC;
EXPLAIN SELECT * FROM users ORDER BY displayname ASC;
EXPLAIN SELECT displayname FROM users ORDER BY displayname ASC;
EXPLAIN SELECT location FROM users ORDER BY displayname ASC;
EXPLAIN SELECT id FROM users ORDER BY displayname ASC;
--
SELECT * FROM users where displayname = "Joel Spolsky";
EXPLAIN SELECT * FROM users where displayname = "Joel Spolsky";
--
SELECT displayname FROM users where displayname = "Joel Spolsky";
EXPLAIN SELECT displayname FROM users where displayname = "Joel Spolsky";
--
SELECT * FROM users ORDER BY displayname ASC;
EXPLAIN SELECT * FROM users ORDER BY displayname ASC;
--
SELECT * FROM users where displayname = "Joel Spolsky" ORDER BY displayname ASC;
EXPLAIN SELECT * FROM users where displayname = "Joel Spolsky" ORDER BY displayname ASC;
--
SELECT displayname FROM users where displayname = "Joel Spolsky" ORDER BY displayname ASC;
EXPLAIN SELECT displayname FROM users where displayname = "Joel Spolsky" ORDER BY displayname ASC;
--
ALTER TABLE users MODIFY COLUMN displayname VARCHAR(256);
--
CREATE INDEX idx_UsersDisplayname1 ON users(displayname);
--
SELECT * FROM users where displayname = "Joel Spolsky";
EXPLAIN SELECT * FROM users where displayname = "Joel Spolsky";
--
SELECT displayname FROM users where displayname = "Joel Spolsky";
EXPLAIN SELECT displayname FROM users where displayname = "Joel Spolsky";
--
SELECT * FROM users ORDER BY displayname ASC;
EXPLAIN SELECT * FROM users ORDER BY displayname ASC;
--
SELECT * FROM users where displayname = "Joel Spolsky" ORDER BY displayname ASC;
EXPLAIN SELECT * FROM users where displayname = "Joel Spolsky" ORDER BY displayname ASC;
--
SELECT displayname FROM users where displayname = "Joel Spolsky" ORDER BY displayname ASC;
EXPLAIN SELECT displayname FROM users where displayname = "Joel Spolsky" ORDER BY displayname ASC;
--
SELECT displayname, LENGTH(displayname) AS length_of_displayname FROM users ORDER BY length_of_displayname DESC LIMIT 10;
EXPLAIN SELECT displayname, LENGTH(displayname) AS length_of_displayname FROM users ORDER BY length_of_displayname DESC LIMIT 10;
--
SELECT displayname, LENGTH(displayname) AS length_of_displayname FROM users ORDER BY 1 DESC LIMIT 10;
EXPLAIN SELECT displayname, LENGTH(displayname) AS length_of_displayname FROM users ORDER BY 1 DESC LIMIT 10;
--
SHOW INDEXES FROM users;
--
SELECT * FROM users where displayname = "Joel Spolsky" OR displayname = "Milan"; 
EXPLAIN SELECT * FROM users where displayname = "Joel Spolsky" OR displayname = "Milan"; 
--
SELECT displayname FROM users where displayname = "Joel Spolsky" OR displayname = "Milan"; 
EXPLAIN SELECT displayname FROM users where displayname = "Joel Spolsky" OR displayname = "Milan"; 
--
SELECT * FROM users where displayname = "Joel Spolsky" OR location = "Corvallis, OR"; 
EXPLAIN SELECT * FROM users where displayname = "Joel Spolsky" OR location = "Corvallis, OR"; 
--
SELECT displayname, location FROM users where displayname = "Joel Spolsky" OR location = "Corvallis, OR"; 
EXPLAIN SELECT displayname, location FROM users where displayname = "Joel Spolsky" OR location = "Corvallis, OR"; 
--
ALTER TABLE users MODIFY COLUMN location VARCHAR(256);
--
CREATE INDEX idx_UsersDisplayname1 ON users(displayname);
CREATE INDEX idx_UsersDisplayname2 ON users(location);
--
CREATE INDEX idx_UsersDisplayname3 ON users(displayname, location);
SELECT * FROM users where displayname = '? Jonas Gorauskas' AND location = 'Reno, NV'; 
EXPLAIN SELECT * FROM users where displayname = '? Jonas Gorauskas' AND location = 'Reno, NV'; 
SELECT displayname, location FROM users where displayname = '? Jonas Gorauskas' AND location = 'Reno, NV'; 
EXPLAIN SELECT displayname, location FROM users where displayname = '? Jonas Gorauskas' AND location = 'Reno, NV'; 
SELECT * FROM users where location = 'Reno, NV' AND displayname = '? Jonas Gorauskas'; 
EXPLAIN SELECT * FROM users where location = 'Reno, NV' AND displayname = '? Jonas Gorauskas'; 
SELECT displayname, location FROM users where location = 'Reno, NV' AND displayname = '? Jonas Gorauskas'; 
EXPLAIN SELECT displayname, location FROM users where location = 'Reno, NV' AND displayname = '? Jonas Gorauskas'; 
--
SELECT * FROM users where displayname = "Joel Spolsky" OR location = "Corvallis, OR"; 
EXPLAIN SELECT * FROM users where displayname = "Joel Spolsky" OR location = "Corvallis, OR"; 
--
SELECT displayname, location FROM users where displayname = "Joel Spolsky" OR location = "Corvallis, OR"; 
EXPLAIN SELECT displayname, location FROM users where displayname = "Joel Spolsky" OR location = "Corvallis, OR"; 
--
SELECT * FROM users WHERE displayname = "Joel Spolsky";
EXPLAIN SELECT * FROM users WHERE displayname = "Joel Spolsky"; 
-- 
SELECT displayname FROM users WHERE displayname = "Joel Spolsky"; 
EXPLAIN SELECT displayname FROM users WHERE displayname = "Joel Spolsky"; 
--
SELECT * FROM users WHERE displayname = "Joel Spolsky" AND location = "New York, NY";
EXPLAIN SELECT * FROM users WHERE displayname = "Joel Spolsky" AND location = "New York, NY";
--
SELECT displayname, location FROM users WHERE displayname = "Joel Spolsky" AND location = "New York, NY";
EXPLAIN SELECT displayname, location FROM users WHERE displayname = "Joel Spolsky" AND location = "New York, NY";
--
SELECT * FROM users WHERE location = "New York, NY" and displayname = "Joel Spolsky";
EXPLAIN SELECT * FROM users WHERE location = "New York, NY" and displayname = "Joel Spolsky";
--
SELECT location, displayname FROM users WHERE location = "New York, NY" and displayname = "Joel Spolsky";
EXPLAIN SELECT location, displayname FROM users WHERE location = "New York, NY" and displayname = "Joel Spolsky";
--
SELECT * FROM users WHERE location = "Corvallis, OR";
EXPLAIN SELECT * FROM users WHERE location = "Corvallis, OR";
--
SELECT location FROM users WHERE location = "Corvallis, OR";
EXPLAIN SELECT location FROM users WHERE location = "Corvallis, OR";
--
SELECT * FROM users ORDER BY lastaccessdate ASC;
EXPLAIN SELECT * FROM users ORDER BY lastaccessdate ASC;
--
SELECT lastaccessdate FROM users ORDER BY lastaccessdate ASC;
EXPLAIN SELECT lastaccessdate FROM users ORDER BY lastaccessdate ASC;
--
ALTER TABLE users MODIFY COLUMN lastaccessdate DATE;
--
CREATE INDEX idx_UsersLastAcessDate1 ON users(lastaccessdate);
SHOW INDEXES FROM users;
--
SELECT * FROM users ORDER BY lastaccessdate ASC;
EXPLAIN SELECT * FROM users ORDER BY lastaccessdate ASC;
--
SELECT lastaccessdate FROM users ORDER BY lastaccessdate ASC;
EXPLAIN SELECT lastaccessdate FROM users ORDER BY lastaccessdate ASC;
--
SELECT AVG(reputation), MAX(reputation), MIN(reputation) FROM users;
EXPLAIN SELECT AVG(reputation), MAX(reputation), MIN(reputation) FROM users;
--
CREATE INDEX idx_UsersLastAcessReputation1 ON users(reputation);
SHOW INDEXES FROM users;
--
SELECT AVG(reputation), MAX(reputation), MIN(reputation) FROM users;
EXPLAIN SELECT AVG(reputation), MAX(reputation), MIN(reputation) FROM users;
--
SELECT * FROM users WHERE displayname LIKE "Joel%";
EXPLAIN SELECT * FROM users WHERE displayname LIKE "Joel%";
--
SELECT displayname FROM users WHERE displayname LIKE "Joel%";
EXPLAIN SELECT displayname FROM users WHERE displayname LIKE "Joel%";
--
EXPLAIN FORMAT = JSON SELECT * FROM users WHERE displayname LIKE "Joel%";
EXPLAIN FORMAT = JSON SELECT displayname FROM users WHERE displayname LIKE "Joel%";
--
EXPLAIN FORMAT = TREE SELECT * FROM users WHERE displayname = "Joel";
EXPLAIN FORMAT = TREE SELECT displayname FROM users WHERE displayname = "Joel";
--
EXPLAIN FORMAT = TREE SELECT * FROM users ORDER BY displayname ASC;
EXPLAIN FORMAT = TREE SELECT displayname FROM users ORDER BY displayname ASC;
--
EXPLAIN ANALYZE SELECT * FROM users ORDER BY displayname ASC;
EXPLAIN ANALYZE SELECT displayname FROM users ORDER BY displayname ASC;
--
EXPLAIN ANALYZE SELECT * FROM users WHERE displayname = "Joel";
EXPLAIN ANALYZE SELECT displayname FROM users WHERE displayname = "Joel";
--
SELECT * FROM users WHERE displayname LIKE "Joel%";
EXPLAIN SELECT * FROM users WHERE displayname LIKE "Joel%";
--
SELECT displayname FROM users WHERE displayname LIKE "Joel%";
EXPLAIN SELECT displayname FROM users WHERE displayname LIKE "Joel%";
--
SELECT * FROM users WHERE displayname LIKE "%Joel";-- no index used.
EXPLAIN SELECT * FROM users WHERE displayname LIKE "%Joel";-- no index used.
--
SELECT displayname FROM users WHERE displayname LIKE "%Joel";-- no index used.
EXPLAIN SELECT displayname FROM users WHERE displayname LIKE "%Joel";-- no index used.
--
SELECT * FROM users WHERE displayname LIKE "%Joel%";-- no index used.
EXPLAIN SELECT * FROM users WHERE displayname LIKE "%Joel%";-- no index used.
--
SELECT displayname FROM users WHERE displayname LIKE "%Joel%";-- no index used.
EXPLAIN SELECT displayname FROM users WHERE displayname LIKE "%Joel%";-- no index used.
--
EXPLAIN FORMAT = TREE SELECT * FROM users WHERE creationdate = "2009-06-28"; 
EXPLAIN FORMAT = TREE SELECT creationdate FROM users WHERE creationdate = "2009-06-28"; 
EXPLAIN FORMAT = JSON SELECT * FROM users WHERE creationdate = "2009-06-28"; 
EXPLAIN FORMAT = JSON SELECT creationdate FROM users WHERE creationdate = "2009-06-28"; 
EXPLAIN SELECT * FROM users WHERE creationdate = "2009-06-28";
EXPLAIN SELECT creationdate FROM users WHERE creationdate = "2009-06-28";
EXPLAIN ANALYZE SELECT * FROM users WHERE creationdate = "2009-06-28";
EXPLAIN ANALYZE SELECT creationdate FROM users WHERE creationdate = "2009-06-28";
SELECT * FROM users WHERE creationdate = "2009-06-28";
SELECT creationdate FROM users WHERE creationdate = "2009-06-28";
SELECT COUNT(*) AS number_of_rows FROM users WHERE creationdate = "2009-06-28";
--
ALTER TABLE users MODIFY COLUMN CreationDate DATE;
CREATE INDEX idx_Userscreationdate1 ON users(CreationDate); 
SHOW INDEXES FROM users;
--
EXPLAIN FORMAT = TREE SELECT * FROM users WHERE creationdate = "2009-06-28"; 
EXPLAIN FORMAT = TREE SELECT creationdate FROM users WHERE creationdate = "2009-06-28"; 
EXPLAIN FORMAT = JSON SELECT * FROM users WHERE creationdate = "2009-06-28"; 
EXPLAIN FORMAT = JSON SELECT creationdate FROM users WHERE creationdate = "2009-06-28"; 
EXPLAIN SELECT * FROM users WHERE creationdate = "2009-06-28";
EXPLAIN SELECT creationdate FROM users WHERE creationdate = "2009-06-28";
EXPLAIN ANALYZE SELECT * FROM users WHERE creationdate = "2009-06-28";
EXPLAIN ANALYZE SELECT creationdate FROM users WHERE creationdate = "2009-06-28";
SELECT * FROM users WHERE creationdate = "2009-06-28";
SELECT creationdate FROM users WHERE creationdate = "2009-06-28";
SELECT COUNT(*) AS number_of_rows FROM users WHERE creationdate = "2009-06-28";
--
SELECT creationdate, id FROM users WHERE creationdate = "2009-06-28";
EXPLAIN SELECT creationdate, id FROM users WHERE creationdate = "2009-06-28";
EXPLAIN FORMAT = TREE SELECT creationdate, id FROM users WHERE creationdate = "2009-06-28";
EXPLAIN FORMAT = JSON SELECT creationdate, id FROM users WHERE creationdate = "2009-06-28";
EXPLAIN ANALYZE SELECT creationdate, id FROM users WHERE creationdate = "2009-06-28";
--
SELECT MAX(creationdate) AS max_creation_date FROM users;
SELECT MIN(creationdate) AS min_creation_date FROM users;
--
SELECT * FROM users WHERE creationdate >= "2009-06-28" AND creationdate <= "2011-06-28";
SELECT creationdate FROM users WHERE creationdate >= "2009-06-28" AND creationdate <= "2011-06-28";
--
SELECT * FROM users WHERE creationdate >= "1900-06-28" AND creationdate <= "2055-06-28";
SELECT creationdate FROM users WHERE creationdate >= "1900-06-28" AND creationdate <= "2055-06-28";
--
SELECT * FROM users WHERE YEAR(creationdate) = "2009";
SELECT YEAR(creationdate) AS year_creation_date FROM users WHERE YEAR(creationdate) = "2009";
SELECT creationdate FROM users WHERE YEAR(creationdate) = "2009";
--
SELECT * FROM users WHERE creationdate >= "2009-01-01 00:00:00" AND creationdate <= "2009-12-31 23:59:59"; 
SELECT creationdate FROM users WHERE creationdate >= "2009-01-01 00:00:00" AND creationdate <= "2009-12-31 23:59:59"; 
--
SELECT COUNT(*) AS number_of_rows FROM users WHERE creationdate >= "2009-01-01" AND creationdate <= "2009-12-31"; 
--
INSERT INTO stackoverflow.users
(id,
creationdate,
displayname,
downvotes,
lastaccessdate,
location,
reputation,
upvotes,
views)
VALUES
(9999999,
"2013-01-01",
"Sandro Servino",
"333",
"2013-01-01",
"porto",
"2",
"55",
"3");

INSERT INTO stackoverflow.users
(id,
creationdate,
displayname,
downvotes,
lastaccessdate,
location,
reputation,
upvotes,
views)
VALUES
(99999999,
"2013-12-31",
"ricardo gomes",
"333",
"2013-01-01",
"porto",
"2",
"55",
"3");
COMMIT;
--
SELECT * FROM users WHERE id IN (9999999, 99999999);
SELECT id FROM users WHERE id IN (9999999, 99999999);
--
SELECT * FROM users WHERE creationdate >= "2013-01-01 00:00:00" AND creationdate <= "2013-12-31 23:59:59";
SELECT creationdate FROM users WHERE creationdate >= "2013-01-01 00:00:00" AND creationdate <= "2013-12-31 23:59:59";
--
SELECT * FROM users WHERE creationdate >= "2009-01-01 00:00:00" AND creationdate <= "2009-12-31 23:59:59"; 
SELECT creationdate FROM users WHERE creationdate >= "2009-01-01 00:00:00" AND creationdate <= "2009-12-31 23:59:59"; 
--
SELECT * FROM users FORCE INDEX (idx_Userscreationdate1) WHERE creationdate >= "2009-01-01 00:00:00" AND creationdate <= "2009-12-31 23:59:59"; 
SELECT creationdate FROM users FORCE INDEX (idx_Userscreationdate1) WHERE creationdate >= "2009-01-01 00:00:00" AND creationdate <= "2009-12-31 23:59:59"; 
--
SELECT * FROM users FORCE INDEX (idx_Userscreationdate1) WHERE creationdate >= "1900-06-28" AND creationdate <= "2055-06-28";
SELECT creationdate FROM users FORCE INDEX (idx_Userscreationdate1) WHERE creationdate >= "1900-06-28" AND creationdate <= "2055-06-28";
--
SELECT * FROM users FORCE INDEX (idx_Userscreationdate1) WHERE YEAR(creationdate) = "2009"; -- force index not working.
SELECT YEAR(creationdate) AS year_creation_date FROM users FORCE INDEX (idx_Userscreationdate1) WHERE YEAR(creationdate) = "2009"; -- force index not working.
SELECT creationdate FROM users FORCE INDEX (idx_Userscreationdate1) WHERE YEAR(creationdate) = "2009"; -- force index not working.
--
SHOW INDEXES FROM users;
DESCRIBE users;
--
SELECT * FROM users WHERE id = 944442;
SELECT id FROM users WHERE id = 944442;
--
SELECT * FROM users WHERE id = "944442";
SELECT id FROM users WHERE id = "944442";
--
SELECT * FROM users WHERE CONVERT(id, CHAR) = "944442"; -- full table scan
SELECT CONVERT(id, CHAR) AS id FROM users WHERE CONVERT(id, CHAR) = "944442"; -- full index scan
SELECT id FROM users WHERE CONVERT(id, CHAR) = "944442"; -- full index scan
--
SELECT * FROM users WHERE CONVERT(id, CHAR) = 944442; -- full table scan
SELECT CONVERT(id, CHAR) AS id FROM users WHERE CONVERT(id, CHAR) = 944442; -- full index scan
SELECT id FROM users WHERE CONVERT(id, CHAR) = 944442; -- full index scan
--
SELECT * FROM users WHERE id = CONVERT("944442", CHAR);
SELECT CONVERT(id, CHAR) AS id FROM users WHERE id = CONVERT("944442", CHAR);
SELECT id FROM users WHERE id = CONVERT("944442", CHAR);
--
SELECT * FROM users WHERE id = CONVERT(944442, CHAR);
SELECT CONVERT(id, CHAR) AS id FROM users WHERE id = CONVERT(944442, CHAR);
SELECT id FROM users WHERE id = CONVERT(944442, CHAR);
--
SELECT * FROM users WHERE id+1 = 944442; -- full table scan
SELECT id FROM users WHERE id+1 = 944442; -- full index scan
--
SELECT * FROM users WHERE id = 944440 + 1;
SELECT id FROM users WHERE id = 944440 + 1;
--
SHOW INDEXES FROM users;
--
CREATE UNIQUE INDEX idx_displaynameUnico ON users(displayname); -- there are duplicates in column cant create.
SELECT displayname, COUNT(displayname) AS duplicates FROM users GROUP BY displayname HAVING COUNT(displayname) > 1 ORDER BY 2 DESC;
--
CREATE UNIQUE INDEX idx_displaynamelocationUnico ON users(displayname, location); -- there are duplicates in column cant create.
SELECT displayname, location, COUNT(*) AS duplicates FROM users GROUP BY displayname, location HAVING COUNT(*) > 1 ORDER BY 3 DESC;
--
CREATE UNIQUE INDEX idx_idUnico ON users(id); -- there are not duplicates in column so we can create this unique index.
SELECT id, COUNT(id) AS duplicates FROM users GROUP BY id HAVING COUNT(id) > 1 ORDER BY 2 DESC;
--
SELECT * FROM users WHERE creationdate BETWEEN "2013-01-01 00:00:00" AND "2013-12-31 23:59:59" ORDER BY creationdate ASC;
EXPLAIN SELECT * FROM users WHERE creationdate BETWEEN "2013-01-01 00:00:00" AND "2013-12-31 23:59:59" ORDER BY creationdate ASC;
--
SELECT creationdate FROM users WHERE creationdate BETWEEN "2013-01-01 00:00:00" AND "2013-12-31 23:59:59" ORDER BY creationdate ASC;
EXPLAIN SELECT creationdate FROM users WHERE creationdate BETWEEN "2013-01-01 00:00:00" AND "2013-12-31 23:59:59" ORDER BY creationdate ASC;
--
SELECT * FROM users WHERE creationdate BETWEEN "2013-01-01 00:00:00" AND "2013-12-31 23:59:59" ORDER BY creationdate DESC;
EXPLAIN SELECT * FROM users WHERE creationdate BETWEEN "2013-01-01 00:00:00" AND "2013-12-31 23:59:59" ORDER BY creationdate DESC;
--
SELECT creationdate FROM users WHERE creationdate BETWEEN "2013-01-01 00:00:00" AND "2013-12-31 23:59:59" ORDER BY creationdate DESC;
EXPLAIN SELECT creationdate FROM users WHERE creationdate BETWEEN "2013-01-01 00:00:00" AND "2013-12-31 23:59:59" ORDER BY creationdate DESC;
--
CREATE FULLTEXT INDEX idx_fulltextLocation ON users(location);
--
SHOW INDEXES FROM users;
--
SELECT * FROM users WHERE location = "United States"; 
SELECT location FROM users WHERE location = "United States"; 
--
SELECT * FROM users WHERE MATCH (location) AGAINST ("United States");
SELECT location FROM users WHERE MATCH (location) AGAINST ("United States");
--
SELECT * FROM users WHERE location LIKE "%United States%"; -- full table scan.
SELECT location FROM users WHERE location LIKE "%United States%"; -- full index scan.
--
SELECT * FROM users WHERE location LIKE "%New%"; -- full table scan.
SELECT location FROM users WHERE location LIKE "%New%"; -- full index scan.
--
SELECT * FROM users WHERE location LIKE "New%"; -- index range scan.
SELECT location FROM users WHERE location LIKE "New%"; -- index range scan.
--
SELECT * FROM users WHERE MATCH (location) AGAINST ("New");
SELECT location FROM users WHERE MATCH (location) AGAINST ("New");
--
CREATE FULLTEXT INDEX idx_fulltextLocationdisplayname ON users(location, displayname); 
--
SELECT id, displayname, location FROM users WHERE MATCH (displayname, location) AGAINST ('TheJuice'); 
SELECT id, displayname, location FROM users WHERE MATCH (location, displayname) AGAINST ('TheJuice'); 
--
SELECT id, displayname, location FROM users WHERE MATCH (displayname, location) AGAINST ('New York, NY, United States');
SELECT id, displayname, location FROM users WHERE MATCH (location, displayname) AGAINST ('New York, NY, United States');
--
SELECT id, displayname, location FROM users WHERE location LIKE '%New York, NY, United States%'; -- full index scan.
--
SELECT id, displayname, location FROM users WHERE MATCH (displayname, location) AGAINST ('Nova York, NY, estados unidos'); 
--
SELECT id, displayname, location FROM users WHERE location LIKE '%Nova York, NY, estados unidos%'; -- full index scan.
--
SELECT displayname, location, MATCH (displayname, location) AGAINST ('Nova York, NY, estados unidos') FROM users
WHERE MATCH (displayname, location) AGAINST ('Nova York, NY, estados unidos');
SELECT displayname, location, MATCH (location, displayname) AGAINST ('Nova York, NY, estados unidos') FROM users
WHERE MATCH (location, displayname) AGAINST ('Nova York, NY, estados unidos');
--
SELECT displayname, location, MATCH (displayname, location) AGAINST ('Nova York, NY, estados unidos') AS relevance
FROM users
WHERE MATCH (displayname, location) AGAINST ('Nova York, NY, estados unidos') LIMIT 10;
SELECT displayname, location, MATCH (location, displayname) AGAINST ('Nova York, NY, estados unidos') AS relevance
FROM users
WHERE MATCH (location, displayname) AGAINST ('Nova York, NY, estados unidos') LIMIT 10;
--
SELECT displayname, location, MATCH (displayname, location) AGAINST ('Nova York, NY, estados unidos') AS relevance
FROM users
WHERE MATCH (displayname, location) AGAINST ('Nova York, NY, estados unidos') > 13;
SELECT displayname, location, MATCH (location, displayname) AGAINST ('Nova York, NY, estados unidos') AS relevance
FROM users
WHERE MATCH (location, displayname) AGAINST ('Nova York, NY, estados unidos') > 13;
--
SELECT id, displayname, location FROM users WHERE MATCH (displayname, location) AGAINST ('+New -ESTADOS UNIDOS' IN BOOLEAN MODE);
SELECT id, displayname, location FROM users WHERE MATCH (location, displayname) AGAINST ('+New -ESTADOS UNIDOS' IN BOOLEAN MODE);
--
SELECT displayname, location FROM users WHERE MATCH (displayname, location) AGAINST ('New, NY, estados unidos');
SELECT displayname, location FROM users WHERE MATCH (location, displayname) AGAINST ('New, NY, estados unidos');
--
SELECT id, displayname, location FROM users WHERE MATCH (displayname, location) AGAINST ('Flor*' IN BOOLEAN MODE);
SELECT id, displayname, location FROM users WHERE MATCH (location, displayname) AGAINST ('Flor*' IN BOOLEAN MODE);
--
SELECT id, displayname, location FROM users WHERE MATCH (displayname, location) AGAINST ('"London, United Kingdom"' IN BOOLEAN MODE);
SELECT id, displayname, location FROM users WHERE MATCH (location, displayname) AGAINST ('"London, United Kingdom"' IN BOOLEAN MODE);
--

--
SELECT * FROM users WHERE id <> 1;
--
DROP INDEX idx_fulltextLocationdisplayname ON users;
--
DROP INDEX idx_fulltextLocation ON users;
--
DROP INDEX idx_idUnico ON users;
--
DROP INDEX idx_displaynamelocationUnico ON users; 
--
DROP INDEX idx_displaynameUnico ON users;
--
DELETE FROM users WHERE id IN (9999999, 99999999);
COMMIT;
--
DROP INDEX idx_Userscreationdate1 ON users; 
--
ALTER TABLE users MODIFY COLUMN CreationDate TEXT;
--
DROP INDEX idx_UsersLastAcessReputation1 ON users;
--
DROP INDEX idx_UsersLastAcessDate1 ON users;
--
ALTER TABLE users MODIFY COLUMN lastaccessdate TEXT;
--
DROP INDEX idx_UsersDisplayname3 ON users;
--
DROP INDEX idx_UsersDisplayname2 ON users;
--
DROP INDEX idx_UsersDisplayname1 ON users;
--
ALTER TABLE users MODIFY COLUMN location TEXT;
--
ALTER TABLE users MODIFY COLUMN displayname TEXT;
--
ALTER TABLE users DROP PRIMARY KEY;
--
DELETE FROM users;
COMMIT;
--
TRUNCATE TABLE users;
--
DROP TABLE IF EXISTS users;
--
DROP DATABASE IF EXISTS stackoverflow;