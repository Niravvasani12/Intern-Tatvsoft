-- Step 1: Create the student table
CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    age INT CHECK (age >= 10),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Step 2: Insert sample data
INSERT INTO student (first_name, last_name, email, age)
VALUES 
  ('Nirav', 'Vasani', 'nirav@example.com', 20),
  ('Mariya', 'Shimran', 'mariya@example.com', 21),
  ('KIRAN', 'CHAUHAN', 'kiran@example.com', 10),
  ('Kiv', 'Sachade', 'kiv@example.com', 19);

-- Step 3: Select all data
SELECT * FROM student;

-- Step 4: Select specific columns
SELECT first_name, email FROM student;

-- Step 5: Filter students with age >= 18
SELECT * FROM student WHERE age >= 18;

DELETE FROM student WHERE student_id = 2;

SELECT * FROM student ORDER BY student_id;

INSERT INTO student (first_name, last_name, email, age)
VALUES ('Mariya', 'Shimran', 'mariya@example.com', 21);

DELETE FROM student WHERE student_id = 5;

-- DELETE FROM student;

SELECT * FROM student ORDER BY first_name ASC;

SELECT * FROM student ORDER BY age DESC;

SELECT * FROM student WHERE first_name LIKE 'N%';

SELECT * FROM student WHERE first_name ILIKE '%en%';
