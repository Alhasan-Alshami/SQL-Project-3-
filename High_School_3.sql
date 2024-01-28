-- Junction table for teachers and students
CREATE TABLE teacher_student_relation (
    Teachers_id INT,
    Students_id INT,
    PRIMARY KEY (Teachers_id, Students_id),
    FOREIGN KEY (Teachers_id) REFERENCES teachers_3(Teachers_id),
    FOREIGN KEY (Students_id) REFERENCES students_3(Students_id)
);

-- Junction table for subjects and teachers
CREATE TABLE subject_teacher_relation (
    Material_id INT,
    Teachers_id INT,
    PRIMARY KEY (Material_id, Teachers_id),
    FOREIGN KEY (Material_id) REFERENCES materials_3(Material_id),
    FOREIGN KEY (Teachers_id) REFERENCES teachers_3(Teachers_id)
);

-- Junction table for subjects and students
CREATE TABLE subject_student_relation (
    Material_id INT,
    Students_id INT,
    PRIMARY KEY (Material_id, Students_id),
    FOREIGN KEY (Material_id) REFERENCES materials_3(Material_id),
    FOREIGN KEY (Students_id) REFERENCES students_3(Students_id)
);

-- Create Procedure student_info
DELIMITER //
CREATE PROCEDURE student_info()
BEGIN
    SELECT students_3.Students_name, materials_3.Material_name
    FROM students_3
    JOIN subject_student_relation ON students_3.Students_id = subject_student_relation.Students_id
    JOIN materials_3 ON subject_student_relation.Material_id = materials_3.Material_id;
END

-- To execute the procedure
CALL student_info();


-- Create View teacher_info
CREATE VIEW teacher_info AS
SELECT teachers_3.Teachers_name, teachers_3.Office_number, materials_3.Material_name
FROM teachers_3
JOIN subject_teacher_relation ON teachers_3.Teachers_id = subject_teacher_relation.Teachers_id
JOIN materials_3 ON subject_teacher_relation.Material_id = materials_3.Material_id;

-- Delete View teacher_info
DROP VIEW IF EXISTS teacher_info;


-- Create Index for Student Names
CREATE INDEX idx_student_names ON students_3(Students_name);


-- Display Index Information
SHOW INDEX FROM students_3;

-- Delete Index for Student Names
DROP INDEX idx_student_names ON students_3;