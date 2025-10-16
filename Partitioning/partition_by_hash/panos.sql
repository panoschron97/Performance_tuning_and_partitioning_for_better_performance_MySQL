CREATE DATABASE IF NOT EXISTS dbparticion1;
--
USE dbparticion1;
--
CREATE TABLE IF NOT EXISTS employees_partHASH_storedid
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
CREATE TABLE IF NOT EXISTS employees_partHASH_storedid1
(id INT NOT NULL AUTO_INCREMENT,
fname VARCHAR(30),
lname VARCHAR(30), 
hired DATE NOT NULL DEFAULT '1970-01-01',
separated DATE NOT NULL DEFAULT '9999-12-31',
job_code INTEGER,
store_id INTEGER,
PRIMARY KEY(id, store_id)
)
PARTITION BY HASH(store_id) PARTITIONS 7;
--
DESCRIBE employees_partHASH_storedid;
DESCRIBE employees_partHASH_storedid1;
--
SET GLOBAL local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SHOW VARIABLES LIKE 'secure_file_priv';
--
LOAD DATA INFILE 'C:\\Users\\panos\\Desktop\\MySQL_Performance_Tuning_Partitioning\\Partitioning\\partition_by_hash\\partitioning_by_hash\\employees_partHASH_storedid1.csv'
INTO TABLE employees_partHASH_storedid
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(fname, lname, hired, separated, job_code, store_id);
-- IGNORE 1 LINES;
INSERT INTO employees_partHASH_storedid1 SELECT * FROM employees_partHASH_storedid;
COMMIT;
--
SELECT COUNT(*) AS number_of_rows FROM employees_partHASH_storedid1;
--
SELECT * FROM employees_partHASH_storedid1 WHERE id = (SELECT MAX(id) AS id FROM employees_partHASH_storedid1 LIMIT 1) LIMIT 1;
--
SELECT DISTINCT store_id FROM employees_partHASH_storedid1;
--
SELECT store_id, COUNT(*) AS number_of_rows FROM employees_partHASH_storedid1 GROUP BY store_id HAVING COUNT(*) >= 0 ORDER BY 2 ASC;
--
SELECT (store_id MOD 7) AS partition_number, COUNT(*) AS row_count FROM employees_partHASH_storedid1 GROUP BY partition_number ORDER BY 1 ASC;
--
ALTER TABLE employees_partHASH_storedid1 ADD PARTITION (PARTITION p7);
--
SELECT (store_id MOD 8) AS partition_number, COUNT(*) AS row_count FROM employees_partHASH_storedid1 GROUP BY partition_number ORDER BY 1 ASC;
--
CREATE INDEX idx_hired ON employees_partHASH_storedid1(hired);
--
SELECT table_schema, table_name, partition_name, partition_method, partition_expression FROM information_schema.partitions WHERE
table_schema = 'dbparticion1' AND table_name = 'employees_partHASH_storedid1' ORDER BY partition_ordinal_position;
--
SELECT * FROM employees_partHASH_storedid1 LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p0) LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p1) LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p2) LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p3) LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p4) LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p5) LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p6) LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p7) LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p8) LIMIT 1000001;
--
SELECT id, hired, store_id FROM employees_partHASH_storedid1 LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p0) LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p1) LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p2) LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p3) LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p4) LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p5) LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p6) LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p7) LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p8) LIMIT 1000001;
--
SELECT * FROM employees_partHASH_storedid1 WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p0) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p1) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p2) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p3) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p4) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p5) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p6) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p7) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT * FROM employees_partHASH_storedid1 PARTITION(p8) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
--
SELECT id, hired, store_id FROM employees_partHASH_storedid1 WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p0) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p1) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p2) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p3) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p4) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p5) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p6) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p7) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
SELECT id, hired, store_id FROM employees_partHASH_storedid1 PARTITION(p8) WHERE hired BETWEEN "2001-01-01" AND "2001-12-31" LIMIT 1000001;
--
ALTER TABLE employees_partHASH_storedid1 TRUNCATE PARTITION p7;
--
-- ALTER TABLE employees_partHASH_storedid1 DROP PARTITION p7; -- CANT DROP PARTITION ON HASH.
--
SELECT table_schema, table_name, partition_name, partition_method, partition_expression FROM information_schema.partitions WHERE
table_schema = 'dbparticion1' AND table_name = 'employees_partHASH_storedid1' ORDER BY partition_ordinal_position;
--
ALTER TABLE employees_partHASH_storedid1 ADD PARTITION (PARTITION p8);
--
SELECT table_schema, table_name, partition_name, partition_method, partition_expression FROM information_schema.partitions WHERE
table_schema = 'dbparticion1' AND table_name = 'employees_partHASH_storedid1' ORDER BY partition_ordinal_position;
--
ALTER TABLE employees_partHASH_storedid1 COALESCE PARTITION 5;
--
SELECT table_schema, table_name, partition_name, partition_method, partition_expression FROM information_schema.partitions WHERE
table_schema = 'dbparticion1' AND table_name = 'employees_partHASH_storedid1' ORDER BY partition_ordinal_position;
--
ALTER TABLE employees_partHASH_storedid1 ADD PARTITION PARTITIONS 5;
--
SELECT table_schema, table_name, partition_name, partition_method, partition_expression FROM information_schema.partitions WHERE
table_schema = 'dbparticion1' AND table_name = 'employees_partHASH_storedid1' ORDER BY partition_ordinal_position;
--
DROP INDEX idx_hired ON employees_partHASH_storedid1;
--
DELETE FROM employees_partHASH_storedid1;
COMMIT;
--
TRUNCATE TABLE employees_partHASH_storedid1;
--
DROP TABLE IF EXISTS employees_partHASH_storedid1;
--
DELETE FROM employees_partHASH_storedid;
COMMIT;
--
TRUNCATE TABLE employees_partHASH_storedid;
--
DROP TABLE IF EXISTS employees_partHASH_storedid;
--
DROP DATABASE IF EXISTS dbparticion1;