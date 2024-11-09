USE dbapp;

CREATE TABLE Colleges (
    college_id INT NOT NULL,
    college_name VARCHAR(50) NOT NULL,
    CONSTRAINT colleges_pk PRIMARY KEY (college_id),
    CONSTRAINT college_name_unique UNIQUE (college_name)
);

CREATE TABLE Programs (
    program_id VARCHAR(20) NOT NULL,
    program_name VARCHAR(100) NOT NULL,
    college_id INT NOT NULL,
    CONSTRAINT programs_pk PRIMARY KEY (program_id),
    CONSTRAINT programs_fk_college FOREIGN KEY (college_id) REFERENCES Colleges(college_id)
);

CREATE TABLE Instructor (
    inst_id INT NOT NULL,
    inst_first_name VARCHAR(50) NOT NULL,
    inst_last_name VARCHAR(50) NOT NULL,
    college_id INT NOT NULL,
    contact_no VARCHAR(15),
    inst_email VARCHAR(50) UNIQUE,
    CONSTRAINT instructor_pk PRIMARY KEY (inst_id),
    CONSTRAINT instructor_fk_college FOREIGN KEY (college_id) REFERENCES Colleges(college_id)
);

CREATE TABLE Courses (
    course_id INT NOT NULL,
    course_name VARCHAR(50) NOT NULL,
    units INT(2) NOT NULL,
    instructor_id INT,
    prerequisite_id INT,
    CONSTRAINT courses_pk PRIMARY KEY (course_id),
    CONSTRAINT courses_fk_instructor FOREIGN KEY (instructor_id) REFERENCES Instructor(inst_id),
    CONSTRAINT courses_fk_prerequisite FOREIGN KEY (prerequisite_id) REFERENCES Courses(course_id)
);

CREATE TABLE Classes (
    class_id INT NOT NULL,
    course_id INT NOT NULL,
    program_id VARCHAR(20),
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

CREATE TABLE Prerequisites (
    course_id INT NOT NULL,
    prerequisite_id INT NOT NULL,
    CONSTRAINT prerequisites_pk PRIMARY KEY (course_id, prerequisite_id),
    CONSTRAINT prerequisites_fk_course FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    CONSTRAINT prerequisites_fk_prerequisite FOREIGN KEY (prerequisite_id) REFERENCES Courses(course_id)
);

CREATE TABLE Students (
    student_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    gender CHAR(1),
    address VARCHAR(100),
    email VARCHAR(50) UNIQUE,
    program_id VARCHAR(20),
    CONSTRAINT students_pk PRIMARY KEY (student_id),
    CONSTRAINT students_fk_program FOREIGN KEY (program_id) REFERENCES Programs(program_id)
);