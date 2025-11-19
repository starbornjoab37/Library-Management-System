# Library-Management-System

## Description
This project is a relational database for managing a library. It includes authors, books, members, and loans.

## Tables and Relationships
- **Authors** → Books (One-to-Many)
- **Books** → Loans → Members (Many-to-Many)
- **Members** → Loans (One-to-Many)

## How to Use
1. Open MySQL Workbench or use MySQL CLI.
2. Run `library_db.sql` to create the database, tables, constraints, and sample data.
3. Query the database as needed, e.g.:
   ```sql
   SELECT * FROM Books;
   SELECT Members.first_name, Books.title
   FROM Loans
   JOIN Members ON Loans.member_id = Members.member_id
   JOIN Books ON Loans.book_id = Books.book_id;
