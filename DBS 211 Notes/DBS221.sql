create table course
(
courseid char(6) Primary KEY,
cousename varchar(35) not null
);
create table enroll
(
stid int references student,
courseid char(6),
grade char(1),
CONSTRAINT stid_crs_id_pk PRIMARY key(stid, courseid)

);

Alter table enroll ADD constraint crs_fk foreign key(courseid) references course;

Insert into student values (123, 'Ken', 'Lin', 'Klin@seneca.ca', 1234567890);
Insert into student values (456, 'Fenil', 'Soni', 'fsone@seneca.ca', 0123456789);
Insert into student values (789, 'Manav', 'zadafiya', 'manav@seneca.ca', 1230456789);
Insert into student values (012, 'arth', 'patel', 'arth@seneca.ca', 4501256789);
Insert into student values (234, 'sunny', 'vavadiya', 'sunny@seneca.ca', 2340056789);

select * from student;

Insert into course values ('zcc', 'OOP');
Insert into course valuese (225, 'DBS');

select * from course;

insert into enroll values (123,'ZCC',2);




