# Wildlife Conservation Monitoring Assignment

## PostgreSQL
PostgreSQL is a powerful, open-source object-relational database system that supports SQL (relational) and JSON (non-relational) querying.

- PostgreSQL is free to use and distribute
- It combines aspects of both relational and object-oriented database models. 
- It supports the Structured Query Language (SQL) standard for querying and managing data. 
- It can handle a wide range of workloads, from small projects to enterprise-level applications.  
- It has a strong reputation for its performance, data integrity, and ACID compliance.  
- It allows for user-defined functions, types, and extensions, making it versatile for various use cases.  
- PostgreSQL is used as the primary data store or data warehouse for many web, mobile, geospatial, and analytics applications.

--- 

## Database Schema In PostgreSQL
The purpose of a database schema in PostgreSQL is to organize and manage database objects in a structured and logical way.

In PostgreSQL, a schema is a logical container for database objects like tables, views, functions, and more, allowing for better organization and management. It also provides a way to isolate users and applications, preventing naming conflicts and improving security. 

In PostgreSQL, a schema is essentially a namespace that contains various database objects. Each schema provides a way to group related objects together, making the database more organized and easier to manage.

- Organization and Separation
- Avoid Name Conflicts
- Access Control and Security 
- Modularity 
- Support for Multi-Tenancy 

---

## Primary Key (PK)
- A Primary Key is a special column in a table that uniquely identifies each row.
- It cannot be empty (NULL). 
- Each value in the primary key must be unique.
- A table can only have one primary key. 

<pre> ``` CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name TEXT,
  age INT
);
 ``` </pre>

## Foreign Key 
A Foreign Key is a column (or combination of columns) that refers to the Primary Key in another table. It creates a relationship between two tables.

- Ensures referential integrity — you cannot insert a value into the foreign key column that doesn't exist in the referenced primary key column.
- Helps maintain consistent data between related tables.


<pre> ``` CREATE TABLE enrollments (
  enrollment_id SERIAL PRIMARY KEY,
  student_id INT REFERENCES students(student_id),
  course_name TEXT
);

 ``` </pre>

--- 

##  Modify Data Using UPDATE Statements 

### Basic Syntax 

UPDATE table_name
SET column1 = value1,
    column2 = value2,
    ...
WHERE condition;

- Example 
<pre>
  ```
CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name TEXT,
  salary INT
);

UPDATE employees
SET salary = 60000
WHERE name = 'Alice';

  ```
</pre>


--- 

##  the difference between the VARCHAR and CHAR data types

## CHAR

- Fixed-length 
- when all values are the same length, like country codes: 'USA', 'IND', etc.

<pre>
```
CREATE TABLE countries (
  code CHAR(3),
  name TEXT
);

INSERT INTO countries VALUES ('US', 'United States');

```
</pre>

## VARCHAR 
- can store a string with a maximum of n characters.
- can store any string up to n characters, but not more. 
- If you try to insert a string longer than n, PostgreSQL will return an error. 

<pre>
```
If you try to insert a string longer than n, PostgreSQL will return an error.
```
</pre>