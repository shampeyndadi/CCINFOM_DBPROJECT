CREATE DATABASE dbapp;

USE dbapp;

CREATE TABLE Colleges (
    college_id INT NOT NULL,
    college_name VARCHAR(100) NOT NULL,
    CONSTRAINT colleges_pk PRIMARY KEY (college_id),
    CONSTRAINT college_name_unique UNIQUE (college_name)
);

INSERT INTO Colleges (college_id, college_name)
VALUES
    (1, 'Brother Andrew Gonzalez College of Education'),
    (2, 'College of Computer Studies'),
    (3, 'College of Law'),
    (4, 'College of Liberal Arts'),
    (5, 'College of Science'),
    (6, 'Gokongwei College of Engineering'),
    (7, 'Ramon V. Del Rosario College of Business'),
    (8, 'School of Economics');

CREATE TABLE Programs (
    program_id VARCHAR(20) NOT NULL,
    program_name VARCHAR(300) NOT NULL,
    college_id INT NOT NULL,
    CONSTRAINT programs_pk PRIMARY KEY (program_id),
    CONSTRAINT programs_fk_college FOREIGN KEY (college_id) REFERENCES Colleges(college_id)
);

INSERT INTO Programs (program_id, program_name, college_id)
VALUES
    ('CCS-ST', 'Bachelor of Science in Computer Science Major in Software Technology', 2),
    ('CCS-NIS', 'Bachelor of Science in Computer Science Major in Network and Information Security', 2),
    ('CCS-CSE', 'Bachelor of Science in Computer Science Major in Computer Systems Engineering', 2),
    ('CCS-IS', 'Bachelor of Science in Information Systems', 2),
    ('CCS-IT', 'Bachelor of Science in Information Technology', 2),
    ('CCS-GAD', 'Bachelor of Science in Interactive Entertainment Major in Game Art and Design', 2),
    ('CCS-GD', 'Bachelor of Science in Interactive Entertainment Major in Game Development', 2),
    ('CCS-MSCS', 'Bachelor of Science (Honors) in Computer Science and Master of Science in Computer Science', 2),
    ('GCOE-CHE', 'Chemical Engineering', 6),
    ('GCOE-CE', 'Civil Engineering', 6),
    ('GCOE-ECE', 'Electronics and Computer Engineering', 6),
    ('GCOE-IE', 'Industrial Engineering', 6),
    ('GCOE-MEM', 'Manufacturing Engineering and Management', 6),
    ('GCOE-ME', 'Mechanical Engineering', 6),
    ('COB-ACC', 'Bachelor of Science in Accountancy', 7),
    ('COB-ADV', 'Bachelor of Science in Advertising Management', 7),
    ('COB-ACM', 'Bachelor of Science in Applied Corporate Management', 7),
    ('COB-BM', 'Bachelor of Science in Business Management', 7),
    ('COB-ENT', 'Bachelor of Science in Entrepreneurship', 7),
    ('COB-IBS', 'Bachelor of Science in Interdisciplinary Business Studies', 7),
    ('COB-LM', 'Bachelor of Science in Legal Management', 7),
    ('COB-MFI', 'Bachelor of Science in Management of Financial Institutions', 7),
    ('COB-MM', 'Bachelor of Science in Marketing Management', 7),
    ('COB-MABA', 'Bachelor of Science in Management Accounting with Business Analytics', 7),
    ('COB-MA', 'Bachelor of Science in Management Accounting', 7),
	('COS-BIOCHEM', 'Bachelor of Science in Biochemistry', 5),
    ('COS-MBIO', 'BS in Biology major in Medical Biology', 5),
    ('COS-MOLBIO', 'BS in Biology major in Molecular Biology and Biotechnology', 5),
    ('COS-SYSBIO', 'BS in Biology major in Systematics and Ecology', 5),
    ('COS-CHEM', 'BS in Chemistry', 5),
    ('COS-CHEMFS', 'BS in Chemistry major in Food Science', 5),
    ('COS-CHEMBUS', 'BS in Chemistry minor in Business Studies', 5),
    ('COS-HUMBIO', 'BS in Human Biology', 5),
    ('COS-MATHBA', 'BS in Mathematics with specialization in Business Applications', 5),
    ('COS-MATHCA', 'BS in Mathematics with specialization in Computer Applications', 5),
    ('COS-STAT', 'BS in Statistics Major in Actuarial Science', 5),
    ('COS-PHYSECON', 'BS in Physics Minor in Economics', 5),
    ('COS-PHYSFIN', 'BS in Physics Minor in Finance', 5),
    ('COS-PHYSMAT', 'BS in Physics with specialization in Materials Science', 5),
    ('COS-PHYSMED', 'BS in Physics with specialization in Medical Instrumentation', 5),
    ('COS-PREMED', 'BS in Premed Physics', 5),
    ('COS-ANBIO', 'Bachelor of Science in Animal Biology', 5),
    ('CLA-BSHS-OSSD', 'Bachelor of Arts in Behavioral Sciences, Major in Organizational and Social Systems Development', 4),
    ('CLA-DS', 'Bachelor of Arts in Development Studies', 4),
    ('CLA-HIS', 'Bachelor of Arts in History', 4),
    ('CLA-SEA', 'Bachelor of Arts in Southeast Asian Studies', 4),
    ('CLA-IS-AMS', 'AB in International Studies, Major in American Studies', 4),
    ('CLA-IS-EUS', 'AB in International Studies, Major in European Studies', 4),
    ('CLA-IS-JPS', 'AB in International Studies, Major in Japanese Studies', 4),
    ('CLA-IS-CNS', 'AB in International Studies, Major in Chinese Studies', 4),
    ('CLA-LIT-CW', 'Bachelor of Arts in Literature Major in Creative Writing', 4),
    ('CLA-LIT-LC', 'Bachelor of Arts in Literature Major in Literary and Cultural Studies', 4),
    ('CLA-PHS', 'Bachelor of Arts in Philippine Studies, Major in Filipino in Mass Media', 4),
    ('CLA-PLS', 'Bachelor of Arts in Political Science', 4),
    ('CLA-CA', 'Bachelor of Arts in Communication Arts', 4),
    ('CLA-OC', 'Bachelor of Arts in Organizational Communication', 4),
    ('CLA-PHL', 'AB, Major in Philosophy', 4),
    ('CLA-PSY', 'Bachelor of Arts in Psychology', 4),
    ('CLA-BSPSY', 'Bachelor of Science in Psychology', 4),
    ('CLA-SOC', 'AB Sociology', 4),
    ('CLA-MA-BSHS-OSSD', 'Bachelor of Arts (Honors) and Master of Arts in Behavioral Sciences with Specialization in Organizational and Social Systems Development (Ladderized Program)', 4),
    ('SOE-BS-AEI', 'Bachelor of Science in Applied Economics major in Industrial Economics', 8),
    ('SOE-BS-AEF', 'Bachelor of Science in Applied Economics major in Financial Economics', 8),
    ('SOE-AB-ECM', 'Bachelor of Arts major in Economics', 8),
	('BAGCED-CEP', 'Counseling and Educational Psychology', 1),
    ('BAGCED-ELM', 'Educational Leadership and Management', 1),
    ('BAGCED-EAL', 'English and Applied Linguistics', 1),
    ('BAGCED-PE', 'Physical Education', 1),
    ('BAGCED-SE', 'Science Education', 1),
    ('BAGCED-OEP', 'Offshore and Extension Programs', 1),
    ('BAGCED-CIESOL', 'Center for Innovative Education Solutions (CIESOL)', 1);

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
    course_id VARCHAR(10) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    units INT(2) NOT NULL,
    college_id INT NOT NULL,
    CONSTRAINT courses_pk PRIMARY KEY (course_id),
    CONSTRAINT courses_fk_college FOREIGN KEY (college_id) REFERENCES Colleges(college_id)
);

-- Values for Computer Science -- 
INSERT INTO Courses (course_id, course_name, units, college_id)
VALUES
    ('BASMATH', 'Algebra and Trigonometry', 5, 2),
    ('BASSTAT', 'Algebra and Statistics', 3, 2),
    ('CCICOMP', 'Introduction to Computing', 3, 2),
    ('CCPROG1', 'Logic Formulation and Introductory Programming', 3, 2),
    ('CCPROG2', 'Programming with Structured Data Types', 3, 2),
    ('CCPROG3', 'Object-Oriented Programming', 3, 2),
    ('CCDSTRU', 'Discrete Structures', 3, 2),
    ('CCDSALG', 'Data Structures and Algorithms', 3, 2),
    ('CCINFOM', 'Information Management', 3, 2),
    ('CCAPDEV', 'Web Application Development', 3, 2),
    ('CCINOV8', 'Innovation and Technology Management', 3, 2),
    ('CSMATH1', 'Differential Calculus', 3, 2),
    ('CSMATH2', 'Linear Algebra for Computer Science', 3, 2),
    ('CSMODEL', 'Modelling and Simulation', 3, 2),
    ('CSADPRG', 'Advanced Programming Techniques', 3, 2),
    ('CSSWENG', 'Software Engineering', 3, 2),
    ('CSALGCM', 'Algorithms and Complexity', 3, 2),
    ('CSNETWK', 'Introduction to Computer Networks', 3, 2),
    ('CSARCH1', 'Introduction to Computer Organization and Architecture 1', 3, 2),
    ('CSARCH2', 'Introduction to Computer Organization and Architecture 2 (Lecture and Laboratory)', 4, 2),
    ('CSOPESY', 'Introduction to Operating Systems', 3, 2),
    ('CSINTSY', 'Introduction to Artificial Intelligence', 3, 2),
    ('CSSECDV', 'Secure Web Development', 3, 2),
    ('ST-MATH', 'Integral Calculus for Computer Science Students', 3, 2),
    ('STALGC', 'Advanced Algorithms and Complexities', 3, 2),
    ('MOBDEVE', 'Mobile Development', 3, 2),
    ('STSWENG', 'Advanced Software Engineering', 3, 2),
    ('STADVDB', 'Advanced Database Systems', 3, 2),
    ('STHCUIX', 'Human Computer Interactions', 3, 2),
    ('STINTSY', 'Advanced Intelligent Systems', 3, 2),
    ('STDISCM', 'Distributed Computing', 3, 2),
    ('STMETRE', 'Software Technology Research Methods', 3, 2),
    ('NSCOM01', 'Network Application Protocols', 3, 2),
    ('NSCOM02', 'Network Connectivity and Data Delivery', 3, 2),
    ('NSCOM03', 'Data Communications', 3, 2),
    ('NSSECU1', 'Introduction to Security', 3, 2),
    ('NSSECU2', 'Advanced and Offensive Security', 3, 2),
    ('NSSECU3', 'Defensive Security', 3, 2),
    ('NSETRON', 'Practical Electricity and Electronics', 3, 2),
    ('NSEMBED', 'Embedded Platform Development', 3, 2),
    ('NSAPDEV', 'Server Application Development', 3, 2),
    ('NSDSYST', 'Introduction to Distributed Systems', 3, 2),
    ('NSRESME', 'Network and Information Security Research Methods', 3, 2),
    ('CE-MATH', 'Mathematical Methods for Computer Systems Engineering', 3, 2),
    ('CEETRN1', 'Fundamentals of Electric Circuits', 4, 2),
    ('CEETRN2', 'Basic Principles of Electronic Circuits', 4, 2),
    ('CEETRN3', 'Linear Circuits and Communication', 4, 2),
    ('CEEDSGN', 'Advanced Topics in Electronic Circuits and Systems', 3, 2),
    ('CEDISP1', 'Digital Signal Processing 1', 4, 2),
    ('CEDISP2', 'Digital Signal Processing 2', 3, 2),
    ('CEMICRO', 'Microprocessor Interfacing', 4, 2),
    ('CECNTRL', 'Introduction to Microcontrollers', 3, 2),
    ('CEPARCO', 'Multiprocessing and Parallel Computing', 3, 2),
    ('CERESME', 'Computer Systems Engineering Research Methods', 3, 2),
    ('ITISORG', 'Organization and Management Concepts', 3, 2),
    ('ISBISPR', 'Organizations and Business Processes', 3, 2),
    ('ISFINMA', 'Financial and Managerial Accounting for IS', 3, 2),
    ('ISOPRES', 'Introduction to Operations Research', 3, 2),
    ('ISINFOM', 'Transaction Management & Descriptive Analytics', 3, 2),
    ('ITISHCI', 'Human-Computer Interaction', 3, 2),
    ('ISBUSPE', 'Business Performance', 3, 2),
    ('ITISDEV', 'Business Applications Development', 3, 2),
    ('ISANDE1', 'Systems Analysis', 3, 2),
    ('ISINFRA', 'Introduction to IT Infrastructures', 3, 2),
    ('ISANDE2', 'Systems Design & Development', 3, 2),
    ('ISSYSAD', 'Systems Administration', 3, 2),
    ('ISRESME', 'IS Research Methods', 3, 2),
    ('ITISSES', 'Special Enterprise Systems', 3, 2),
    ('ISSYSQA', 'Systems Quality Assurance', 3, 2),
    ('ISPRENL', 'Predictive Analytics', 3, 2),
    ('ISENTAR', 'Enterprise Architecture', 3, 2),
    ('ISSECUR', 'Information Security', 3, 2),
    ('ISSTRMA', 'IT Strategic Management', 3, 2),
    ('ITISPRJ', 'IT Project Management', 3, 2),
    ('ISTREND', 'Trends in Information Systems', 3, 2);

CREATE TABLE Classes (
    class_id INT NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    program_id VARCHAR(20),
    section VARCHAR (20),
    instructor_id INT,
    college_id INT NOT NULL,
    term VARCHAR(10),
    school_year YEAR,
    schedule DATETIME,
    room_number VARCHAR(20),
    max_capacity INT,
    CONSTRAINT classes_pk PRIMARY KEY (class_id),
    CONSTRAINT classes_fk_course FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    CONSTRAINT classes_fk_program FOREIGN KEY (program_id) REFERENCES Programs(program_id),
    CONSTRAINT classes_fk_instructor FOREIGN KEY (instructor_id) REFERENCES Instructor(inst_id),
    CONSTRAINT classes_fk_college FOREIGN KEY (college_id) REFERENCES Colleges(college_id)
);

CREATE TABLE Prerequisites (
    course_id VARCHAR(10) NOT NULL,
    prerequisite_id VARCHAR(10) NOT NULL,
    CONSTRAINT prerequisites_pk PRIMARY KEY (course_id, prerequisite_id),
    CONSTRAINT prerequisites_fk_course FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    CONSTRAINT prerequisites_fk_prerequisite FOREIGN KEY (prerequisite_id) REFERENCES Courses(course_id)
);

INSERT INTO Prerequisites (course_id, prerequisite_id)
VALUES
    ('CCPROG2', 'CCPROG1'),    -- CCPROG2 requires CCPROG1
    ('CCPROG3', 'CCPROG2'),    -- CCPROG3 requires CCPROG2
    ('CCDSTRU', 'CCPROG1'),    -- CCDSTRU requires CCPROG1
    ('CCDSALG', 'CCDSTRU'),    -- CCDSALG requires CCDSTRU
    ('CSADPRG', 'CCPROG3'),    -- CSADPRG requires CCPROG3
    ('CSALGCM', 'CCDSALG'),    -- CSALGCM requires CCDSALG
    ('CSARCH1', 'CCPROG3'),    -- CSARCH1 requires CCPROG3
    ('CSARCH2', 'CSARCH1'),    -- CSARCH2 requires CSARCH1
    ('CSOPESY', 'CCPROG3'),    -- CSOPESY requires CCPROG3
    ('CSINTSY', 'CCDSALG'),    -- CSINTSY requires CCDSALG
    ('CSINTSY', 'CCDSTRU'),    -- CSINTSY requires CCDSTRU
    ('CCAPDEV', 'CCPROG3'),    -- CCAPDEV requires CCPROG3
    ('CCAPDEV', 'CCINFOM'),    -- CCAPDEV requires CCINFOM
    ('CSSWENG', 'CCAPDEV'),    -- CSSWENG requires CCAPDEV
    ('STADVDB', 'CCINFOM'),    -- STADVDB requires CCINFOM
    ('STALGC', 'CSALGCM'),     -- STALGC requires CSALGCM
    ('STHCUIX', 'CSSWENG'),    -- STHCUIX requires CSSWENG
    ('STINTSY', 'CSINTSY'),    -- STINTSY requires CSINTSY
    ('STDISCM', 'CSOPESY'),    -- STDISCM requires CSOPESY
    ('STMETRE', 'STALGC');   -- STMETRE requires STALGC

CREATE TABLE Students (
    student_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date VARCHAR(15),
    gender CHAR(1),
    address VARCHAR(100),
    email VARCHAR(50) UNIQUE,
    program_id VARCHAR(20),
    account_password VARCHAR(20),
    CONSTRAINT students_pk PRIMARY KEY (student_id),
    CONSTRAINT students_fk_program FOREIGN KEY (program_id) REFERENCES Programs(program_id)
);

CREATE TABLE CompletedCourses (
    student_id INT NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    completion_date DATE,
    grade DECIMAL(4, 2),
    status VARCHAR(20) CHECK (status IN ('Completed', 'In Progress', 'Failed')),
    CONSTRAINT completedCourses_pk PRIMARY KEY (student_id, course_id),
    CONSTRAINT completedCourses_fk_student FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT completedCourses_fk_course FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

ALTER TABLE CompletedCourses
MODIFY status VARCHAR(20) CHECK (status IN ('Completed', 'In Progress', 'Failed'));

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT,
    student_id INT NOT NULL,
    class_id INT NOT NULL,
    enrollment_date DATE DEFAULT (CURDATE()),
    CONSTRAINT enrollments_pk PRIMARY KEY (enrollment_id),
    CONSTRAINT enrollments_fk_student FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT enrollments_fk_class FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- Classes for CCPROG1 (Instructor: 100000196 - Lara Scott)
INSERT INTO Classes (class_id, course_id, program_id, section, instructor_id, college_id, term, school_year, schedule, room_number, max_capacity)
VALUES
    (1001, 'CCPROG1', 'CCS-ST', 'S1', 100000196, 2, '1st Term', 2024, '2024-09-04 08:00:00', 'G201', 30),
    (1002, 'CCPROG1', 'CCS-ST', 'S2', 100000197, 2, '1st Term', 2024, '2024-09-05 10:00:00', 'G202', 30),
    (1003, 'CCPROG1', 'CCS-ST', 'S3', 100000198, 2, '1st Term', 2024, '2024-09-06 14:00:00', 'G203', 30),
    (1004, 'CCPROG1', 'CCS-ST', 'S4', 100000199, 2, '1st Term', 2024, '2024-09-07 08:00:00', 'G204', 30),
    (1006, 'CCPROG1', 'CCS-ST', 'S5', 100000200, 2, '1st Term', 2024, '2024-09-08 10:00:00', 'G205', 30),
    (1007, 'CCPROG1', 'CCS-ST', 'S6', 100000200, 2, '1st Term', 2024, '2024-09-08 14:00:00', 'G206', 30),
    (1008, 'CCPROG1', 'CCS-ST', 'S7', 100000200, 2, '1st Term', 2024, '2024-09-08 10:00:00', 'G207', 30),
    (1009, 'CCPROG1', 'CCS-ST', 'S8', 100000200, 2, '1st Term', 2024, '2024-09-08 14:00:00', 'G208', 30);

-- Classes for CCPROG2 (Instructor: 100000201 - Liam Lee)
INSERT INTO Classes (class_id, course_id, program_id, section, instructor_id, college_id, term, school_year, schedule, room_number, max_capacity)
VALUES
    (2001, 'CCPROG2', 'CCS-ST', 'S1', 100000201, 2, '1st Term', 2024, '2024-09-10 08:00:00', 'G206', 30),
    (2002, 'CCPROG2', 'CCS-ST', 'S1', 100000202, 2, '1st Term', 2024, '2024-09-11 10:00:00', 'G207', 30),
    (2003, 'CCPROG2', 'CCS-ST', 'S1', 100000203, 2, '1st Term', 2024, '2024-09-12 14:00:00', 'G208', 30),
    (2004, 'CCPROG2', 'CCS-ST', 'S2', 100000204, 2, '1st Term', 2024, '2024-09-13 08:00:00', 'G209', 30),
    (2005, 'CCPROG2', 'CCS-ST', 'S2', 100000205, 2, '1st Term', 2024, '2024-09-14 10:00:00', 'G210', 30);

-- Classes for CCPROG3 (Instructor: 100000206 - Emily Cook)
INSERT INTO Classes (class_id, course_id, program_id, section, instructor_id, college_id, term, school_year, schedule, room_number, max_capacity)
VALUES
    (3001, 'CCPROG3', 'CCS-ST', 'S1', 100000206, 2, '2nd Term', 2024, '2024-11-10 09:00:00', 'G301', 25),
    (3002, 'CCPROG3', 'CCS-ST', 'S1', 100000207, 2, '2nd Term', 2024, '2024-11-11 11:00:00', 'G302', 25),
    (3003, 'CCPROG3', 'CCS-ST', 'S1', 100000208, 2, '2nd Term', 2024, '2024-11-12 13:00:00', 'G303', 25),
    (3004, 'CCPROG3', 'CCS-ST', 'S2', 100000209, 2, '2nd Term', 2024, '2024-11-13 09:00:00', 'G304', 25),
    (3005, 'CCPROG3', 'CCS-ST', 'S2', 100000210, 2, '2nd Term', 2024, '2024-11-14 11:00:00', 'G305', 25);







    
