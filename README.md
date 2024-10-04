# RideIt

RideIt is a database-driven application designed to manage ride-sharing services efficiently. The project focuses on designing a robust relational database schema and performing a series of SQL operations, including relational algebraic operations, OLAP queries, embedded SQL, and transaction management.

## Project Overview

This project is developed to achieve the following:

1. **Design of the Conceptual and Relational Model**:
   - Created an **ER Diagram** representing the entities and their relationships in the ride-sharing application.
   - Converted the ER diagram into a **Relational Schema**, defining the tables, columns, and relationships (Primary Key, Foreign Key).

2. **Database Schema and Integrity Constraints**:
   - Defined SQL tables using appropriate data types and constraints.
   - Implemented **integrity constraints** such as **Primary Keys, Foreign Keys**, and other necessary constraints (e.g., unique constraints, NOT NULL, etc.).
   - Populated the database with **simulated data**, ensuring the data satisfies the specified constraints. Data insertion is performed via an SQL script or a bulk data generator.

3. **SQL Queries**:
   - Wrote and executed multiple queries to support the core features of the application.
   - Performed **relational algebraic operations** such as joins, projections, selections, and aggregations.

4. **Embedded SQL and OLAP Queries**:
   - Wrote and executed at least two embedded SQL queries in a favorite programming language (e.g., Python, Java).
   - Developed and executed **four OLAP (Online Analytical Processing) queries** for advanced data analysis.
   - Defined **two database triggers** to monitor and enforce business rules (e.g., data validation, automatic actions on data changes).

5. **Database Transactions**:
   - Implemented and executed various **database transactions**, including conflicting ones, to test the consistency and integrity of the database.
   - Analyzed the results of these transactions on the database state to ensure compliance with **ACID properties**.

## Features

- **Ride Management**: Add, update, and remove ride information.
- **User Management**: Manage user profiles, ride history, and reviews.
- **Booking Management**: Book and cancel rides, including conflict management with active bookings.
- **Data Analytics**: Analyze ride usage, user engagement, and driver performance using OLAP queries.

## Technologies Used

- **SQL**: For creating database schema and queries.
- **Python**: For executing embedded SQL queries.
- **Relational Algebra**: To perform advanced operations on the data.
- **Triggers**: To enforce business logic and automate database actions.
- **Transaction Management**: Ensures database integrity.

## How to Run

1. Clone this repository:

    ```bash
    git clone https://github.com/shrey17sept/RideIt.git
    ```

2. Set up the database using the provided SQL schema.
3. Populate the database with the data using the data population script or generator.
4. Execute SQL queries, OLAP queries, and triggers as defined in the scripts.
5. Run the embedded SQL using Python (refer to the script in the `FrontEnd` directory).
6. Test transaction management by executing the provided conflicting queries.

## ER Diagram and Relational Schema

The ER diagram and relational schema are included in the `ER_Model/` folder. These visualize the entities, attributes, and relationships within the RideIt application.
