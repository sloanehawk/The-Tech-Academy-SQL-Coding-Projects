CREATE DATABASE db_Library

USE db_Library
GO

/* create tables */

CREATE TABLE library_branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(60) NOT NULL
);

CREATE TABLE publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(5200,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY(300,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE book_authors (
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE book_copies (
	BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE book_loans (
	BookID INT NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID2 FOREIGN KEY REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);


/* populate data */

INSERT INTO library_branch
	(BranchName, Address)
	VALUES 
	('Sharpstown', '1234 Reading Dr'),
	('Central', '4545 Knowledge Ln'),
	('Westwood', '1000 Grove St'),
	('Oldtown', '6270 Woodward Ave')
;


INSERT INTO publisher 
	(PublisherName, Address, Phone)
	VALUES 
	('Picador', '302 Riverdale Dr', '784-234-9403'),
	('Allen & Unwin', '113 Hillside Ave', '990-112-3918'),
	('HarperTorch', '64 Lafayette Ave', '534-113-2209'),
	('Bloomsbury', '97 Cactus Ln', '454-318-8159'),
	('Geoffrey Bles', '98 Old York Rd', '313-314-5170'),
	('Doubleday', '93 Schoolhouse Ave', '617-919-3419'),
	('Little, Brown and Company', '237 Trout Ave', '321-453-1498'),
	('Viking', '8438 S Hartford St', '930-204-5182'),
	('Jarrod & Sons', '999 Riverside St', '929-143-9489'),
	('Harper & Brothers', '31 West Military Ln', '433-413-9583'),
	('World Publishing Company', '8462 W Jefferson Dr', '173-418-4879'),
	('J.B. Lippincott & Co.', '416 Beacon St', '948-149-3124'),
	('Charles Scribner''s Sons', '8911 East Fairway St', '383-298-9532')
;


INSERT INTO borrower
	(Name, Address, Phone)
	VALUES
	('Graham Gomez','7892 Blue Spring St','510-545-1031'),
	('Gerrard Rios','72 Halifax Rd', '570-825-5856'),
	('Antonia Noble','910 White Dr', '678-262-8593'),
	('Sofie Wood','609 Young St', '894-252-9302'),
	('Carlo Carey','8796 Woodsman St', '902-996-0183'),
	('Tommie Vega','8339 Clinton Ave', '338-286-4603'),
	('Jonty Driscoll', '862 Academy St', '208-234-4483'),
	('Tyriq Wilde', '439 Linda St', '739-892-7590'),
	('Nevaeh Dunlap','339 Carriage St', '749-508-3364'),
	('Ashton Herrera','92 John St', '219-993-1129'),
	('Gerald Jones', '111 Left St', '234-325-6160')
;


INSERT INTO books
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Picador'),
	('The Lord of the Rings', 'Allen & Unwin'),
	('The Alchemist', 'HarperTorch'),
	('Harry Potter and the Philosopher''s Stone', 'Bloomsbury'),
	('The Hobbit', 'Allen & Unwin'),
	('The Shining', 'Doubleday'),
	('The Lion, the Witch and the Wardbrobe', 'Geoffrey Bles'),
	('The Da Vinci Code', 'Doubleday'),
	('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
	('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
	('Harry Potter and the Goblet of Fire', 'Bloomsbury'),
	('Harry Potter and the Order of the Phoenix', 'Bloomsbury'),
	('Harry Potter and the Half-Blood Prince', 'Bloomsbury'),
	('Harry Potter and the Deathly Hallows', 'Bloomsbury'),
	('The Catcher in the Rye', 'Little, Brown and Company'),
	('It', 'Viking'),
	('Black Beauty', 'Jarrod & Sons'),
	('Charlotte''s Web', 'Harper & Brothers'),
	('The Very Hungry Caterpillar', 'World Publishing Company'),
	('To Kill a Mockingbird', 'J.B. Lippincott & Co.'),
	('The Great Gatsby', 'Charles Scribner''s Sons')
;




INSERT INTO book_authors
	(BookID, AuthorName)
	VALUES
	(300, 'Mark Lee'),
	(301, 'J.R.R. Tolkien'),
	(302, 'Paulo Coelho'),
	(303, 'J.K. Rowling'),
	(304, 'J.R.R. Tolkien'),
	(305, 'Stephen King'),
	(306, 'C.S. Lewis'),
	(307, 'Dan Brown'),
	(308, 'J.R.R. Tolkien'),
	(309, 'J.R.R. Tolkien'),
	(310, 'J.R.R. Tolkien'),
	(311, 'J.R.R. Tolkien'),
	(312, 'J.R.R. Tolkien'),
	(313, 'J.R.R. Tolkien'),
	(314, 'J.D. Salinger'),
	(315, 'Stephen King'),
	(316, 'Anna Sewell'),
	(317, 'E.B. White'),
	(318, 'Eric Carle'),
	(319, 'Harper Lee'),
	(320, 'F. Scott Fitzgerald')
;


INSERT INTO book_copies 
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(300, 1, 3),
	(301, 1, 4),
	(302, 1, 2),
	(303, 1, 3),
	(304, 1, 2),
	(305, 1, 3),
	(306, 1, 4),
	(307, 1, 3),
	(320, 1, 2),
	(319, 1, 3),
	(318, 1, 4),
	(310, 2, 3),
	(305, 2, 4),
	(312, 2, 2),
	(313, 2, 3),
	(314, 2, 2),
	(315, 2, 3),
	(316, 2, 4),
	(317, 2, 3),
	(320, 2, 2),
	(319, 2, 3),
	(318, 2, 4),
	(300, 3, 3),
	(301, 3, 4),
	(308, 3, 2),
	(309, 3, 3),
	(310, 3, 2),
	(315, 3, 3),
	(316, 3, 4),
	(317, 3, 3),
	(320, 3, 2),
	(319, 3, 3),
	(318, 3, 4),
	(306, 4, 3),
	(307, 4, 4),
	(308, 4, 2),
	(309, 4, 3),
	(310, 4, 2),
	(311, 4, 3),
	(312, 4, 4),
	(313, 4, 3),
	(314, 4, 2),
	(315, 4, 3),
	(316, 4, 4)
;

INSERT INTO book_loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES	
	(300, 1, 5200, '2019-09-13', '2019-10-29'),
	(301, 1, 5200, '2019-09-13', '2019-10-29'),
	(302, 1, 5200, '2019-09-13', '2019-10-29'),
	(303, 1, 5200, '2019-09-13', '2019-10-29'),
	(304, 1, 5200, '2019-09-13', '2019-10-29'),
	(305, 1, 5201, '2019-09-23', '2019-11-13'),
	(306, 1, 5201, '2019-09-23', '2019-11-13'),
	(307, 1, 5201, '2019-09-23', '2019-11-13'),
	(320, 1, 5201, '2019-09-23', '2019-11-13'),
	(319, 1, 5201, '2019-09-23', '2019-11-13'),
	(318, 1, 5201, '2019-09-23', '2019-11-13'),
	(310, 2, 5202, '2019-09-20', '2019-11-15'),
	(305, 2, 5202, '2019-09-20', '2019-11-15'),
	(312, 2, 5202, '2019-09-20', '2019-11-15'),
	(313, 2, 5202, '2019-09-20', '2019-11-15'),
	(314, 2, 5203, '2019-09-17', '2019-11-17'),
	(315, 2, 5203, '2019-09-17', '2019-11-17'),
	(316, 2, 5203, '2019-09-17', '2019-11-17'),
	(317, 2, 5203, '2019-09-17', '2019-11-17'),
	(320, 2, 5203, '2019-09-17', '2019-11-17'),
	(319, 2, 5203, '2019-09-17', '2019-11-17'),
	(318, 2, 5203, '2019-09-13', '2019-10-13'),
	(300, 3, 5204, '2019-09-15', '2019-10-15'),
	(301, 3, 5204, '2019-10-26', '2019-11-26'),
	(308, 3, 5204, '2019-10-26', '2019-11-26'),
	(309, 3, 5204, '2019-10-26', '2019-11-26'),
	(310, 3, 5205, '2019-10-19', '2019-11-19'),
	(315, 3, 5205, '2019-10-19', '2019-11-19'),
	(316, 3, 5205, '2019-10-19', '2019-11-19'),
	(317, 3, 5205, '2019-09-03', '2019-11-03'),
	(320, 3, 5206, '2019-09-03', '2019-11-03'),
	(319, 3, 5206, '2019-09-03', '2019-11-03'),
	(318, 3, 5206, '2019-09-03', '2019-11-03'),
	(306, 4, 5207, '2019-10-08', '2019-11-08'),
	(307, 4, 5207, '2019-10-08', '2019-11-08'),
	(308, 4, 5207, '2019-10-08', '2019-11-08'),
	(309, 4, 5207, '2019-10-08', '2019-11-08'),
	(310, 4, 5207, '2019-10-08', '2019-11-08'),
	(311, 4, 5207, '2019-10-08', '2019-11-08'),
	(312, 4, 5207, '2019-10-08', '2019-11-08'),
	(313, 4, 5207, '2019-10-08', '2019-11-08'),
	(314, 4, 5207, '2019-10-17', '2019-11-17'),
	(307, 4, 5208, '2019-10-17', '2019-11-17'),
	(308, 4, 5208, '2019-10-17', '2019-11-17'),
	(309, 4, 5208, '2019-10-17', '2019-11-17'),
	(310, 4, 5208, '2019-10-17', '2019-11-17'),
	(311, 4, 5208, '2019-09-12', '2019-11-12'),
	(312, 4, 5208, '2019-09-12', '2019-11-12'),
	(313, 4, 5208, '2019-09-12', '2019-11-12'),
	(314, 4, 5208, '2019-09-27', '2019-11-27'),
	(315, 4, 5209, '2019-09-29', '2019-10-29'),
	(316, 4, 5209, '2019-09-12', '2019-11-12')
;


