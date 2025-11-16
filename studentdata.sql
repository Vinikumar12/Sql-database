use batch61;
create table Studentt(
StudentId int,
StudentName varchar(15),
Mobile long,
CourseId int,
primary key(StudentId),
foreign key(CourseId)  references  courseId(CourseId)
on update cascade 
on delete cascade
);
CREATE TABLE courseid (
  CourseId int NOT NULL,
  CourseName varchar(15) DEFAULT NULL,
  Fee float(10,2) DEFAULT NULL,
  PRIMARY KEY (CourseId)
);
insert into Studentt values(1,"vijay",9887544645,1),
(2,"vinay",98877666,3),(3,"vini",988555,4),
(4,"chandu",9887778964,2);
insert into Studentt values(3,"vini",123456789,4);
update Studentt set StudentId=10  where StudentId=3;
delete   from Studentt where StudentId=10;
use batch61;
select * from studentt;
update Studentt set CourseId=12 where CourseId=3;


