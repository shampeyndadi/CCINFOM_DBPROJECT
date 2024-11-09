USE dbapp;

CREATE TABLE Programs (
    program_id VARCHAR(100) NOT NULL,
    program_name VARCHAR(100) NOT NULL,
    department_name VARCHAR(50),
    degree_level VARCHAR(20),
    total_units INT,
    CONSTRAINT programs_pk PRIMARY KEY (program_id)
);

ALTER TABLE programs
DROP COLUMN degree_level,
DROP COLUMN total_units;

ALTER TABLE programs 
MODIFY COLUMN program_id VARCHAR (20);

SELECT * FROM programs; 

INSERT INTO Programs (program_id, program_name, department_name) 
VALUES ("CCS-ST", "Software Technology", "College of Computer Studies"),
		("CCS-CSE", "Systems Engineering", "College of Computer Studies"), 
        ("CCS-NIS", "Network Information Systems", "College of Computer Studies");

CREATE TABLE Instructor (
    inst_id INT NOT NULL,
    inst_first_name VARCHAR(50) NOT NULL,
    inst_last_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(20),
    contact_no VARCHAR(15),
    inst_email VARCHAR(50) UNIQUE,
    office_hours VARCHAR(100),
    hire_date DATE,
    employment_status VARCHAR(20),
    salary DECIMAL(10,2),
    CONSTRAINT instructor_pk PRIMARY KEY (inst_id)
);

CREATE TABLE Courses (
    course_id INT(10) NOT NULL,
    course_name VARCHAR(50) NOT NULL,
    units INT(2) NOT NULL,
    instructor_id INT,
    schedule DATETIME,
    class_id INT,
    CONSTRAINT courses_pk PRIMARY KEY (course_id),
    CONSTRAINT courses_fk_instructor FOREIGN KEY (instructor_id) REFERENCES Instructor(inst_id)
);

CREATE TABLE Classes (
    class_id INT NOT NULL,
    course_id INT NOT NULL,
    program_id VARCHAR(6),
    instructor_id INT,
    term VARCHAR(10),
    school_year YEAR,
    schedule DATETIME,
    room_number VARCHAR(20),
    max_capacity INT,
    CONSTRAINT classes_pk PRIMARY KEY (class_id),
    CONSTRAINT classes_fk_course FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    CONSTRAINT classes_fk_program FOREIGN KEY (program_id) REFERENCES Programs(program_id),
    CONSTRAINT classes_fk_instructor FOREIGN KEY (instructor_id) REFERENCES Instructor(inst_id)
);

ALTER TABLE Courses
ADD COLUMN prerequisite_id INT,
ADD CONSTRAINT courses_fk_prerequisite FOREIGN KEY (prerequisite_id) REFERENCES Courses(course_id);

CREATE TABLE Prerequisites (
    course_id INT(10),
    prerequisite_id INT(10),
    CONSTRAINT prerequisites_pk PRIMARY KEY (course_id, prerequisite_id),
    CONSTRAINT prerequisites_fk_course FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    CONSTRAINT prerequisites_fk_prerequisite FOREIGN KEY (prerequisite_id) REFERENCES Courses(course_id)
);

CREATE TABLE Students (
    student_id INT(11) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    gender CHAR(1),
    address VARCHAR(50),
    email VARCHAR(50),
    program_id VARCHAR(6),
    CONSTRAINT students_pk PRIMARY KEY (student_id),
    CONSTRAINT students_fk_program FOREIGN KEY (program_id) REFERENCES Programs(program_id)
);

ALTER TABLE students 
MODIFY birth_date VARCHAR(50);
