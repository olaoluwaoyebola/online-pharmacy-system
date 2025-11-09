===============================================
ONLINE PHARMACY MANAGEMENT SYSTEM - DB SUMMARY
===============================================

PROJECT DESCRIPTION:
[cite_start]The system is an online platform allowing customers to browse, order, and buy medication (prescription and over-the-counter)[cite: 2]. [cite_start]Pharmacists receive orders, approve prescriptions, and manage inventory[cite: 3]. [cite_start]Doctors input prescriptions directly, and the platform manages customer profiles, orders, inventory, and deliveries[cite: 3, 4].

-----------------------------------------------
1. CONCEPTUAL STAGE (Entity Identification)
-----------------------------------------------
The goal was to identify the core entities involved in the business process.

Key Entities Identified:
* [cite_start]Customer (includes DocId link) [cite: 6]
* [cite_start]Doctor [cite: 7]
* [cite_start]Prescription [cite: 8]
* [cite_start]Product [cite: 9]
* [cite_start]Order [cite: 10]
* [cite_start]Invoice [cite: 11]
* [cite_start]OrderDetails (implied from the Logical Model) [cite: 46]

-----------------------------------------------
2. LOGICAL STAGE (Relational Schema Design)
-----------------------------------------------
The goal was to define the tables, primary keys (PK), and foreign keys (FK) to show relationships between entities.

Work Done:
* [cite_start]Defined 7 tables (Customer, Doctor, Prescription, Product, Order, OrderDetails, Invoice)[cite: 14, 23, 27, 33, 40, 46, 53].
* [cite_start]Established Primary Keys for each table (e.g., CustomerId [cite: 15][cite_start], DocId [cite: 24][cite_start], OrderId [cite: 41][cite_start], etc.)[cite: 15, 24, 28, 34, 41, 47, 54].
* [cite_start]Established Foreign Keys to link tables (e.g., Customer links to Doctor via DocId [cite: 21][cite_start], OrderDetails links to Order and Product)[cite: 21, 29, 44, 55].

-----------------------------------------------
3. PHYSICAL STAGE (SQL Implementation)
-----------------------------------------------
The goal was to write the Data Definition Language (DDL) to create the database and tables, including data types and constraints.

Work Done:
* [cite_start]Database `ONLINE_PHARMACY` was created[cite: 60, 61].
* [cite_start]Defined constraints like NOT NULL (e.g., CustomerName, Email, DocName)[cite: 65, 66, 76].
* [cite_start]Defined UNIQUE constraint on the Email column in the Customers table[cite: 66].
* [cite_start]Applied Foreign Key constraints using `CONSTRAINT FOREIGN KEY` clauses (e.g., FK_CUSTOMERS_DOCTORS)[cite: 71, 85, 101, 110, 111, 119].
* [cite_start]Specified data types (e.g., INT for IDs, VARCHAR for names, DECIMAL for prices, DATE for OrderDate)[cite: 64, 65, 93, 98].

-----------------------------------------------
4. DATA MANIPULATION (DML) & ANALYSIS
-----------------------------------------------
The goal was to populate the tables with sample data and analyze the system's performance and inventory.

Work Done:
* [cite_start]Inserted sample data into all 7 tables (Doctors, Customers, Prescription, Product, Orders, OrderDetails, Invoice)[cite: 122, 128, 134, 140, 146, 152, 158].
* Executed queries to gain business insights, including:
    * [cite_start]Identifying products with low stock (less than 100 in stock)[cite: 175, 178, 179].
    * [cite_start]Finding the most expensive product[cite: 185, 189, 190].
    * [cite_start]Listing the top 3 most ordered products[cite: 191, 197].
    * [cite_start]Calculating total invoice amount per payment method[cite: 198, 204].

===============================================
END OF DOCUMENT
===============================================