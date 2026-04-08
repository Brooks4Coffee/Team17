
-- ==================================================================================
--  PART 1: SETTING UP DATA BASE                                    (Audrey)
-- ==================================================================================

/*----------------------------------------------------
  1. Create database 
------------------------------------------------------
   The code in this section is setting up our database's
   environment.
   
------------------------------------------------------ */

CREATE DATABASE IF NOT EXISTS alexandria_online ;	

USE alexandria_online ; 




/*----------------------------------------------------
 2. Create the Tables 
------------------------------------------------------ 
  The Tables below will be the foundation of our database.
  The following tables have been implemented in this 
  section:
          - users
          - books
          - shelves
          - authors
          - genres
          - loans

------------------------------------------------------ */
CREATE TABLE books(
	book_id INT PRIMARY KEY,
    book_title VARCHAR(100) NOT NULL,
    booke_published_date DATE,
    book_isbn INT UNIQUE,
    
    shelf_id INT,
    FOREIGN KEY (shelf_id) REFERENCES shelves(shelf_id)
);

CREATE TABLE users (
	user_id INT PRIMARY KEY,
	user_first_name VARCHAR(100), 
	user_last_name VARCHAR(100), 
	user_email VARCHAR(100) UNIQUE, 
	user_phone VARCHAR(100), 
	user_signup_date DATE,
    user_balance DECIMAL(9, 2) NOT NULL DEFAULT 0.00,
       CHECK (user_balance > 0)
);



CREATE TABLE shelves (
	shelf_id INT PRIMARY KEY,
	shelf_location_description VARCHAR(100)
);


CREATE TABLE authors (
	author_id INT PRIMARY KEY,
	author_first_name VARCHAR(100), 
	author_last_name VARCHAR(100), 
	author_pen_name VARCHAR(100)
);

CREATE TABLE loans (
	loan_id INT PRIMARY KEY,    
    
    user_id INT, 
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    
    book_id INT, 
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    
	loan_checkout_date DATE,
    loan_end_date DATE NOT NULL,
    loan_return_date DATE
);

CREATE TABLE genres (
	genre_id INT PRIMARY KEY,
	genre_name VARCHAR(100) UNIQUE, 
	genre_description VARCHAR(100)
);





/*----------------------------------------------------
 3. Create the Associative tables 
------------------------------------------------------ 
 This section aims to resolve the many-to-many relationships
 that are between the following: 
 
	- Authors writing multiple different Genres /
      Genres containing multiple Authors
 
	- Genres containing multiple Books /
      Books belonging in multiple Genres 

    - Authors writing multiple Books /
      Books having multiple Authors

------------------------------------------------------ */

CREATE TABLE authors_books (
	authors_books INT PRIMARY KEY,    
    
    author_id INT, 
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    
    book_id INT, 
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE TABLE books_genres (
	books_genres_id INT PRIMARY KEY,    
    
    book_id INT, 
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    
    genre_id INT, 
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);


CREATE TABLE authors_genres (
	author_genres_id INT PRIMARY KEY,    
    
    author_id INT, 
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    
    genre_id INT, 
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);







-- ==================================================================================
--  PART 2: Fill out database									(name)
-- ==================================================================================

/*------------------------------------------------------
  1. 
  ------------------------------------------------------
  describe step here
  Not done with data implmentation yet
--------------------------------------------------------*/
INSERT INTO Genres VALUES
(1,'Fantasy','Stories in medievel settings with magic.'),
(2,'Science Fiction','Books that contain advanced technologies and real science.'),
(3,'Mystery','Detective stories.'),
(4,'Horror','Scary and intense stories.'),
(5,'Romance','Love stories.');

INSERT INTO shelves VALUES
(1, 'on the second floor and first from the stairs'),
(2, 'on the first floor and first from the door'),
(3, 'on the second floor and second from the stairs');

INSERT INTO books VALUES
(1, 'Lord of the Rings', '1954-07-29', 02611252, 1),
(2, 'Project Hail Mary', '2021-05-04', 05935229, 2),
(3, 'Pride and prejudice', '1813-01-28', 84763454, 1),
(4, 'The Great Gatsby', '1925-04-10', 04321252, 3);

INSERT INTO users VALUES
(1, 'Sean', 'Meegan', 'sean.meegan@gmail.com', '210-123-4567', '2026-04-07', 3.67),
(2, 'Aubrey', 'Brooks', 'aubrey.brooks@gmail.com', '210-234-5678', '2026-04-08', 6.21),
(3, 'Owen', 'Flatmen', 'owen.flatmen@gmail.com', '210-345-6789', '2026-04-06', 0.01),
(4, 'Isi', 'Ataghauman', 'isi.ataghauman@gmail.com', '210-456-7890', '2026-04-04', 9.99);

INSERT INTO users VALUES
(1, 'Andy', 'Wier', 'N/A'),
(2, 'John', 'Tolkien', 'JRR Tolkien'),
(3, 'Jane', 'Austen', 'By the Author of Sense and Sensibilit'),
(4, 'Francis', 'Fitzgerald', 'F. Scott Fitzgerald');

INSERT INTO authors VALUES
(1, 'Andy', 'Wier', 'N/A'),
(2, 'John', 'Tolkien', 'JRR Tolkien'),
(3, 'Jane', 'Austen', 'By the Author of Sense and Sensibilit'),
(4, 'Francis', 'Fitzgerald', 'F. Scott Fitzgerald');

INSERT INTO loans VALUES
(1, 3, 3, '2026-04-06', '2026-04-13', '2026-04-06'),
(2, 1, 1, '2026-04-07', '2026-04-09', '2026-04-06'),
(3, 1, 4, '2026-04-06', '2026-04-13', '2026-04-06');


INSERT INTO authors_books VALUES
(1,1,3),
(2,2,2),
(3,3,1);

INSERT INTO books_genres VALUES
(1,1,3),
(2,1,1),
(3,3,3);

INSERT INTO authors_genres VALUES
(1,2,3),
(2,1,2),
(3,1,2);

/*------------------------------------------------------
  2. 
  ------------------------------------------------------
  describe step here
  
--------------------------------------------------------*/


/*------------------------------------------------------
  3. 
  ------------------------------------------------------
  describe step here
--------------------------------------------------------*/





-- ==================================================================================
-- PART 3: 									(name)
-- ==================================================================================

/*------------------------------------------------------
  1. 
  ------------------------------------------------------
  describe step here
  
--------------------------------------------------------*/


/*------------------------------------------------------
  2. 
  ------------------------------------------------------
  describe step here
  
--------------------------------------------------------*/


/*------------------------------------------------------
  3. 
  ------------------------------------------------------
  describe step here
--------------------------------------------------------*/






-- ==================================================================================
-- PART 4: 									(name)
-- ==================================================================================

/*------------------------------------------------------
  1. 
  ------------------------------------------------------
  describe step here
  
--------------------------------------------------------*/


/*------------------------------------------------------
  2. 
  ------------------------------------------------------
  describe step here
  
--------------------------------------------------------*/


/*------------------------------------------------------
  3. 
  ------------------------------------------------------
  describe step here
--------------------------------------------------------*/



