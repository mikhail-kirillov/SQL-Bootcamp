# Team 00 — SQL Bootcamp

## _Traveling Salesman Problem_

Resume: Today you will be implementing a quick solution on SQL to achieve results of Traveling Salesman Problem.

## Exercise 00 — Classical TSP

|Exercise 00||
|-|-|
|Turn-in directory|ex00|
|Files to turn-in |`team00_ex00.sql`|
|**Allowed**|DDL for table creation with `INSERT`'s of data; SQL DML statement|
|Language|ANSI SQL|
|SQL Syntax Pattern|Recursive Query|

Please create a table with named nodes using structure {point1, point2, cost} and fill data based on a picture (remember there are direct and reverse paths between 2 nodes).
Please write a SQL statement that returns all tours (aka paths) with minimum travel cost if we start from city "a".
Remember, you need to find the cheapest way to visit all cities and return to your starting point. For example, the tour looks like a → b → c ⇾ d ⇾ a.

Below is an example of the output data. Please sort the data by total_cost and then by tour.

|total_cost|tour|
|-|-|
|80|{a, b, d, c, a}|
|...|...|

## Exercise 01 — Opposite TSP

|Exercise 01||
|-|-|
|Turn-in directory|ex01|
|Files to turn-in |`team00_ex01.sql`|
|**Allowed**|SQL DML statement|
|Language|ANSI SQL|
|SQL Syntax Pattern|Recursive Query|

Please add a way to see additional rows with the most expensive cost to the SQL from the previous exercise. Take a look at the sample data below. Please sort the data by total_cost and then by trip.

|total_cost|tour|
|-|-|
|80|{a, b, d, c, a}|
|...|...|
|95|{a, d, c, b, a}|
