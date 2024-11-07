USE ccinfom_database_app;

CREATE TABLE Programs (
    program_id INT PRIMARY KEY,
    program_name VARCHAR(100) NOT NULL,
    department_name VARCHAR(50),
    degree_level VARCHAR(20),
    total_units INT
);

CREATE TABLE Instructor (
    inst_id INT PRIMARY KEY,
    inst_first_name VARCHAR(50) NOT NULL,
    inst_last_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(20),
    contact_no VARCHAR(15),
    inst_email VARCHAR(50) UNIQUE,
    office_hours VARCHAR(100),
    hire_date DATE,
    employment_status VARCHAR(20),
    salary DECIMAL(10,2)
);

CREATE TABLE Courses(
    course_id INT(10) PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    units INT(2) NOT NULL,
    instructor_id INT,
    schedule DATETIME,
    class_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(inst_id)
);

CREATE TABLE Classes (
    class_id INT PRIMARY KEY,
    course_id INT NOT NULL,
    program_id INT,
    instructor_id INT,
    term VARCHAR(10), 
    school_year YEAR,
    schedule DATETIME,
    room_number VARCHAR(20),
    max_capacity INT,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (program_id) REFERENCES Programs(program_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructor(inst_id)
);

ALTER TABLE Courses
ADD COLUMN prerequisite_id INT,
ADD FOREIGN KEY (prerequisite_id) REFERENCES Courses(course_id);

CREATE TABLE Prerequisites (
    course_id INT(10),
    prerequisite_id INT(10),
    PRIMARY KEY (course_id, prerequisite_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (prerequisite_id) REFERENCES Courses(course_id)
);

CREATE TABLE Students (
    student_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    birth_date DATE,
    gender VARCHAR (1),
    address VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(15),
    program_id INT,
    FOREIGN KEY (program_id) REFERENCES Programs(program_id)
);
