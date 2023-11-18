DROP SCHEMA IF EXISTS db_app;
CREATE SCHEMA IF NOT EXISTS db_app;

USE db_app;

DROP TABLE IF EXISTS professor;
CREATE TABLE IF NOT EXISTS professor (
  professor_id INT PRIMARY KEY,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL
);

DROP TABLE IF EXISTS student;
CREATE TABLE IF NOT EXISTS student (
  student_id INT PRIMARY KEY,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  gpa FLOAT(3, 2) NOT NULL,
  cur_year YEAR NOT NULL
);

DROP TABLE IF EXISTS ratings;
CREATE TABLE IF NOT EXISTS ratings (
  student_id INT NOT NULL,
  professor_id INT NOT NULL,
  explanation INT NOT NULL,
  kindness INT NOT NULL,
  knowledgability INT NOT NULL,
  approachability INT NOT NULL,
  review VARCHAR(100) NOT NULL,
  rate_date DATE NOT NULL,
  FOREIGN KEY	(student_id)
    REFERENCES	student(student_id),
  FOREIGN KEY	(professor_id)
    REFERENCES	professor(professor_id)
);


DROP TABLE IF EXISTS subject;
CREATE TABLE IF NOT EXISTS subject (
  subject_id INT PRIMARY KEY,
  subject_name VARCHAR(45),
  units FLOAT NOT NULL,
  professor_id INT NOT NULL,
  subject_year YEAR NOT NULL,
  term INT NOT NULL,
  FOREIGN KEY	(professor_id)
    REFERENCES	professor(professor_id)
);

DROP TABLE IF EXISTS subject_list;
CREATE TABLE IF NOT EXISTS subject_list (
  student_id INT,
  subject_id INT,
  PRIMARY KEY (student_id, subject_id),
  FOREIGN KEY	(student_id)
    REFERENCES	student(student_id),
  FOREIGN KEY	(subject_id)
    REFERENCES	subject(subject_id)
);

INSERT INTO professor
	VALUES (1, 'Nick', 'Gurr'),
		   (2, 'Fah', 'Get'),
           (3, 'Kura', 'Kurr'),
           (4, 'Yo', 'Bama');
           
INSERT INTO student
	VALUES (1, 'John', 'Smith', 4.0, '2021'),
		   (2, 'Johnson', 'Johnson', 3.2, '2020'),
           (3, 'Light', 'Yagami', 3.90, '2020'),
           (4, 'hei', 'gui', 2.69, '2021'),
           (5, 'Schneider', 'Dan', 1.2, 2020);

INSERT INTO ratings
	VALUES (1, 1, 4, 5, 6, 4, 'Mid', '2020-03-05'),
		   (2, 1, 8, 7, 5, 9, 'Very nice', '2020-03-05'),
           (3, 1, 1, 2, 3, 1, 'I don\' like the vibe', '2020-03-07'),
           (4, 1, 5, 5, 5, 5, 'gay', '2020-03-07');
           
INSERT INTO subject
	VALUES (1, 'CCPROG1', 3, 1, '2019', 1),
		   (2, 'CCPROG3', 5, 2, '2019', 3);

INSERT INTO subject_list
	VALUES (1, 1),
           (2, 1),
           (3, 1),
           (4, 1);