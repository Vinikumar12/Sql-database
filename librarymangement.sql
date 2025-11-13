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
