CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    age INT CHECK (age >= 10),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

INSERT INTO student (first_name, last_name, email, age)
VALUES 
  ('nirav', 'Vasani', 'nirav12@example.com', 20),
  ('mariya', 'Shimran', 'mariya21@example.com', 21),
  ('KAYRA', 'malik', 'kyra33@example.com', 10),
  ('kiv', 'Sachade', 'kiv22@example.com', 19),
  ('Nency', 'Patel', 'nency44@example.com', 22),
  ('Jennifer', 'Smith', 'jennifer55@example.com', 23);

  
SELECT * FROM student;

SELECT first_name, email,age  FROM student;

SELECT * FROM student WHERE age >= 18;

SELECT UPPER(first_name) AS upper_name FROM student;
SELECT LOWER(first_name) AS lower_name FROM student;

-- If delete all data/delete table then used DROP 
DELETE FROM student WHERE student_id = 2;

SELECT * FROM student ORDER BY student_id;

SELECT * FROM student ORDER BY first_name ASC;

SELECT * FROM student ORDER BY age DESC;

SELECT * FROM student WHERE first_name LIKE 'N%';

SELECT * FROM student WHERE first_name ILIKE '%en%';


SELECT COUNT(*) AS total_students FROM student;

SELECT COUNT(*) AS aged_20_plus FROM student WHERE age >= 20;

SELECT DISTINCT first_name FROM student;

UPDATE student SET age = 20 WHERE first_name = 'nirav';

SELECT age, COUNT(*) AS num_students FROM student GROUP BY age ORDER BY age;

SELECT * FROM student ORDER BY age DESC LIMIT 3;
SELECT * FROM student WHERE first_name ILIKE '%a';

SELECT * FROM student WHERE active = TRUE;


SELECT * FROM student WHERE first_name LIKE '_i%';


CREATE TABLE student_marks (
    mark_id SERIAL PRIMARY KEY,
    student_id INT,
    subject VARCHAR(100),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);
INSERT INTO student_marks (student_id, subject, marks)
VALUES
    (1, 'Math', 85),
    (1, 'Science', 78),
    (3, 'Math', 90),
    (5, 'Math', 70),
    (6, 'Science', 95);

SELECT * FROM student_marks;
--* Left Join 
SELECT s.student_id, s.first_name, m.subject, m.marks
FROM student s
LEFT JOIN student_marks m ON s.student_id = m.student_id
ORDER BY s.student_id;

--* Right Join
SELECT s.student_id, s.first_name, m.subject, m.marks
FROM student s
RIGHT JOIN student_marks m ON s.student_id = m.student_id
ORDER BY m.student_id;

--* Inner Join
SELECT s.student_id, s.first_name, m.subject, m.marks
FROM student s
INNER JOIN student_marks m ON s.student_id = m.student_id
ORDER BY s.student_id;
