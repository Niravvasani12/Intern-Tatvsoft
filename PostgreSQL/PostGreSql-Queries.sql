-- Step 1: Create the Student Table
CREATE TABLE student (
   student_id SERIAL PRIMARY KEY, -- Auto-incrementing ID
   first_name VARCHAR(100) NOT NULL, -- Student's first name
   last_name VARCHAR(100) NOT NULL, -- Student's last name
   email VARCHAR(255) UNIQUE NOT NULL, -- Unique email
   created_date TIMESTAMPTZ NOT NULL DEFAULT NOW(), -- Record creation timestamp
   updated_date TIMESTAMPTZ -- Optional update timestamp
);

ALTER TABLE student ADD COLUMN active BOOLEAN;
ALTER TABLE student RENAME COLUMN email TO email_address; -- Rename column
ALTER TABLE student RENAME COLUMN email_address TO email; -- Rename back
ALTER TABLE student RENAME TO users; -- Rename student to users
ALTER TABLE users RENAME TO student; -- Rename back to student

-- Create the orders table (can be renamed to student_orders if preferred)
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES student(student_id),
    order_date TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    order_number VARCHAR(50) NOT NULL,
    order_amount DECIMAL(10,2) NOT NULL
);

-- Insert into student table
INSERT INTO student(first_name, last_name, email, created_date, updated_date, active)
VALUES ('Bansi', 'Sachade', 'bansi.sachade@tatvasoft.com', NOW(), NULL, true);

INSERT INTO student (first_name, last_name, email, created_date, updated_date, active) VALUES
  ('John', 'Doe', 'johndoe@example.com', NOW(), NULL, true),
  ('Alice', 'Smith', 'alicesmith@example.com', NOW(), NULL, true),
  ('Bob', 'Johnson', 'bjohnson@example.com', NOW(), NULL, true),
  ('Emma', 'Brown', 'emmabrown@example.com', NOW(), NULL, true),
  ('Michael', 'Lee', 'michaellee@example.com', NOW(), NULL, false),
  ('Sarah', 'Wilson', 'sarahwilson@example.com', NOW(), NULL, true),
  ('David', 'Clark', 'davidclark@example.com', NOW(), NULL, true),
  ('Olivia', 'Martinez', 'oliviamartinez@example.com', NOW(), NULL, true),
  ('James', 'Garcia', 'jamesgarcia@example.com', NOW(), NULL, false),
  ('Sophia', 'Lopez', 'sophialopez@example.com', NOW(), NULL, false),
  ('Jennifer', 'Davis', 'jennifer.davis@example.com', NOW(), NULL, true),
  ('Jennie', 'Terry', 'jennie.terry@example.com', NOW(), NULL, true),
  ('JENNY', 'SMITH', 'jenny.smith@example.com', NOW(), NULL, false),
  ('Hiren', 'Patel', 'hirenpatel@example.com', NOW(), NULL, false);

-- Insert into orders
INSERT INTO orders (student_id, order_date, order_number, order_amount) VALUES
  (1, '2024-01-01', 'ORD001', 50.00),
  (2, '2024-01-01', 'ORD002', 35.75),
  (3, '2024-01-01', 'ORD003', 100.00),
  (4, '2024-01-01', 'ORD004', 30.25),
  (5, '2024-01-01', 'ORD005', 90.75),
  (6, '2024-01-01', 'ORD006', 25.50),
  (7, '2024-01-01', 'ORD007', 60.00),
  (8, '2024-01-01', 'ORD008', 42.00),
  (9, '2024-01-01', 'ORD009', 120.25),
  (10,'2024-01-01', 'ORD010', 85.00),
  (1, '2024-01-02', 'ORD011', 55.00),
  (1, '2024-01-03', 'ORD012', 80.25),
  (2, '2024-01-03', 'ORD013', 70.00),
  (3, '2024-01-04', 'ORD014', 45.00),
  (1, '2024-01-05', 'ORD015', 95.50),
  (2, '2024-01-05', 'ORD016', 27.50),
  (2, '2024-01-07', 'ORD017', 65.75),
  (2, '2024-01-10', 'ORD018', 75.50);

-- SELECT examples
SELECT first_name FROM student;

SELECT first_name, last_name, email FROM student;

SELECT * FROM student;

-- ORDER BY queries
SELECT first_name, last_name FROM student ORDER BY first_name ASC;
SELECT first_name, last_name FROM student ORDER BY last_name DESC;
SELECT student_id, first_name, last_name FROM student ORDER BY first_name ASC, last_name DESC;

-- WHERE clause examples
SELECT last_name, first_name FROM student WHERE first_name = 'Hiren';

SELECT student_id, first_name, last_name FROM student WHERE first_name = 'Hiren' AND last_name = 'Parejiya';

SELECT student_id, first_name, last_name FROM student WHERE first_name IN ('John', 'David', 'James');

SELECT first_name, last_name FROM student WHERE first_name LIKE '%EN%';

SELECT first_name, last_name FROM student WHERE first_name ILIKE '%EN%';

-- JOIN examples
SELECT * FROM orders AS o INNER JOIN student AS s ON o.student_id = s.student_id;

SELECT * FROM student AS s LEFT JOIN orders AS o ON s.student_id = o.student_id;

-- GROUP BY and Aggregation
SELECT s.student_id, s.first_name, s.last_name, s.email,
       COUNT(o.order_id) AS NoOrders,
       SUM(o.order_amount) AS Total
FROM student AS s
INNER JOIN orders AS o ON s.student_id = o.student_id
GROUP BY s.student_id;

-- GROUP BY with HAVING
SELECT s.student_id, s.first_name, s.last_name, s.email,
       COUNT(o.order_id) AS No_Orders,
       SUM(o.order_amount) AS Total
FROM student AS s
INNER JOIN orders AS o ON s.student_id = o.student_id
GROUP BY s.student_id
HAVING COUNT(o.order_id) > 1;

-- Subquery with IN
SELECT * FROM orders WHERE student_id IN (
  SELECT student_id FROM student WHERE active = true
);

-- Subquery with EXISTS
SELECT student_id, first_name, last_name, email
FROM student
WHERE EXISTS (
  SELECT 1 FROM orders WHERE orders.student_id = student.student_id
);

-- UPDATE
UPDATE student
SET first_name = 'bansi', last_name = 'sachade', email = 'bansi.sachade@tatvasoft.com'
WHERE student_id = 1;

-- DELETE
DELETE FROM student WHERE student_id = 11;
