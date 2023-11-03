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
  explanation INT NOT NULL,
  kindness INT NOT NULL,
  review VARCHAR(100) NOT NULL,
  rate_date DATE NOT NULL,
  professor_id INT NOT NULL,
  student_id INT NOT NULL,
  FOREIGN KEY	(professor_id)
    REFERENCES	professor(professor_id),
  FOREIGN KEY	(student_id)
    REFERENCES	student(student_id)
);


DROP TABLE IF EXISTS subject;
CREATE TABLE IF NOT EXISTS subject (
  subject_name VARCHAR(45),
  class_name VARCHAR(15) NOT NULL,
  units FLOAT NOT NULL,
  num_of_rated INT NOT NULL,
  professor_id INT NOT NULL,
  subject_year YEAR NOT NULL,
  term INT NOT NULL,
  FOREIGN KEY	(professor_id)
    REFERENCES	professor(professor_id)
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
           (4, '黑', '鬼', 2.69, '2021');
           

