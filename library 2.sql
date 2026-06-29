CREATE DATABASE librarydb;
USE librarydb;

CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(150),
    RegistrationDate DATE
);

CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    ISBN VARCHAR(20),
    Category VARCHAR(50),
    Publisher VARCHAR(100),
    PublicationYear YEAR,
    AvailableCopies INT
);

CREATE TABLE Borrowing (
    BorrowID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
INSERT INTO Members (FirstName, LastName, Phone, Email, Address, RegistrationDate)
VALUES
('Melala', 'Muleta', '0911111111', 'melala@email.com', 'Addis Ababa', '2026-06-01'),
('Sara', 'Kebede', '0922222222', 'sara@email.com', 'Bole', '2026-06-02'),
('Abel', 'Tesfaye', '0933333333', 'abel@email.com', 'Kazanchis', '2026-06-03'),
('Hana', 'Desta', '0944444444', 'hana@email.com', 'Piassa', '2026-06-04');

INSERT INTO Books (Title, Author, ISBN, Category, Publisher, PublicationYear, AvailableCopies)
VALUES
('Database Systems', 'Korth', 'ISBN001', 'Education', 'Pearson', 2020, 5),
('Python Basics', 'Guido Rossum', 'ISBN002', 'Programming', 'OReilly', 2019, 10),
('Networking Essentials', 'Forouzan', 'ISBN003', 'IT', 'McGrawHill', 2021, 7),
('Introduction to Algorithms', 'Cormen', 'ISBN004', 'Education', 'MIT Press', 2018, 4),
('Operating Systems', 'Silberschatz', 'ISBN005', 'Education', 'Wiley', 2022, 6),
('Harry Potter', 'J.K. Rowling', 'ISBN006', 'Fantasy', 'Bloomsbury', 2001, 12),
('The Alchemist', 'Paulo Coelho', 'ISBN007', 'Fiction', 'HarperCollins', 1995, 8),
('Clean Code', 'Robert Martin', 'ISBN008', 'Programming', 'Prentice Hall', 2008, 5),
('Data Science Handbook', 'Field Cady', 'ISBN009', 'Data Science', 'OReilly', 2020, 6),
('Artificial Intelligence', 'Stuart Russell', 'ISBN010', 'AI', 'Pearson', 2023, 3);

INSERT INTO Borrowing (MemberID, BookID, BorrowDate, DueDate, ReturnDate)
VALUES
(1, 2, '2026-06-10', '2026-06-17', NULL),
(2, 1, '2026-06-11', '2026-06-18', NULL),
(3, 5, '2026-06-12', '2026-06-19', NULL),
(4, 3, '2026-06-13', '2026-06-20', NULL);

select * from books;
select * from borrowing;
select * from members;

select members.MemberID,members.FirstName,members.LastName,books.Title,borrowing.BorrowDate,borrowing.DueDate,borrowing.ReturnDate from borrowing
join books on books.bookID=borrowing.bookId
join members on members.memberid= borrowing.MemberId;


select title,Available from books;

select members.FirstName, members.LastName,books.Title,borrowing.ReturnDate from borrowing
join books on books.bookID=borrowing.bookId
join members on members.memberid= borrowing.MemberId;

/*late returned books*/
select members.FirstName, members.LastName,books.Title,borrowing.ReturnDate from borrowing
join books on books.bookID=borrowing.bookId
join members on members.memberid= borrowing.MemberId
where borrowing.ReturnDate>borrowing.DueDate;

/*overdue books*/
SELECT
    Members.FirstName,
    Members.LastName,
    Books.Title,
    Borrowing.BorrowDate,
    Borrowing.DueDate
FROM Borrowing
JOIN Members ON Members.MemberID = Borrowing.MemberID
JOIN Books ON Books.BookID = Borrowing.BookID
WHERE Borrowing.ReturnDate IS NULL
AND Borrowing.DueDate < CURDATE();
