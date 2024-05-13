--importing files to libraries table
copy 
 libraries
FROM
 'C:/Users/Andrew/Downloads/libraries.csv'
DELIMITER ','
CSV
HEADER;

--importing files to categories table
COPY
 categories
FROM
 'C:\Users\Andrew\Downloads\category.csv'
DELIMITER ','
CSV
HEADER;

--importing files to publishers table
COPY
 publishers
FROM
 'C:\Users\Andrew\Downloads\publishers.csv'
DELIMITER ','
CSV
HEADER;

--importing files to authors table
COPY
 authors
FROM
 'C:\Users\Andrew\Downloads\authors.csv'
DELIMITER ','
CSV
HEADER;

--importing files to users table
COPY
 users
FROM
 'C:\Users\Andrew\Downloads\users.csv'
DELIMITER ','
CSV
HEADER;

--importing files to books table
COPY
 books
FROM
 'C:\Users\Andrew\Downloads\books.csv'
DELIMITER ','
CSV
HEADER;

--importing files to book_at_library table
COPY
 book_at_library
FROM
 'C:\Users\Andrew\Downloads\library_books.csv'
DELIMITER ','
CSV
HEADER;

--importing files to loan table
COPY
 loan
FROM
 'C:\Users\Andrew\Downloads\loans.csv'
DELIMITER ','
CSV
HEADER;

--importing files to hold table
COPY
 "hold"
FROM
 'C:\Users\Andrew\Downloads\holds.csv'
DELIMITER ','
CSV
HEADER;
