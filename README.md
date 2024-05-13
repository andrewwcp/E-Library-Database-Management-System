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
1. Libraries Table
* Deskripsi : menyimpan informasi tentang perpustakaan
* Nama kolom dan tipe data
  
| Nama kolom | Tipe Data | Key |
| --- | --- | --- |
| library_id | int | CK → PK |
| library_name | varchar(100) |  CK → AK |
| email | varchar(100) | CK → AK |
| contact_number | varchar(20) | - | 

2. Books Table
* Deskripsi : menyimpan berbagai jenis informasi mengenai buku
* Nama kolom dan tipe data

| Nama kolom | Tipe Data | Key |
| --- | --- | --- |
| book_id | int | CK → PK |
| book_title | varchar(100) | CK → AK |
| date_of_publication | date | |
| category_id | int | FK |
| author_id | int | FK |
| publisher_id | int |FK |

3. Users Table
* Deskripsi : Menyimpan informasi mengenai data diri user
* Nama kolom dan tipe data

| Nama kolom | Tipe Data | Key |
| --- | --- | --- | 
| user_id | int | CK → PK|
| username | varchar(100) | CK → AK
| first_name | varchar(100) | 
| last_name | varchar(100) |
| email | varchar(100) |CK → AK |
| password | varchar(100) |
| contact_number | varchar(20) |

4. Book at library Table
* Deskripsi : Menyimpan informasi buku yang disimpan di setiap perpustakaan
* Nama kolom dan tipe data

| Nama kolom | Tipe Data | Key |
| --- | --- | --- |
| library_book_id | int | CK → PK |
| library_id | int | FK 
| book_id |int | FK |
| quantity | int |

5. Categories Table
* Deskripsi : Menyimpan kategori dari buku
* Nama kolom dan tipe data

| Nama kolom | Tipe Data | Key |
| --- | --- | --- |
| category_id | int | CK → PK |
| category_name | varchar(50) | CK → AK |

6. Authors Table
* Deskripsi : Menyimpan informasi dari penulis
* Nama kolom dan tipe data

| Nama kolom | Tipe Data | Key |
| --- | --- | --- |
| author_id | int | CK → PK |
| name | varchar(100) | CK → AK |
| email | varchar(100) | CK → AK |
| contact_number | varchar(20) |

7. Publisher Table
* Deskripsi : Menyimpan informasi dari publisher
* Nama kolom dan tipe data

| Nama kolom | Tipe Data | Key |
| --- | --- | --- |
| publisher_id | int | CK → PK |
| name | varchar(100) | CK → AK |
| address | varchar(200) |
| email | varchar(100) | CK → AK |
| contact_number | varchar(20) |

8. Loan Table 
* Deskripsi : Menyimpan history peminjaman dari user
* Nama kolom dan tipe data

| Nama kolom | Tipe Data | Key |
| --- | --- | --- |
| loan_id | int | CK → PK |
| user_id | int | FK |
| library_book_id | int | FK |
| loan_date | timestamp |
| due_date | timestamp |
| return_date | timestamp |
| status | varchar(50) |

9. Hold Table
* Deskripsi : Menyimpan informasi mengenai pemesanan buku yang akan dipinjam (hold)
* Nama kolom dan tipe data

| Nama kolom | Tipe Data | Key |
| --- | --- | --- |
| hold_id | int | CK → PK |
| user_id | int | FK |
| library_book_id | int | FK |
| hold_date | timestamp |
| expire_date | timestamp |
| status | varchar(50) |

# Defining Relationship
| - | Libraries | Books | Users | Book at Library | Categories | Authors | Publishers | Hold | Loan | libraries |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| **libraries** | - | - | - | 1:N | - | - | - | - | - | - |
| **Books** | - | - | - | 1:N | - | - | - | - | - | - |
| **Users** | - | - | - | - | - | - | - | - | 1:N | 1:N |
| **Book at Library** | - | - | - | - | - | - | - | - | - | - |
| **Categories** | - | 1:N | - | - | - | - | - | - | - | - |
| **Authors** | - | 1:N | - | - | - | - | - | - | - | - |
| **Publishers** | - | 1:N | - | - | - | - | - | - | - | - |
| **Hold** | - | - | - | - | - | - | - | - | - | - |
| **Loan** | - | - | - | - | - | - | - | - | - | - |
| **libraries** | - | - | - | - | - | - | - | - | - | - |

Note: 
* 1:N : One-to-many relationship
* 1:1 : One-to-one relationship
* N:N : Many-to-many relationship

# Defining Business Rules and Constraint
**1. Libraries table**

Business Rules:
* Primary key bersifat auto increment
* Informasi harus lengkap

Constraint:
* Tipe library_id : serial
* Not Null pada field
  * library_id
  * library_name
  * email
  * contact_number

**2. Books table**

Business Rules:
* Primary key bersifat auto increment
* Informasi harus lengkap 

Constraint:
* Tipe book_id : serial 
* Not Null pada field :
  * book_id
  * book_title
  * date_of_publication
  * category_id
  * author_id
  * publisher_id

**3. Users table**

Business Rules:
* Primary key bersifat auto increment
* informasi harus lengkap 

Constraint:
* Tipe user_id : serial 
* Not Null pada field :
  * user_id
  * username
  * first_name
  * last_name
  * email
  * password
  * contact_number

**4. Book at library  table**

Business Rules:
* Primary key bersifat auto increment
* informasi harus lengkap 
* nilai quantity lebih dari atau sama dengan 0

Constraint:
* Tipe library_book_id: serial 
* Not Null pada field:
  * library_book_id
  * library_id
  * book_id
  * quantity
* CHECK pada quantity >= 0

**5. Categories table**

Business Rules:
* informasi harus lengkap

Constraint:
* Not Null pada field:
  * category_id
  * category_name
 
**6. Authors table**

Business Rules:
* Primary key bersifat auto increment
* informasi harus lengkap
  
Constraint:
* Tipe author_id: serial 
* Not Null pada field:
  * author_id
  * name
  * email
  * contact_number

**7. Publisher table**

Business Rules:
* Primary key bersifat auto increment
* informasi harus lengkap

Constraint:
* Tipe publisher_id: serial 
* Not Null pada field:
  * publisher_id
  * name
  * email
  * contact_number
 
**8. Loan table**

Business Rules:
* Primary key bersifat auto increment
* informasi harus lengkap kecuali return date

Constraint:
* Tipe loan_id : serial 
* Not Null pada field:
  * loan_id
  * user_id
  * library_book_id
  * loan_date
  * due_date
  * status
 
**9. Hold table**

Business Rules:
* Primary key bersifat auto increment
* informasi harus lengkap kecuali expire_date 

Constraint:
* Tipe hold_id: serial 
* Not Null pada field:
  * hold_id
  * user_id
  * library_book_id
  * hold_date
  * status

# ERD






























 














