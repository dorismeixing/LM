DROP TABLE universities, majors, mentors, students CASCADE;


CREATE TABLE majors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  level VARCHAR(255),
  description text
);

CREATE TABLE mentors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description text
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE universities (
  id SERIAL PRIMARY KEY,
  name varchar(255) UNIQUE,
  description text,
  major_id INT REFERENCES majors(id),
  mentor_id INT REFERENCES mentors(id),
  student_id INT REFERENCES students(id),
  location varchar(255)
);
