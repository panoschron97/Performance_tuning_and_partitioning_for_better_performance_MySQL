CREATE DATABASE IF NOT EXISTS dbparticion1;
--
USE dbparticion1;
--
CREATE TABLE IF NOT EXISTS employees_partlist_storedid
(id INT NOT NULL AUTO_INCREMENT,
fname VARCHAR(30),
lname VARCHAR(30), 
hired DATE NOT NULL DEFAULT '1970-01-01',
separated DATE NOT NULL DEFAULT '9999-12-31',
job_code INTEGER,
store_id INTEGER,
PRIMARY KEY(id, store_id)
);
--
CREATE TABLE IF NOT EXISTS employees_partlist_storedid1
(id INT NOT NULL AUTO_INCREMENT,
fname VARCHAR(30),
lname VARCHAR(30), 
hired DATE NOT NULL DEFAULT '1970-01-01',
separated DATE NOT NULL DEFAULT '9999-12-31',
job_code INTEGER,
store_id INTEGER,
PRIMARY KEY(id, store_id)
)
PARTITION BY LIST(store_id)
(PARTITION pnorth VALUES IN (3,5,6,9,17),
PARTITION peast VALUES IN (1,2,10,11,19,20),
PARTITION pwest VALUES IN (4,12,13,14,18),
PARTITION pcentral VALUES IN (7,8,15,16)
);
--
DESCRIBE employees_partlist_storedid;
DESCRIBE employees_partlist_storedid1;
--
SET GLOBAL local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SHOW VARIABLES LIKE 'secure_file_priv';
--
LOAD DATA INFILE 'C:\\Users\\panos\\Desktop\\MySQL_Performance_Tuning_Partitioning\\Partitioning\\partition_by_list\\partitioning_by_list\\employees_sample_data.csv'
INTO TABLE employees_partlist_storedid
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(fname, lname, hired, separated, job_code, store_id);
-- IGNORE 1 LINES;
INSERT INTO employees_partlist_storedid1 SELECT * FROM employees_partlist_storedid;
COMMIT;
--
SELECT COUNT(*) AS number_of_rows FROM employees_partlist_storedid1;
--
SELECT * FROM employees_partlist_storedid1 WHERE id = (SELECT MAX(id) AS id FROM employees_partlist_storedid1 LIMIT 1) LIMIT 1;
--
SELECT COUNT(*) AS number_of_rows FROM employees_partlist_storedid1 WHERE store_id NOT BETWEEN 1 AND 20;
--
CREATE INDEX idx_hired ON employees_partlist_storedid1(hired);
--
SELECT * FROM employees_partlist_storedid1 LIMIT 1000001;
SELECT * FROM employees_partlist_storedid1 PARTITION(pnorth) LIMIT 1000001;
SELECT * FROM employees_partlist_storedid1 PARTITION(peast) LIMIT 1000001;
SELECT * FROM employees_partlist_storedid1 PARTITION(pwest) LIMIT 1000001;
SELECT * FROM employees_partlist_storedid1 PARTITION(pcentral) LIMIT 1000001;
--
SELECT id, hired, store_id FROM employees_partlist_storedid1 LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partlist_storedid1 PARTITION(pnorth) LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partlist_storedid1 PARTITION(peast) LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partlist_storedid1 PARTITION(pwest) LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partlist_storedid1 PARTITION(pcentral) LIMIT 1000001;
--
SELECT * FROM employees_partlist_storedid1 WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT * FROM employees_partlist_storedid1 PARTITION(pnorth) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT * FROM employees_partlist_storedid1 PARTITION(peast) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT * FROM employees_partlist_storedid1 PARTITION(pwest) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT * FROM employees_partlist_storedid1 PARTITION(pcentral) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
--
SELECT id, hired, store_id FROM employees_partlist_storedid1 WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partlist_storedid1 PARTITION(pnorth) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partlist_storedid1 PARTITION(peast) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partlist_storedid1 PARTITION(pwest) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partlist_storedid1 PARTITION(pcentral) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
--
ALTER TABLE employees_partlist_storedid1 REORGANIZE PARTITION pnorth, peast INTO
(PARTITION peast VALUES IN (3, 5, 6, 9, 17, 1, 2, 10, 11, 19, 20));
--
SHOW CREATE TABLE employees_partlist_storedid1;
--
ALTER TABLE employees_partlist_storedid1 REORGANIZE PARTITION peast INTO
(PARTITION pnorth VALUES IN (3, 5, 6, 9, 17),
PARTITION peast VALUES IN (1, 2, 10, 11, 19, 20));
--
SHOW CREATE TABLE employees_partlist_storedid1;
--
ALTER TABLE employees_partlist_storedid1 DROP PARTITION peast;
ALTER TABLE employees_partlist_storedid1 DROP PARTITION pnorth;
--
SHOW CREATE TABLE employees_partlist_storedid1;
--
ALTER TABLE employees_partlist_storedid1 DROP PARTITION pcentral;
--
SHOW CREATE TABLE employees_partlist_storedid1;
--
ALTER TABLE employees_partlist_storedid1 ADD PARTITION (PARTITION pcentral VALUES IN (7,8,15,16));
--
SHOW CREATE TABLE employees_partlist_storedid1;
--
ALTER TABLE employees_partlist_storedid1 TRUNCATE PARTITION pwest;
--
ALTER TABLE employees_partlist_storedid1 DROP PARTITION pwest;
--
SHOW CREATE TABLE employees_partlist_storedid1;
--
DROP INDEX idx_hired ON employees_partlist_storedid1;
--
DELETE FROM employees_partlist_storedid1;
COMMIT;
--
TRUNCATE TABLE employees_partlist_storedid1;
--
DROP TABLE IF EXISTS employees_partlist_storedid1;
--
DELETE FROM employees_partlist_storedid;
COMMIT;
--
TRUNCATE TABLE employees_partlist_storedid;
--
DROP TABLE IF EXISTS employees_partlist_storedid;
--
DROP DATABASE IF EXISTS dbparticion1;