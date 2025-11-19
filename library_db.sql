-- 1. Create Database
CREATE DATABASE library_db;
USE library_db;

-- 2. Authors Table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    UNIQUE(first_name, last_name)
);

-- 3. Books Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT NOT NULL,
    published_year YEAR,
    genre VARCHAR(50),
    UNIQUE(title, author_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 4. Members Table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20)
);

-- 5. Loans Table (Many-to-Many relationship)
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    UNIQUE(member_id, book_id, loan_date)
);
-- 6. Insert Authors
INSERT INTO Authors (first_name, last_name) VALUES
('J.K.', 'Rowling'),
('George', 'Orwell'),
('Jane', 'Austen');

-- 7. Insert Books
INSERT INTO Books (title, author_id, published_year, genre) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 1997, 'Fantasy'),
('1984', 2, 1949, 'Dystopian'),
('Pride and Prejudice', 3, 1813, 'Romance');

-- 8. Insert Members
INSERT INTO Members (first_name, last_name, email, phone) VALUES
('Alice', 'Wang', 'alice.wang@example.com', '0712345678'),
('John', 'Doe', 'john.doe@example.com', '0723456789'),
('Mary', 'Kimani', 'mary.kimani@example.com', '0734567890');

-- 9. Insert Loans
INSERT INTO Loans (member_id, book_id, loan_date, return_date) VALUES
(1, 1, '2025-11-01', '2025-11-10'),
(2, 2, '2025-11-05', NULL),
(3, 3, '2025-11-07', '2025-11-14');
