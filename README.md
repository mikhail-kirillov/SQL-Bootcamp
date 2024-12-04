# SQL-Bootcamp

School 21 | SQL Bootcamp for PostgreSQL Training

## Personal Projects

1. **Day 00**: Relative model and extracting the required data using basic SQL constructs
2. **Day 01**: Extracting the required data using set operations and simple JOINs
3. **Day 02**: Extracting the required data using various types of JOINs
4. **Day 03**: Modifying data using DML (Data Manipulation Language)
5. **Day 04**: Using virtual views and physical snapshots of data
6. **Day 06**: How and when to create indexes in a database
7. **Day 07**: Adding a new business feature to our data model
8. **Day 08**: Using specific OLAP constructs to extract "values" from data
9. **Day 09**: How a database works with transactions and isolation levels
10. **Day 10**: How to create and use functional blocks in databases

## Team Projects

1. **Day 05**: Quick SQL solution for solving the Traveling Salesman Problem
2. **Day 11**: What is DWH and how to create the first ETL process

These projects are designed to challenge and improve your understanding of PostgreSQL, from basic SQL queries to more complex tasks involving data manipulation, optimization, and problem-solving. Each project requires implementing a series of SQL operations, as well as a logical and efficient approach to solving real-world data challenges.

## Model one

This model represents a database for a pizza order management system. The database consists of five tables: "person", "pizzeria", "person_visits", "menu", and "person_order".

The "person" table contains information about customers, including their ID, name, age, and address.

The "pizzeria" table contains information about pizzerias, including their ID, name, and rating.

The "person_visits" table contains information about customers' visits to pizzerias, including the customer ID, pizzeria ID, and visit date.

The "menu" table contains information about pizzeria menus, including the pizzeria ID, pizza name, and price.

The "person_order" table contains information about customers' orders, including the customer ID, pizza ID, and order date.

The model allows for storing information about customers, pizzerias, visits, and orders, and provides relationships between these tables through foreign keys.

## Model two

This is a database schema for a user-based financial system. It includes three tables: "user", "currency", and "balance".

The "user" table stores information about users, including their unique ID, name, and last name.

The "currency" table stores information about different currencies, including their ID, name, conversion rate to USD, and the timestamp of the last update.

The "balance" table stores information about user balances, including the user ID, the amount of money in the balance, the type of balance (0 for debit and 1 for credit), the currency ID, and the timestamp of the last update.
