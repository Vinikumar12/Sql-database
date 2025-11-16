USE batch61;


CREATE TABLE Course (
  CourseId INT NOT NULL,
  CourseName VARCHAR(15) DEFAULT NULL,
  Fee DECIMAL(10,2) DEFAULT NULL,
  PRIMARY KEY (CourseId)
);


CREATE TABLE Student (
  StudentId INT,
  StudentName VARCHAR(15),
  Mobile BIGINT,  
  CourseId INT,
  PRIMARY KEY (StudentId),
  FOREIGN KEY (CourseId) REFERENCES Course(CourseId)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
INSERT INTO Course VALUES
(1, 'Java', 15000.00),
(2, 'Python', 12000.00),
(3, 'SQL', 10000.00),
(4, 'C++', 18000.00);

INSERT INTO Student VALUES
(1, 'vijay', 9887544645, 1),
(2, 'vinay', 98877666, 3),
(3, 'vini', 988555, 4),
(4, 'chandu', 9887778964, 2);
UPDATE Student SET Mobile = 123456789 WHERE StudentId = 3;
DELETE FROM Student WHERE StudentId = 4;
SELECT * FROM Student;
SELECT * FROM Course;

/* Explanation:
I created two tables: Student and Course. These represent which student has taken which course.
In the above queries, INSERT is used to add data into the Student table. 
UPDATE and DELETE are used when we want to modify or remove data from the table. 
By using UPDATE, we can change existing values, and by using DELETE, we can remove records.

The clauses ON UPDATE CASCADE and ON DELETE CASCADE are used with foreign keys. 
They ensure that when changes are made in the parent table (Course), the corresponding changes 
are automatically applied to the child table (Student). For example, if a CourseId is updated 
or deleted in the Course table, the related rows in the Student table will also be updated or deleted.

Finally, SELECT is used to display the data from the table for viewing.
*/


