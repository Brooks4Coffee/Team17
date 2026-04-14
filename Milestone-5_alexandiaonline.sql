
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
CREATE TABLE shelves (
	shelf_id INT PRIMARY KEY,
	shelf_location_description VARCHAR(100)
);

CREATE TABLE books(
	book_id INT PRIMARY KEY,
    book_title VARCHAR(100) NOT NULL,
    book_published_date DATE,
    book_isbn DOUBLE UNIQUE,
    
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

/*
---- ==================================================================================
--  PART 1.2: Fill out database									(name)
-- ==================================================================================*/

/*------------------------------------------------------
  1. 
  ------------------------------------------------------
  this section fills out each table with 24 or more rows as well as linking the foriegn keys
--------------------------------------------------------*/

INSERT INTO authors VALUES (1,'Andy','Weir','N/A'),(2,'JRR','Tolkien','J.R.R. Tolkien'),(3,'Jane','Austen','N/A'),(4,'F','Scott Fitzgerald','N/A'),(5,'George','Orwell','N/A'),(6,'Harper','Lee','N/A'),(7,'Stephen','King','N/A'),(8,'Agatha','Christie','N/A'),(9,'Isaac','Asimov','N/A'),(10,'Arthur','C Clarke','N/A'),(11,'Frank','Herbert','N/A'),(12,'Neil','Gaiman','N/A'),(13,'Terry','Pratchett','N/A'),(14,'Suzanne','Collins','N/A'),(15,'John','Green','N/A'),(16,'Dan','Brown','N/A'),(17,'Paulo','Coelho','N/A'),(18,'Yann','Martel','N/A'),(19,'Cormac','McCarthy','N/A'),(20,'Gillian','Flynn','N/A'),(21,'Stieg','Larsson','N/A'),(22,'Patrick','Rothfuss','N/A'),(23,'Ernest','Cline','N/A'),(24,'Alex','Michaelides','N/A');
INSERT INTO shelves VALUES (1,'on the second floor and first from the stairs'),(2,'on the first floor and first from the door'),(3,'on the second floor and second from the stairs'),(4,'on the first floor near the front desk'),(5,'on the second floor near the windows'),(6,'on the third floor east wing'),(7,'on the third floor west wing'),(8,'on the basement archive level'),(9,'on the first floor children\'s section'),(10,'on the second floor study area'),(11,'on the second floor near the elevators'),(12,'on the first floor reference section'),(13,'on the third floor quiet study zone'),(14,'on the basement rare books room'),(15,'on the first floor multimedia area'),(16,'on the second floor computer lab'),(17,'on the third floor historical section'),(18,'on the second floor reading lounge'),(19,'on the first floor near magazines'),(20,'on the third floor philosophy section'),(21,'on the second floor science section'),(22,'on the first floor entrance display'),(23,'on the basement storage area'),(24,'on the second floor literature wing');
INSERT INTO books VALUES (1,'The Martian','2011-02-11','9780804139021',1),(2,'Project Hail Mary','2021-05-04','9780593135204',1),(3,'The Hobbit','1937-09-21','9780345339683',2),(4,'The Fellowship of the Ring','1954-07-29','9780261103573',2),(5,'Pride and Prejudice','1813-01-28','9780141439518',3),(6,'Emma','1815-12-23','9780141439587',3),(7,'The Great Gatsby','1925-04-10','9780743273565',4),(8,'Tender Is the Night','1934-04-12','9780684801544',4),(9,'1984','1949-06-08','9780451524935',5),(10,'Animal Farm','1945-08-17','9780451526342',5),(11,'To Kill a Mockingbird','1960-07-11','9780061120084',6),(12,'Go Set a Watchman','2015-07-14','9780062409850',6),(13,'The Shining','1977-01-28','9780307743657',7),(14,'It','1986-09-15','9780450411434',7),(15,'Murder on the Orient Express','1934-01-01','9780062073501',8),(16,'And Then There Were None','1939-11-06','9780062073488',8),(17,'Foundation','1951-05-01','9780553293357',9),(18,'I Robot','1950-12-02','9780553382563',9),(19,'2001 A Space Odyssey','1968-07-01','9780451457998',10),(20,'Rendezvous with Rama','1973-06-01','9780575077331',10),(21,'Dune','1965-08-01','9780441172719',11),(22,'Dune Messiah','1969-10-15','9780441172696',11),(23,'American Gods','2001-06-19','9780062572233',12),(24,'Neverwhere','1996-09-16','9780380789016',12),(25,'Good Omens','1990-05-01','9780060853983',13),(26,'Small Gods','1992-05-01','9780062237378',13),(27,'The Hunger Games','2008-09-14','9780439023528',14),(28,'Catching Fire','2009-09-01','9780439023498',14),(29,'The Fault in Our Stars','2012-01-10','9780525478812',15),(30,'Looking for Alaska','2005-03-03','9780525475064',15),(31,'The Da Vinci Code','2003-04-03','9780307474278',16),(32,'Angels and Demons','2000-05-01','9781416524793',16),(33,'The Alchemist','1988-04-15','9780061122415',17),(34,'Brida','1990-01-01','9780061762703',17),(35,'Life of Pi','2001-09-11','9780156027328',18),(36,'Beatrice and Virgil','2010-02-02','9780385660068',18),(37,'The Road','2006-09-26','9780307387899',19),(38,'No Country for Old Men','2005-07-19','9780307387134',19),(39,'Gone Girl','2012-06-05','9780307588371',20),(40,'Sharp Objects','2006-09-26','9780307341556',20),(41,'The Girl with the Dragon Tattoo','2005-08-01','9780307454546',21),(42,'The Girl Who Played with Fire','2006-05-01','9780307454553',21),(43,'The Name of the Wind','2007-03-27','9780756404741',22),(44,'The Wise Man Fear','2011-03-01','9780756404734',22),(45,'Ready Player One','2011-08-16','9780307887443',23),(46,'Ready Player Two','2020-11-24','9781524761332',23),(47,'The Silent Patient','2019-02-05','9781250301697',24),(48,'The Maidens','2021-06-10','9781250304452',24);
INSERT INTO users VALUES (1,'Sean','Meegan','sean.meegan@gmail.com','210-123-4567','2026-04-07',3.67),(2,'Aubrey','Brooks','aubrey.brooks@gmail.com','210-234-5678','2026-04-08',6.21),(3,'Owen','Flatmen','owen.flatmen@gmail.com','210-345-6789','2026-04-06',0.01),(4,'Isi','Ataghauman','isi.ataghauman@gmail.com','210-456-7890','2026-04-04',9.99),(5,'Loren','Dunston','ldunston4@intel.com','413-897-0726','2025-05-15',8.93),(6,'Berta','Ney','bney5@mail.ru','187-413-5283','2026-02-21',9.62),(7,'Salim','Bagnal','sbagnal6@accuweather.com','615-893-2311','2025-07-11',5.76),(8,'Jennine','Wateridge','jwateridge7@cbc.ca','850-943-4179','2025-09-28',5.30),(9,'Abelard','Cowap','acowap8@woothemes.com','922-493-0682','2025-10-31',6.82),(10,'Laurella','Antusch','lantusch9@vk.com','449-676-7554','2025-09-17',7.27),(11,'Wallis','Siggin','wsiggina@tuttocitta.it','858-551-9144','2025-08-17',6.46),(12,'Zedekiah','Stiff','zstiffb@instagram.com','303-887-2594','2025-10-18',9.22),(13,'Meade','Wilse','mwilsec@pinterest.com','846-711-5184','2025-08-09',5.99),(14,'Charita','Balma','cbalmad@unblog.fr','595-543-6299','2025-04-11',3.94),(15,'Lyn','Ferreri','lferrerie@seattletimes.com','953-637-9413','2026-01-14',6.50),(16,'Nealon','Faulkner','nfaulknerf@ameblo.jp','919-646-2814','2025-04-30',6.43),(17,'Kassia','Edsell','kedsellg@nytimes.com','459-430-4833','2026-02-10',9.44),(18,'Othella','Hawthorn','ohawthornh@people.com.cn','164-389-3904','2025-09-14',6.91),(19,'Bellanca','Mountstephen','bmountstepheni@shareasale.com','890-581-7547','2026-01-13',4.03),(20,'Anstice','Pye','apyej@mysql.com','938-758-7950','2025-06-29',4.93),(21,'Madison','Aarons','maaronsk@mac.com','282-487-2628','2026-03-11',5.46),(22,'Elset','Dungee','edungeel@abc.net.au','303-189-4256','2025-12-07',4.33),(23,'Lyndy','McCaffrey','lmccaffreym@craigslist.org','433-324-2537','2026-02-23',9.24),(24,'Christabel','Benion','cbenionn@who.int','949-408-6307','2025-09-30',4.44),(25,'Doll','Poag','dpoago@usgs.gov','626-328-7597','2025-09-24',5.50),(26,'Bonny','Olenov','bolenovp@ask.com','367-111-7683','2025-10-16',2.06),(27,'Frans','Landre','flandreq@icq.com','119-132-0737','2025-07-19',7.44),(28,'Tilly','Ablott','tablottr@umn.edu','951-773-7828','2025-12-19',2.89),(29,'Bamby','Bygott','bbygotts@nymag.com','430-749-4672','2025-10-04',9.57),(30,'Yvon','Kent','ykentt@elegantthemes.com','249-881-2919','2025-11-09',4.38);
INSERT INTO genres VALUES (1,'Fantasy','Stories in medievel settings with magic.'),(2,'Science Fiction','Books that contain advanced technologies and real science.'),(3,'Mystery','Detective stories.'),(4,'Horror','Scary and intense stories.'),(5,'Romance','Love stories.'),(6,'Thriller','Fast paced suspense stories'),(7,'Adventure','Exploration and action stories'),(8,'Biography','Stories about real people'),(9,'Historical Fiction','Stories set in historical periods'),(10,'Young Adult','Books aimed at teenage readers'),(11,'Drama','Emotionally driven storytelling'),(12,'Crime','Stories involving criminal investigations'),(13,'Poetry','Collections of poems'),(14,'Philosophy','Books discussing philosophical ideas'),(15,'Self Help','Books about personal improvement'),(16,'Travel','Books about places and journeys'),(17,'Education','Academic or instructional books'),(18,'Technology','Books about computers and tech'),(19,'Politics','Books about political systems'),(20,'Religion','Books about religious beliefs'),(21,'Mythology','Stories of ancient myths'),(22,'Classic Literature','Famous works of literature'),(23,'Satire','Humorous criticism of society'),(24,'Short Stories','Collections of short narratives');
INSERT INTO loans VALUES (1,1,1,'2026-01-04','2026-04-04','2026-03-24'),(2,2,2,'2026-01-11','2026-03-08','2026-01-05'),(3,3,3,'2026-01-24','2026-04-04','2026-03-21'),(4,4,4,'2026-02-26','2026-03-20','2026-03-29'),(5,5,5,'2026-01-07','2026-03-20','2026-01-12'),(6,6,6,'2026-01-05','2026-03-07','2026-02-20'),(7,7,7,'2026-02-12','2026-03-08','2026-02-26'),(8,8,8,'2026-02-15','2026-03-25','2026-01-08'),(9,9,9,'2026-01-14','2026-03-04','2026-03-06'),(10,10,10,'2026-02-04','2026-04-03','2026-01-20'),(11,11,11,'2026-01-16','2026-03-28','2026-03-18'),(12,12,12,'2026-01-21','2026-03-22','2026-03-15'),(13,13,13,'2026-02-16','2026-03-01','2026-03-19'),(14,14,14,'2026-01-18','2026-03-04','2026-01-15'),(15,15,15,'2026-02-15','2026-03-17','2026-01-07'),(16,16,16,'2026-01-11','2026-03-17','2026-03-22'),(17,17,17,'2026-02-19','2026-03-29','2026-01-18'),(18,18,18,'2026-01-31','2026-03-26','2026-02-12'),(19,19,19,'2026-01-09','2026-03-24','2026-01-06'),(20,20,20,'2026-01-07','2026-04-03','2026-03-28'),(21,21,21,'2026-01-23','2026-04-05','2026-03-29'),(22,22,22,'2026-02-13','2026-03-22','2026-02-13'),(23,23,23,'2026-01-19','2026-03-02','2026-01-30'),(24,24,24,'2026-01-10','2026-04-04','2026-03-20'),(25,25,25,'2026-01-18','2026-03-15','2026-04-06'),(26,26,26,'2026-01-23','2026-03-01','2026-03-18'),(27,27,27,'2026-01-18','2026-03-25','2026-03-23'),(28,28,28,'2026-01-30','2026-03-16','2026-03-04'),(29,29,29,'2026-02-10','2026-04-01','2026-01-21'),(30,30,30,'2026-02-09','2026-03-26','2026-02-23');


 /*------------------------------------------------------
  2.
  ------------------------------------------------------
  insert the many to many relationships into a table

	-authors to their corresponding books

	-books to their coresponding genres

	-authors to their coresponding genres
  
 */

	

INSERT INTO authors_books VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,4),(5,3,5),(6,3,6),(7,4,7),(8,4,8),(9,5,9),(10,5,10),(11,6,11),(12,6,12),(13,7,13),(14,7,14),(15,8,15),(16,8,16),(17,9,17),(18,9,18),(19,10,19),(20,10,20),(21,11,21),(22,11,22),(23,12,23),(24,12,24),(25,13,25),(26,13,26),(27,14,27),(28,14,28),(29,15,29),(30,15,30),(31,16,31),(32,16,32),(33,17,33),(34,17,34),(35,18,35),(36,18,36),(37,19,37),(38,19,38),(39,20,39),(40,20,40),(41,21,41),(42,21,42),(43,22,43),(44,22,44),(45,23,45),(46,23,46),(47,24,47),(48,24,48);

INSERT INTO books_genres VALUES (1,1,2),(2,2,2),(3,3,1),(4,4,1),(5,5,5),(6,6,5),(7,7,22),(8,8,22),(9,9,2),(10,10,23),(11,11,11),(12,12,11),(13,13,4),(14,14,4),(15,15,3),(16,16,3),(17,17,2),(18,18,2),(19,19,2),(20,20,2),(21,21,1),(22,22,1),(23,23,1),(24,24,1),(25,25,23),(26,26,1),(27,27,10),(28,28,10),(29,29,5),(30,30,10),(31,31,6),(32,32,6),(33,33,14),(34,34,14),(35,35,11),(36,36,11),(37,37,11),(38,38,12),(39,39,6),(40,40,6),(41,41,3),(42,42,3),(43,43,1),(44,44,1),(45,45,2),(46,46,2),(47,47,6),(48,48,6);
	
INSERT INTO authors_genres VALUES (1,2,1),(2,1,2),(3,3,5),(4,4,3),(5,5,6),(6,6,11),(7,7,4),(8,8,3),(9,9,2),(10,10,2),(11,11,1),(12,12,1),(13,13,23),(14,14,10),(15,15,10),(16,16,6),(17,17,14),(18,18,7),(19,19,6),(20,20,6),(21,21,3),(22,22,1),(23,23,2),(24,24,6);


-- ==================================================================================
-- PART 2:     Write Queries to Demonstrate Database Functionality            Owen Flatman
-- ==================================================================================



-- This query shows how many books each user has borrowed.
SELECT 
    u.user_first_name,
    u.user_last_name,
    COUNT(l.loan_id) AS total_loans
FROM users u
JOIN loans l ON u.user_id = l.user_id
GROUP BY u.user_id
ORDER BY total_loans DESC;
-- This query shows how many times each book has been borrowed.
SELECT 
    b.book_title,
    COUNT(l.loan_id) AS times_borrowed
FROM books b
JOIN loans l ON b.book_id = l.book_id
GROUP BY b.book_id
ORDER BY times_borrowed DESC;
-- This query finds the average balance of all users.
SELECT AVG(user_balance) AS avg_balance
FROM users;
-- This query finds the user with the highest balance.
SELECT *
FROM users
WHERE user_balance = (SELECT MAX(user_balance) FROM users);
-- This query combines first and last names to show full user names.
SELECT *
FROM users
WHERE user_balance = (SELECT MAX(user_balance) FROM users);
-- This query lists all unique genres in the database.
SELECT DISTINCT genre_name
FROM genres;
-- This query shows each book along with its shelf location.
SELECT 
    b.book_title,
    s.shelf_location_description
FROM books b
JOIN shelves s ON b.shelf_id = s.shelf_id
ORDER BY b.book_title;
-- This query finds books that are overdue and not yet returned.
SELECT 
    b.book_title,
    u.user_first_name,
    u.user_last_name,
    l.loan_end_date
FROM loans l
JOIN books b ON l.book_id = b.book_id
JOIN users u ON l.user_id = u.user_id
WHERE l.loan_return_date IS NULL
AND l.loan_end_date < CURDATE();


CREATE TABLE IF NOT EXISTS loan_audit_log (
    log_id          INT PRIMARY KEY AUTO_INCREMENT,
    event_type      VARCHAR(10),
    loan_id         INT,
    user_id         INT,
    book_id         INT,
    notes           VARCHAR(255),
    event_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- ----------------------------------------------------------------------------------
-- TRIGGER 1 - INSERT
-- Fires after a new loan is created. Logs the new checkout to loan_audit_log.
-- ----------------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER after_loan_insert
AFTER INSERT ON loans
FOR EACH ROW
BEGIN
    INSERT INTO loan_audit_log (event_type, loan_id, user_id, book_id, notes)
    VALUES ('INSERT', NEW.loan_id, NEW.user_id, NEW.book_id,
            CONCAT('New loan checked out. Due: ', NEW.loan_end_date));
END$$
DELIMITER ;

-- Demonstration: insert a loan and check the log
INSERT INTO loans (loan_id, user_id, book_id, loan_checkout_date, loan_end_date)
VALUES (31, 1, 2, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 30 DAY));
SELECT * FROM loan_audit_log WHERE event_type = 'INSERT';


-- ----------------------------------------------------------------------------------
-- TRIGGER 2 - UPDATE
-- Fires after a loan's due date is changed. Logs the old and new due date.
-- ----------------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER after_loan_due_date_update
AFTER UPDATE ON loans
FOR EACH ROW
BEGIN
    IF OLD.loan_end_date <> NEW.loan_end_date THEN
        INSERT INTO loan_audit_log (event_type, loan_id, user_id, book_id, notes)
        VALUES ('UPDATE', NEW.loan_id, NEW.user_id, NEW.book_id,
                CONCAT('Due date changed from ', OLD.loan_end_date, ' to ', NEW.loan_end_date));
    END IF;
END$$
DELIMITER ;

-- Demonstration: extend due date by 14 days and check the log
UPDATE loans SET loan_end_date = DATE_ADD(loan_end_date, INTERVAL 14 DAY) WHERE loan_id = 31;
SELECT * FROM loan_audit_log WHERE event_type = 'UPDATE';


-- ----------------------------------------------------------------------------------
-- TRIGGER 3 - DELETE
-- Fires before a loan is deleted. Archives the record so it is never silently lost.
-- ----------------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER before_loan_delete
BEFORE DELETE ON loans
FOR EACH ROW
BEGIN
    INSERT INTO loan_audit_log (event_type, loan_id, user_id, book_id, notes)
    VALUES ('DELETE', OLD.loan_id, OLD.user_id, OLD.book_id,
            CONCAT('Loan deleted. Originally checked out: ', OLD.loan_checkout_date));
END$$
DELIMITER ;

-- Demonstration: delete the loan and confirm it was archived
DELETE FROM loans WHERE loan_id = 31;
SELECT * FROM loan_audit_log WHERE loan_id = 31;


-- ----------------------------------------------------------------------------------
-- STORED PROCEDURE: get_overdue_loans_for_user
-- Given a user_id, returns all overdue loans and how many days overdue each one is.
-- IN  p_user_id INT - the user to check
-- ----------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE get_overdue_loans_for_user (IN p_user_id INT)
BEGIN
    SELECT
        CONCAT(u.user_first_name, ' ', u.user_last_name) AS user_full_name,
        b.book_title,
        l.loan_end_date,
        DATEDIFF(CURDATE(), l.loan_end_date) AS days_overdue
    FROM loans l
    JOIN users u ON l.user_id = u.user_id
    JOIN books b ON l.book_id = b.book_id
    WHERE l.user_id = p_user_id
      AND l.loan_return_date IS NULL
      AND l.loan_end_date < CURDATE()
    ORDER BY days_overdue DESC;
END$$
DELIMITER ;

-- Demonstration: check overdue loans for user 25
CALL get_overdue_loans_for_user(25);


-- ----------------------------------------------------------------------------------
-- FUNCTION: fn_days_until_due
-- Given a loan_id, returns days remaining until due.
-- Positive = days left, 0 = due today, negative = overdue by N days.
-- IN  p_loan_id INT - the loan to check
-- RETURNS INT
-- ----------------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION fn_days_until_due (p_loan_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_end_date  DATE;
    SELECT loan_end_date INTO v_end_date FROM loans WHERE loan_id = p_loan_id LIMIT 1;
    RETURN DATEDIFF(v_end_date, CURDATE());
END$$
DELIMITER ;

-- Demonstration: check days remaining across all active loans
SELECT
    l.loan_id,
    CONCAT(u.user_first_name, ' ', u.user_last_name) AS patron,
    b.book_title,
    fn_days_until_due(l.loan_id) AS days_until_due
FROM loans l
JOIN users u ON l.user_id = u.user_id
JOIN books b ON l.book_id = b.book_id
WHERE l.loan_return_date IS NULL
ORDER BY days_until_due ASC;
