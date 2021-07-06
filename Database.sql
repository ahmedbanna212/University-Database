
CREATE DATABASE University50126411uu

CREATE TABLE PERSON
(
P_ID INT NOT NULL,
Fname VARCHAR(30) NOT NULL,
Mname VARCHAR(30) NOT NULL,
Lname VARCHAR(30),
Number VARCHAR(30),
DOB Date,
Adress VARCHAR(30),
Gender varchar(20),
constraint PK_PERSON
 PRIMARY KEY(P_ID)
);

CREATE TABLE Faculty
(
FAC_Code int NOT NULL,
FAC_Name varchar(30) NOT NULL,
Dean_Fname varchar(30) NOT NULL,
Dean_Lname varchar(30) NOT NULL,
Vice_Dean_Fname varchar(30),
Vice_Dean_Lname varchar(30),
constraint PK_Faculty
PRIMARY KEY (FAC_Code),
);

CREATE TABLE Student
(
P_ID int  not NULL,
GRP  char ,
StudentYear int,
GPA float,
FacultyCode int  not NULL,
constraint PK_student
PRIMARY KEY (P_ID),
CONSTRAINT PK_studente
FOREIGN KEY (FacultyCode) REFERENCES Faculty (FAC_Code),
constraint SuperClass_FK_Student
foreign key (P_ID)REFERENCES PERSON (P_ID)
);

create table Module(
MOD_ID Int not null,
MOD_Level varchar(30),
MOD_Name varchar(30),
MOD_Hours int,
constraint PK_MOD
PRIMARY KEY (MOD_ID),
);

create table Teacher_Assistant(
P_ID int not null,
Major varchar(30),
DateofHire varchar(30),
Salary int,
Module_ID int not null,
constraint PK_TA
Primary key(P_ID),
constraint PK_TA_MOD
Foreign key(Module_ID) references Module(MOD_ID),
constraint SuperClass_FK_TA
foreign key (P_ID)REFERENCES PERSON (P_ID)
);

create table office(
Building char,
Office_NO int not null,
Sector int,
Floor_Num int,
primary key(Office_NO),
);

create table Professor(
P_ID int not null,
Years_Of_Experiences varchar(30),
Major varchar(50),
Salary float,
Module_ID int not null,
FAC_ID int not null,
Office_Num int not null
constraint PK_Professor
Primary key(P_ID),
constraint FK_prof_mod
Foreign key(Module_ID) references Module(MOD_ID),
constraint Office_PK
foreign key (Office_Num) references office(Office_NO),
constraint SuperClass_FK_Prof
foreign key (P_ID)REFERENCES PERSON (P_ID)
);

create table Department(
Dept_ID int not null,
Dept_Name varchar(30),
Dept_Description varchar(30),
constraint PK_DEPT
Primary key (Dept_ID)
);

create table Staff(
P_ID int not null,
Salary float,
Department_ID int not null,
constraint Dep_IDfk
Foreign key(Department_ID) references Department(Dept_ID),
constraint PK_Staff
Primary key(P_ID)
);

create table Research_project(
P_ID int not null,
Project_name varchar(25),
Project_letter_Grade varchar(10),
Project_Topic varchar(20),
Project_ID int not null,
constraint rp_pk
primary key(Project_ID),
constraint FK_RP_PRO
Foreign key(P_ID) references Professor(P_ID)
);

create table Teaching 
(
P_ID int not null,
FAC_Code int not null,
primary key (P_ID,FAC_Code),
 constraint FK_RP_PROF
Foreign key(P_ID) references Professor(P_ID),
constraint FK_RP_FAC
Foreign key(FAC_Code) references Faculty(FAC_Code)
);

create table Student_audit(
    P_ID int NOT NULL,
    GRP  char ,
    StudentYear int,
    GPA float,
    FacultyCode int NOT NULL,
);

create trigger trig
ON Student

for insert 
as 
    declare @P_ID int;
    declare @GRP char;
    declare @StudentYear int;
    declare @GPA float;
    declare @FacultyCode int;

    select @P_ID = S.P_ID from inserted S;
    select @GRP = S.GRP from inserted S;
    select @StudentYear = S.StudentYear from inserted S;
    select @GPA = S.GPA from inserted S;
    select @FacultyCode = S.FacultyCode from inserted S;

    insert into Student_audit
    values (@P_ID, @GRP, @StudentYear, @GPA, @FacultyCode);
    print 'Trigger Successfully Excuted'
    GO

	

 /*AHMED SALAH*/
 INSERT INTO  PERSON
Values(1238,'Ahmed','Salah','Banna','01026489592','11/12/2000','10th of ramadan','Male');

 INSERT INTO  PERSON
Values(1239,'Mohamed','Ahmed','Ali','01028498498','12/10/1999','zamalek','Male');

 INSERT INTO  PERSON
Values(1240,'Ali','Essam','Ahmed','01044839489','2/5/2000','zamalek','Male');

 INSERT INTO  PERSON
Values(1241,'Sayed','Omar','mohamed','0104457864','1/10/1998','Nasr City','Male');

 INSERT INTO  PERSON
Values(1243,'Nada','Sayed','Ali','0111697899','04/04/2001','Nasr City','Female');

 INSERT INTO  PERSON
Values(1244,'Sara','Hossam','Sayed','01245479746','07/08/1997','Geza','Female');

INSERT INTO  PERSON
Values(1247,'Ahmed','ali','ramadan','01026489594','11/12/1975','10th of ramadan','Male');

INSERT INTO  PERSON
Values(1246,'Ahmed','omar','mohamed','01026489593','11/05/1978','el shorouq','Male');

---------------------------------------------------------------------------
INSERT INTO  Faculty
values(21,'Computer Science','Ahmed','Sami','Ali','Mohamed')

INSERT INTO  Faculty
values(22,'business','Omar','Hossam','Ahmed','Mohamed')

INSERT INTO  Faculty
values(23,'Engineering','Sara','Sabry','Emad','Hamde')

INSERT INTO  Faculty
values(24,'ART','Youstina','fikry','youssef','Ali')

INSERT INTO  Faculty
values(25,'LAW','Mohab','Salah','Yossef','Arafa')
----------------------------------------------------------------------------------
INSERT INTO  Student
values(1238,'A',1,3.8,21);
INSERT INTO  Student
values(1239,'A',1,3,21);
INSERT INTO  Student
values(1240,'A',4,2.8,21);
INSERT INTO  Student
values(1241,'A',1,3.5,22);
INSERT INTO  Student
values(1247,null,2,3.0,22);
INSERT INTO  Student
values(1243,'B',4,3.2,24);
INSERT INTO  Student
values(1244,null,3,3.8,25);
 /*AHMED SALAH*/
--------------------------------------------------------------------------------------
/*Omar Wael*/

 INSERT INTO  PERSON
Values(2000,'Amr','Essam','Adham','01044855771','06/07/1982','Zamalek','Male');

 INSERT INTO  PERSON
Values(2001,'Abdullah','Omar','Ziyad','0105566994','05/10/1994','Nasr City','Male');

 INSERT INTO  PERSON
Values(2002,'Nada','Farid','Ali','0111696969','04/04/1986','Nasr City','Female');

 INSERT INTO  PERSON
Values(2003,'Sara','Omar','Maria','0125559746','07/08/1997','Geza','Female');

INSERT INTO  PERSON
Values(2004,'Zeina','Ali','Ramadan','01010109594','11/12/1982','10th of ramadan','Female');

INSERT INTO  PERSON
Values(2005,'Ahmed','Hussien','Mohamed','01021189511','01/01/1975','Zamalek','Male');

INSERT INTO  PERSON
Values(2006,'Alia','Tamer','Omar','01026589693','11/08/1982','Fifth Settlement','Female');

INSERT INTO  PERSON
Values(2007,'Omar','Wael','Youri','010641231','12/05/1978','El shorouq','Male');



Insert Into Teacher_Assistant
Values(2000,'Computer ScinecE','12/03/2010',4000,2400);

Insert Into Teacher_Assistant
Values(2001,'Law','10/04/2017',12000,2401);

Insert Into Teacher_Assistant
Values(2002,'Business','26/09/2018',8000,2402);

Insert Into Teacher_Assistant
Values(2003,'Arts','20/09/2017',7000,2403);

Insert Into Teacher_Assistant
Values(2004,'Law','19/07/2017',8000,2404);

Insert Into Teacher_Assistant
Values(2005,'Engeneering','12/03/2010',10000,2405);

Insert Into Teacher_Assistant
Values(2006,'Computer Science','12/12/2014',6000,2406);

Insert Into Teacher_Assistant
Values(2007,'Computer Science','12/03/2019',6000,2408);



insert into Module
values(2400,'Year 1','HCI',150);

insert into Module
values(2401,'Year 4','Criminal Outburst',100);

insert into Module
values(2402,'Preparation','Introduction to Business',200);

insert into Module
values(2403,'Year 3','Spontanues Art',180);

insert into Module
values(2404,'Preparation','Introduction to Law',150);

insert into Module
values(2405,'Year 1','Mechanics',220);

insert into Module
values(2406,'Year 1','Javascript',150);

insert into Module
values(2408,'Preparation','Math 2',180);




select  distinct p.Fname+' '+p.Lname AS'Full Name',p.P_ID
from PERSON p,Student s,Faculty f
where s.P_ID IN(SELECT p.P_ID
					from Student s
					where s.P_ID=p.P_ID and GRP='A' and StudentYear=1)
And FacultyCode in (select FAC_Code
					from Faculty f,Student s
					where f.FAC_Code=s.FacultyCode and FAC_Name='Computer Science')
---------------------------------------------------------------------------------------------
select PERSON.P_ID,Fname+' '+Lname as'Full Nmae',GPA
			from PERSON join Student
			on PERSON.P_ID=Student.P_ID and GPA>3.0
			order by GPA
-----------------------------------------------------------------------------------------------			
select PERSON.P_ID,Fname+' '+Lname as'Full Nmae',Adress
from PERSON
where Adress='Zamalek'

-------------------------------------------------------------------------------------------------

SELECT count(P_ID) AS 'Number Of Female Techer Assistants'
from PERSON
where Gender like 'Female';



Select Fname+' '+Fname as 'Full Name',P_ID
From PERSON
where Gender='Male' AND P_ID IN (Select P_ID
						 From Module
						 Where P_ID=P_ID AND
						 MOD_Hours>150);

Select Fname,Lname
From PERSON
where Fname like 'A%'
AND Lname like'A%' ;

