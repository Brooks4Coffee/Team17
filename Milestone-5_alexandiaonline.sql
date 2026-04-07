
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

USE alexandia_online ; 




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



