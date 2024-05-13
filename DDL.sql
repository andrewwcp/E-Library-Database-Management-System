-- Libraries Table
CREATE TABLE libraries (
    library_id serial PRIMARY KEY,
    library_name VARCHAR(100) not null UNIQUE,
    email VARCHAR(100) not null UNIQUE,
    contact_number VARCHAR(20) not null
);

-- Users Table
CREATE TABLE users (
    user_id serial PRIMARY KEY,
    username varchar(100) not null UNIQUE,
    first_name VARCHAR(100) not null,
    last_name VARCHAR(100) not null,
    email VARCHAR(100) not null UNIQUE,
    password VARCHAR(100) not null,
    contact_number varchar(20) not null
);

-- Categories Table
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) not null UNIQUE
);

-- Authors Table
CREATE TABLE authors (
    author_id serial PRIMARY KEY,
    name VARCHAR(100) not null UNIQUE,
    email VARCHAR(100) not null UNIQUE,
    contact_number VARCHAR(20) not null
);

-- Publishers Table
CREATE TABLE publishers (
    publisher_id serial PRIMARY KEY,
    name VARCHAR(100) not null UNIQUE,
    address VARCHAR(200) not null,
    email VARCHAR(100) not null UNIQUE,
    contact_number VARCHAR(20) not null
);

-- Books Table
CREATE TABLE books (
    book_id serial PRIMARY KEY,
    book_title VARCHAR(100) not null UNIQUE,
    date_of_publication DATE not null,
    category_id INT not null,
    author_id INT not null,
    publisher_id INT not null,
    constraint books_categories FOREIGN KEY (category_id) REFERENCES categories(category_id),
    constraint books_authors FOREIGN KEY (author_id) REFERENCES authors(author_id),
    constraint books_publishers FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
);

-- Book at library Table
CREATE TABLE books_at_library (
    library_book_id serial PRIMARY KEY,
    library_id INT not null,
    book_id INT not null,
    quantity INT check(quantity >= 0) not null,
    constraint bookatlibrary_library FOREIGN KEY (library_id) REFERENCES libraries(library_id),
    constraint bookatlibrary_book FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Loan Table
CREATE TABLE loan (
    loan_id serial PRIMARY KEY,
    user_id INT not null,
    library_book_id INT not null,
    loan_date TIMESTAMP not null,
    due_date TIMESTAMP not null,
    return_date TIMESTAMP,
    status VARCHAR(50) not null,
    constraint loan_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    constraint loan_bookatlibrary FOREIGN KEY (library_book_id) REFERENCES books_at_library(library_book_id)
);

-- Hold Request Table
CREATE TABLE hold (
    hold_id serial PRIMARY KEY,
    user_id INT not null,
    library_book_id INT not null,
    hold_date TIMESTAMP not null,
    expire_date TIMESTAMP,
    status VARCHAR(50) not null,
    constraint hold_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    constraint hold_bookatlibrary FOREIGN KEY (library_book_id) REFERENCES books_at_library(library_book_id)
);
