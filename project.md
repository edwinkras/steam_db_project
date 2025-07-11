# Databases

## Database Design and Implementation Project

This project, to be completed in teams of maximum 2 students, aims to put into practice the concepts of modeling and
implementing a relational database with PostgreSQL.

## Project Description

You must design and implement a database comprising a minimum of 7 entities (tables), not counting relationship tables. 
You can:

- Draw inspiration from an existing application or website (e.g.: Steam, Netflix, Airbnb), or
- Model the database needed for a personal project, or
- Choose one of the subjects proposed below.

## Deliverables and Steps

1. **General Description** (1-2 pages)
    - Context and objectives of the database
    - Description of the main functionalities to support
    - Identification of the main entities and their relationships

2. **Logical Model**
    - Entity-relationship diagram (ERD) in PlantUML format
    - Inclusion of all entities with their attributes
    - Clear representation of relationships and cardinalities
    - Do not include foreign keys at this stage

3. **Physical Model**
    - Conversion of the logical model
    - Addition of primary and foreign keys
    - Diagram in PlantUML format

4. **Creation Scripts**
    - `CREATE TABLE` statements for all tables
    - Integrity constraints (`PRIMARY KEY`, `FOREIGN KEY`, etc.)
    - Other necessary objects (schema, types, etc.)

5. **Test Data**
    - `INSERT INTO` scripts to populate the database
    - Minimum 5 rows per table
    - Real data, or fictitious but coherent and meaningful data

6. **Demonstration Queries**
    - Minimum 10 varied `SELECT` queries demonstrating:
        - Joins (INNER, LEFT, RIGHT)
        - Aggregation (`GROUP BY`, `HAVING`)
        - Subqueries
        - Sorting and filtering (`ORDER BY`, `WHERE`)
        - At least 3 complex queries combining multiple concepts

7. **Documentation**
    - `README.md` file containing:
        - Project description
        - Logical and physical models (diagram images)
        - Detailed description of entities and relationships
        - Installation and usage guide
        - Commented query examples

## Evaluation Criteria

- Relevance and complexity of the data model
- Quality of modeling (normalization, relationships)
- Adherence to SQL best practices
- Quality and variety of demonstration queries
- Clear and complete documentation
- Appropriate use of Git (regular commits, descriptive messages)

## Submission

1. Zip file containing the following files, to be submitted on Omnivox.
2. `README.md`: as described above including the diagrams in PlantUML format.
3. `dbname_create.sql`: database creation.
4. `dbname_insert.sql`: data insertion.
5. `dbname_select.sql`: query examples (format similar to the assignments, with the query question as a comment,
   followed by the query).
6. `LICENSE.md`: the project license.

**Deadline: July 11, 2025 (before midnight).**

## Project Ideas

### School Library Management System

- Management of books, periodicals and digital resources
- Tracking loans and reservations
- Member management (students, teachers)
- Loan history and fines
- Usage statistics

### Carpooling Application

- User management (drivers/passengers)
- Proposed trips and reservations
- Payment system and cost sharing
- Reviews and comments
- Trip history

### Sports Club Management System

- Member and subscription management
- Class and activity scheduling
- Equipment reservation
- Payment tracking
- Instructor management

### Cultural Event Management Platform

- Event programming
- Room and space management
- Ticketing and reservations
- Artists and speakers
- Attendance statistics

### Roommate Management Application

- Roommate management
- Expense sharing
- Household chore scheduling
- Common goods inventory
- Messages and notifications
