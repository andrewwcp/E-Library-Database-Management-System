# E-Library-Database-Management-System
SQL database implementation of e-library

# Objective
Industri 4.0 brings advancements in digital technology to various sectors, including education. E-library is a recent innovation that makes learning easier. Some libraries in Jakarta even provide special rooms for studying. The e-library application is developed with important steps, such as optimizing the database design. As a database administrator, we must ensure good relationships between the tables. Creating dummy data and performing simple queries will help test and validate the database design before implementation.

# Features and Limitation 
* Each library houses several types of books with varying quantities available for borrowing.
* Books stored in the library are categorized into different categories.
* Users can register an account, borrow books, return books, and manage their account.
* Users can borrow books from any library if the book is available.
* The maximum loan period is 2 weeks.
* Users can return books before the due date.
* Users can borrow a maximum of 2 books per loan.
* The application can track loan transactions including loan dates, due dates, and return dates.
* Users can place holds on books for borrowing.
* The library manages the hold queue. When a book becomes available, it can be borrowed by the user at the front of the queue. Additionally, if a user does not borrow a held book within 1 week, the book is passed to the next person in the queue.
* Users can place holds on a maximum of 2 books at a time.

# Design Process
* Explaining the mission statement
* Creating table structure
* Defining relationships between tables
* Defining business rules and constraints

# Mission Statement 
* The system organizes and manages various libraries.
* Users can borrow books from different categories.
* Users can easily browse, borrow, and place holds on library books while maintaining full control over their accounts.

# Creating Table Structure
| Nama Table | Deskripsi |
| --- | --- |
| libraries | Menyimpan informasi tentang perpustakaan |
| Books | Menyimpan informasi tentang berbagai jenis buku |
| Users | Menyimpan informasi mengenai data diri user |
| Book at library |  Menyimpan informasi  buku yang tersedia di setiap perpustakaan |
| Categories | Menyimpan kategori dari buku |
| Authors | Menyimpan informasi dari penulis |
| Publishers | Menyimpan data dari penerbit |
| Loan | Menyimpan informasi tentang peminjaman |
| Hold | Menyimpan informasi tentang pemesanan buku yang akan dipinjam|

1. Libraries Table
* Deskripsi : menyimpan informasi tentang perpustakaan
* Nama kolom dan tipe data
  
| Nama kolom | Tipe Data | Key |
| --- | --- | --- |
| library_id | int | CK → PK |
| library_name | varchar(100) |  CK → AK |
| email | varchar(100) | CK → AK |
| contact_number | varchar(20) | - | 






