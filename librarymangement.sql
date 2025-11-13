use librarydb;

create table category(
  categoryid int primary key auto_increment,
  categoryname varchar(14)
);

create table Author(
  authorid int primary key,
  authorname varchar(15)
);

create table Book(
  bookid int primary key auto_increment,
  title varchar(19) not null,
  publishyear date
);

create table BookAuthor(
  bookid int,
  authorid int,
  primary key(bookid, authorid),
  foreign key(bookid) references Book(bookid),
  foreign key(authorid) references Author(authorid)
);

create table members(
  memberid int primary key auto_increment,
  membername varchar(15) not null,
  email varchar(20)
);

create table Loan(
  loanid int primary key auto_increment,
  bookid int not null,
  memberid int not null,
  issuedate date,
  duedate date,
  returndate date,
  foreign key(bookid) references Book(bookid),
  foreign key(memberid) references members(memberid)
);
/* Explanation:
I designed a Library Management System using MySQL Workbench to efficiently manage books, authors, members, and loans. 
The database is structured with normalization principles to reduce redundancy and improve data integrity.
Key Tables and Relationships:
Book: Stores book details like title and publish year.

Author: Contains author information.

BookAuthor: Manages many-to-many relationships between books and authors.

Members: Holds member data including name and email.

Loan: Tracks book loans with issue, due, and return dates.

Category: Defines book categories
Primary Keys ensure unique identification of records.

Foreign Keys establish relationships between tables (e.g., Book–Author, Book–Loan).

NOT NULL constraints enforce mandatory fields like book title and member name.

Normalization eliminates data duplication and simplifies data insertion and retrieval.
Purpose:
This schema allows clients to:

Retrieve books by category

Track which member borrowed which book

Maintain clean, organized, and scalable data
