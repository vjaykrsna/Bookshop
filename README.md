# Bookshop Management System

This project implements a console-based Bookshop Management System using C++ and MySQL. It provides functionalities to manage various aspects of a bookshop, including books, purchases, employees, members, and sales.

## Features

*   **Book Management**: Add new books, update book prices, search for books, update inventory status based on received purchases, and display all books.
*   **Purchase Management**: Create new book orders, view pending, cancelled, and received orders, mark orders as cancelled or received.
*   **Employee Management**: Add new employees, search for employee details, assign manager status, view all employees, and update employee salaries. (Note: Manager status assignment requires manager privileges).
*   **Member Management**: Add new members, refresh membership validity (marks expired memberships as 'invalid'), and search for member details.
*   **Sales Management**: Add new sales bills, calculate and view total sales for the current year.
*   **Database Integration**: All data is persistently stored in a MySQL database.

## Technologies Used

*   **C++**: For the core application logic and console interface.
*   **MySQL**: Relational database for data storage.
*   **MySQL C++ Connector**: To enable C++ application to interact with the MySQL database.

## Setup Instructions

To set up and run this project, follow these steps:

### Prerequisites

1.  **C++ Compiler**: Ensure you have a C++ compiler (e.g., MinGW, GCC) installed on your system.
2.  **MySQL Server**: Install and configure a MySQL server.
3.  **MySQL C++ Connector**: Download and install the MySQL C++ Connector. You will need to link this library when compiling the C++ code.

    *   **Windows (using Visual Studio):** You might need to configure your project properties to include the connector's header and library paths.
    *   **Linux/macOS (using g++):** You'll typically link with `-lmysqlclient` or similar, ensuring the library is in your linker's search path.

### Database Setup

The database schema is defined in `Bookstore.session.sql`.

1.  **Create Database**: Open your MySQL client (e.g., MySQL Workbench, command-line client) and execute the following to create the database:
    ```sql
    CREATE DATABASE bookshop;
    USE bookshop;
    ```
2.  **Create Tables**: Execute the table creation statements from `Bookstore.session.sql` in your MySQL client. This will create the `Books`, `Purchases`, `Employees`, `Members`, and `Sales` tables.

    ```sql
    -- Example from Bookstore.session.sql
    CREATE TABLE Books (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        auth VARCHAR(255),
        price INT,
        qty INT
    );
    -- ... and so on for other tables
    ```

### Application Configuration

The `bookshop.cpp` file contains database connection details. Ensure they match your MySQL setup:

```cpp
#define HOST "127.0.0.1"
#define USER "root"
#define PASS "root" // Update this if your MySQL root password is different
#define DATABASE "management" // Change to "bookshop" as per your SQL script
#define PORT 3306
#define PASSWORD 1111 // Password for the application's main menu
```
**Important**: Change `#define DATABASE "management"` to `#define DATABASE "bookshop"` in `bookshop.cpp` to match the database created by `Bookstore.session.sql`.

### Compiling and Running

1.  **Compile**: Compile `bookshop.cpp` using your C++ compiler, linking against the MySQL C++ Connector library.

    *   **Example (g++ on Linux/macOS):**
        ```bash
        g++ bookshop.cpp -o bookshop -lmysqlclient
        ```
    *   **Example (MinGW on Windows):**
        ```bash
        g++ bookshop.cpp -o bookshop.exe -L"C:\path\to\mysql\connector\lib" -lmysqlclient
        ```
        (Replace `"C:\path\to\mysql\connector\lib"` with the actual path to your MySQL C++ Connector library files.)

2.  **Run**: Execute the compiled program.

    *   **Windows:**
        ```bash
        ./bookshop.exe
        ```
    *   **Linux/macOS:**
        ```bash
        ./bookshop
        ```

## Usage

Upon running the application, you will be prompted for a password (default: `1111`). After successful authentication, you will be presented with a main menu to navigate through different management sections (Books, Purchases, Employees, Members, Sales). Follow the on-screen prompts to perform various operations.
