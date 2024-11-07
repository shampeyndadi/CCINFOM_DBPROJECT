CREATE TABLE students (
	student_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    birth_date DATE,
    gender VARCHAR (1),
    address VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(11),
    program_id VARCHAR (11)
);

CREATE TABLE enrollments(
	enrollment_id INT (11) AUTO_INCREMENT PRIMARY KEY,
    student_id INT(11),
    course_id INT(10),
    class_id INT(11),
    enrollment_date DATE,
    status VARCHAR(15),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

CREATE TABLE prerequisites(
	course_id INT(10),
    prerequisite_id INT(10),
    PRIMARY KEY (course_id,prerequisite_id),
    FOREIGN KEY (course_id) REFERENCES courses (course_id),
    FOREIGN KEY (prerequisite_id) REFERENCES courses (course_id)
);

CREATE TABLE coursecapacity(
    course_id INT(10) PRIMARY KEY,
    current_enrollment INT(45) DEFAULT 0,
    max_capacity INT(45) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
