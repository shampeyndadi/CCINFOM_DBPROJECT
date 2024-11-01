CREATE TABLE Instructor (
    inst_id INT(11) PRIMARY KEY,
    inst_first_name VARCHAR(50) NOT NULL,
    inst_last_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(20),
    contact_no INT(11),
    inst_email VARCHAR(20),
    course_ID INT(11),
    office_hours VARCHAR(100),
    hire_date DATE,
    employment_status VARCHAR(20),
    salary DECIMAL(10,2),
    FOREIGN KEY (course_ID) REFERENCES Course(course_ID)
);

INSERT INTO Instructor (
    inst_id,
    inst_first_name,
    inst_last_name,
    department_name,
    contact_no,
    inst_email,
    course_ID,
    office_hours,
    hire_date,
    employment_status,
    salary
) VALUES
    (12100000001, 'Juan', 'Dela Cruz', 'Computer Science', 09171234567, 'juan.delacruz@example.com', 101, 'MWF 10:00-11:30', '2021-08-15', 'Full-Time', 75000.00),
    (12200000002, 'Maria', 'Santos', 'Mathematics', 09171234568, 'maria.santos@example.com', 102, 'TTh 12:00-14:00', '2020-09-01', 'Part-Time', 50000.00),
    (12300000003, 'Jose', 'Reyes', 'Physics', 09171234569, 'jose.reyes@example.com', 103, 'MWF 14:00-15:30', '2019-07-22', 'Full-Time', 82000.00),
    (12400000004, 'Ana', 'Garcia', 'Chemistry', 09171234570, 'ana.garcia@example.com', 104, 'TTh 09:00-11:00', '2018-05-10', 'Adjunct', 30000.00),
    (12100000005, 'Ramon', 'Flores', 'Biology', 09171234571, 'ramon.flores@example.com', 105, 'MWF 08:00-09:30', '2022-01-12', 'Full-Time', 68000.00);
