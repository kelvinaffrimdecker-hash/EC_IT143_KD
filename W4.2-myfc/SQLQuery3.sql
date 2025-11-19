-- Create student table
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

-- Create class_history table
CREATE TABLE class_history (
    student_id INT,
    class_id INT,
    semester VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);
-- Insert data into student table
INSERT INTO student (student_id, student_name) VALUES
(1, 'Eddie Rodgers'),
(2, 'Koa Larsen'),
(5, 'Zahrah Mathis'),
(6, 'Ameer Silva');

-- Insert data into class_history table
INSERT INTO class_history (student_id, class_id, semester) VALUES
(1, 3001, 'Spring 2019'),
(1, 2001, 'Fall 2019'),
(2, 1004, 'Spring 2019'),
(2, 3002, 'Fall 2019'),
(3, 2001, 'Fall 2018'),
(4, 1001, 'Spring 2018'),
(5, 1001, 'Fall 2019');
INSERT INTO student (student_id, student_name) VALUES
(3, 'Unknown Student 3'),
(4, 'Unknown Student 4');

INSERT INTO class_history (student_id, class_id, semester) VALUES
(1, 3001, 'Spring 2019'),
(1, 2001, 'Fall 2019'),
(2, 1004, 'Spring 2019'),
(2, 3002, 'Fall 2019'),
(3, 2001, 'Fall 2018'),
(4, 1001, 'Spring 2018'),
(5, 1001, 'Fall 2019');

SELECT * FROM class_history;

SELECT 
    s.student_id,
    s.student_name,
    COUNT(ch.class_id) AS number_of_classes
FROM student s
LEFT JOIN class_history ch ON s.student_id = ch.student_id
GROUP BY s.student_id, s.student_name
ORDER BY s.student_id;