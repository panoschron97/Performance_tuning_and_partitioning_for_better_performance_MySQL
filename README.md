# Performance tuning and partitioning for better performance in MySQL

This repository provides scripts and resources for optimizing MySQL database performance through performance tuning techniques and partitioning strategies. It aims to demonstrate how to improve query speeds and manage large datasets effectively.

## ✨ Features

-   **Performance Tuning**: SQL scripts demonstrating various performance tuning techniques applicable to MySQL databases.
-   **Partitioning**: Examples of different partitioning methods (HASH, KEY, LIST, RANGE, SUBPARTITION) to manage and query large datasets more efficiently.
-   **Data Loading**: Sample CSV files and SQL scripts for loading data into partitioned tables.
-   **Comprehensive Examples**: Detailed SQL scripts showcasing the implementation and benefits of performance tuning and partitioning.

## 📚 Table of Contents

-   [✨ Features](#-features)
-   [📚 Table of Contents](#-table-of-contents)
-   [🛠️ Installation](#️-installation)
-   [🚀 Usage](#-usage)
-   [🧰 Dependencies](#-dependencies)

## 🛠️ Installation

1.  Clone the repository:

    ```bash
    git clone https://github.com/panoschron97/Performance_tuning_and_partitioning_for_better_performance_MySQL.git
    cd Performance_tuning_and_partitioning_for_better_performance_MySQL
    ```

2.  Install MySQL:

    Ensure you have MySQL installed and running. You can download it from the official [MySQL website](https://www.mysql.com/downloads/).

3.  Create Databases:

    Create the necessary databases (`dbparticion1`, `stackoverflow`) using the MySQL command-line tool or a GUI like MySQL Workbench.

    ```sql
    CREATE DATABASE IF NOT EXISTS dbparticion1;
    CREATE DATABASE IF NOT EXISTS stackoverflow;
    ```

4.  Import Sample Data:

    Import the `BK_stackoverflow_users.sql` script into the `stackoverflow` database and the `employees_sample_data.csv` and `employees_data.csv` files into corresponding tables within the `dbparticion1` database after creating those tables using the appropriate SQL scripts. Ensure `local_infile` is enabled for your MySQL instance to allow importing data from local files.

## 🚀 Usage

1.  Navigate to the directory containing the SQL scripts:

    ```bash
    cd Performance_tuning_and_partitioning_for_better_performance_MySQL
    ```

2.  Execute SQL scripts using the MySQL command-line tool:

    ```bash
    mysql -u your_mysql_username -p < Partitioning/partition_by_hash/panos.sql
    mysql -u your_mysql_username -p < Performance_Tuning/panos.sql
    ```

    Replace `your_mysql_username` with your MySQL username.

3.  Refer to the comments within the SQL scripts for step-by-step instructions and explanations of each performance tuning or partitioning technique.

## 🧰 Dependencies

-   [MySQL](https://www.mysql.com/) - Relational database management system.

1 - Performance tuning -> Link for downloading the script that contains database - table - data -> https://www.mediafire.com/file/64auker5c756fy8/BK_stackoverflow_users.sql/file

2 - Partitioning -> Link for downloading the data to import into the tables -> https://www.mediafire.com/file/ik4lnev9m5qcvkn/Partitioning_data_files.zip/file

DISCLAIMER - Dont use these scripts in other databases cause they won't work. Every database is unique. These scripts are only for MySQL.
