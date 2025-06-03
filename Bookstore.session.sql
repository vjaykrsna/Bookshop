--@block
DROP DATABASE xxx;

--@block
CREATE DATABASE bookshop;

--@block
USE bookshop;

--@block
CREATE TABLE Books (
    id INT PRIMARY KEY AUTO_INCREMENT,  -- Primary key with auto-increment
    name VARCHAR(255) NOT NULL,
    auth VARCHAR(255),
    price INT,
    qty INT
);

--@block
CREATE TABLE Purchases (
    ord_id INT PRIMARY KEY AUTO_INCREMENT,  -- Primary key with auto-increment
    book_id INT,                            -- Foreign key referencing Books(id)
    qty INT,
    dt_ordered DATE,
    eta INT,
    received CHAR(1) DEFAULT 'F',           -- Check constraint (T or C or F), default 'F'
    inv INT,
    CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES Books(id),
    CHECK (received IN ('T', 'C', 'F'))
);

--@block
CREATE TABLE Employees (
    id INT PRIMARY KEY AUTO_INCREMENT,  -- Primary key with auto-increment
    name VARCHAR(255) NOT NULL,
    addr_line1 VARCHAR(255),
    addr_line2 VARCHAR(255),
    addr_city VARCHAR(100),
    addr_state VARCHAR(100),
    phn BIGINT,
    date_of_joining DATE,
    salary BIGINT,
    mgr_status CHAR(1) DEFAULT 'F',      -- Check constraint (T or F), default 'F'
    CHECK (mgr_status IN ('T', 'F'))
);

--@block
CREATE TABLE Members (
    id INT PRIMARY KEY AUTO_INCREMENT,  -- Primary key with auto-increment
    name VARCHAR(255) NOT NULL,
    addr_line1 VARCHAR(255),
    addr_line2 VARCHAR(255),
    addr_city VARCHAR(100),
    addr_state VARCHAR(100),
    phn BIGINT,
    beg_date DATE,
    end_date DATE,
    valid VARCHAR(10)
);

--@block
CREATE TABLE Sales (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,  -- Primary key with auto-increment
    member_id INT,                              -- Foreign key referencing Members(id)
    book_id INT,                                -- Foreign key referencing Books(id)
    qty INT,
    amount INT,
    date_s DATE,
    CONSTRAINT fk_member_id FOREIGN KEY (member_id) REFERENCES Members(id),
    CONSTRAINT fk_sale_book_id FOREIGN KEY (book_id) REFERENCES Books(id)
);
