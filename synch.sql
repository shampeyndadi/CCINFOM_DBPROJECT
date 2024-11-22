DROP DATABASE dbapp;

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
    inst_password VARCHAR(50) UNIQUE,
    CONSTRAINT instructor_pk PRIMARY KEY (inst_id),
    CONSTRAINT instructor_fk_college FOREIGN KEY (college_id) REFERENCES Colleges(college_id)
);

CREATE TABLE Courses (
    course_id VARCHAR(10) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    units INT(2) NOT NULL,
    college_id INT NOT NULL,
    program_id VARCHAR(20) DEFAULT NULL, 
    CONSTRAINT courses_pk PRIMARY KEY (course_id),
    CONSTRAINT courses_fk_college FOREIGN KEY (college_id) REFERENCES Colleges(college_id),
    CONSTRAINT courses_fk_program FOREIGN KEY (program_id) REFERENCES Programs(program_id)
);

-- Inserting values into Courses table based on the prefix logic
INSERT INTO Courses (course_id, course_name, units, college_id, program_id)
VALUES
    -- General Courses (CC and CS) with NULL program_id
    ('BASMATH', 'Algebra and Trigonometry', 5, 2, NULL),
    ('BASSTAT', 'Algebra and Statistics', 3, 2, NULL),
    ('CCICOMP', 'Introduction to Computing', 3, 2, NULL),
    ('CCPROG1', 'Logic Formulation and Introductory Programming', 3, 2, NULL),
    ('CCPROG2', 'Programming with Structured Data Types', 3, 2, NULL),
    ('CCPROG3', 'Object-Oriented Programming', 3, 2, NULL),
    ('CCDSTRU', 'Discrete Structures', 3, 2, NULL),
    ('CCDSALG', 'Data Structures and Algorithms', 3, 2, NULL),
    ('CCINFOM', 'Information Management', 3, 2, NULL),
    ('CCAPDEV', 'Web Application Development', 3, 2, NULL),
    ('CCINOV8', 'Innovation and Technology Management', 3, 2, NULL),
    ('CSMATH1', 'Differential Calculus', 3, 2, NULL),
    ('CSMATH2', 'Linear Algebra for Computer Science', 3, 2, NULL),
    ('CSMODEL', 'Modelling and Simulation', 3, 2, NULL),
    ('CSADPRG', 'Advanced Programming Techniques', 3, 2, NULL),
    ('CSSWENG', 'Software Engineering', 3, 2, NULL),
    ('CSALGCM', 'Algorithms and Complexity', 3, 2, NULL),
    ('CSNETWK', 'Introduction to Computer Networks', 3, 2, NULL),
    ('CSARCH1', 'Introduction to Computer Organization and Architecture 1', 3, 2, NULL),
    ('CSARCH2', 'Introduction to Computer Organization and Architecture 2 (Lecture and Laboratory)', 4, 2, NULL),
    ('CSOPESY', 'Introduction to Operating Systems', 3, 2, NULL),
    ('CSINTSY', 'Introduction to Artificial Intelligence', 3, 2, NULL),
    ('CSSECDV', 'Secure Web Development', 3, 2, NULL),

    -- Software Technology (ST)
    ('ST-MATH', 'Integral Calculus for Computer Science Students', 3, 2, 'CCS-ST'),
    ('STALGC', 'Advanced Algorithms and Complexities', 3, 2, 'CCS-ST'),
    ('MOBDEVE', 'Mobile Development', 3, 2, 'CCS-ST'),
    ('STSWENG', 'Advanced Software Engineering', 3, 2, 'CCS-ST'),
    ('STADVDB', 'Advanced Database Systems', 3, 2, 'CCS-ST'),
    ('STHCUIX', 'Human Computer Interactions', 3, 2, 'CCS-ST'),
    ('STINTSY', 'Advanced Intelligent Systems', 3, 2, 'CCS-ST'),
    ('STDISCM', 'Distributed Computing', 3, 2, 'CCS-ST'),
    ('STMETRE', 'Software Technology Research Methods', 3, 2, 'CCS-ST'),

    -- Network and Information Security (NS)
    ('NSCOM01', 'Network Application Protocols', 3, 2, 'CCS-NIS'),
    ('NSCOM02', 'Network Connectivity and Data Delivery', 3, 2, 'CCS-NIS'),
    ('NSCOM03', 'Data Communications', 3, 2, 'CCS-NIS'),
    ('NSSECU1', 'Introduction to Security', 3, 2, 'CCS-NIS'),
    ('NSSECU2', 'Advanced and Offensive Security', 3, 2, 'CCS-NIS'),
    ('NSSECU3', 'Defensive Security', 3, 2, 'CCS-NIS'),
    ('NSETRON', 'Practical Electricity and Electronics', 3, 2, 'CCS-NIS'),
    ('NSEMBED', 'Embedded Platform Development', 3, 2, 'CCS-NIS'),
    ('NSAPDEV', 'Server Application Development', 3, 2, 'CCS-NIS'),
    ('NSDSYST', 'Introduction to Distributed Systems', 3, 2, 'CCS-NIS'),
    ('NSRESME', 'Network and Information Security Research Methods', 3, 2, 'CCS-NIS'),

    -- Computer Systems Engineering (CE)
    ('CE-MATH', 'Mathematical Methods for Computer Systems Engineering', 3, 2, 'CCS-CSE'),
    ('CEETRN1', 'Fundamentals of Electric Circuits', 4, 2, 'CCS-CSE'),
    ('CEETRN2', 'Basic Principles of Electronic Circuits', 4, 2, 'CCS-CSE'),
    ('CEETRN3', 'Linear Circuits and Communication', 4, 2, 'CCS-CSE'),
    ('CEEDSGN', 'Advanced Topics in Electronic Circuits and Systems', 3, 2, 'CCS-CSE'),
    ('CEDISP1', 'Digital Signal Processing 1', 4, 2, 'CCS-CSE'),
    ('CEDISP2', 'Digital Signal Processing 2', 3, 2, 'CCS-CSE'),
    ('CEMICRO', 'Microprocessor Interfacing', 4, 2, 'CCS-CSE'),
    ('CECNTRL', 'Introduction to Microcontrollers', 3, 2, 'CCS-CSE'),
    ('CEPARCO', 'Multiprocessing and Parallel Computing', 3, 2, 'CCS-CSE'),
    ('CERESME', 'Computer Systems Engineering Research Methods', 3, 2, 'CCS-CSE'),

    -- Information Technology (IT)
    ('ITISORG', 'Organization and Management Concepts', 3, 2, 'CCS-IT'),
    ('ITISHCI', 'Human-Computer Interaction', 3, 2, 'CCS-IT'),
    ('ITISDEV', 'Business Applications Development', 3, 2, 'CCS-IT'),
    ('ITISSES', 'Special Enterprise Systems', 3, 2, 'CCS-IT'),
    ('ITISPRJ', 'IT Project Management', 3, 2, 'CCS-IT'),
    ('ISTREND', 'Trends in Information Systems', 3, 2, 'CCS-IT'),

    -- Information Systems (IS)
    ('ISBISPR', 'Organizations and Business Processes', 3, 2, 'CCS-IS'),
    ('ISFINMA', 'Financial and Managerial Accounting for IS', 3, 2, 'CCS-IS'),
    ('ISOPRES', 'Introduction to Operations Research', 3, 2, 'CCS-IS'),
    ('ISINFOM', 'Transaction Management & Descriptive Analytics', 3, 2, 'CCS-IS'),
    ('ISBUSPE', 'Business Performance', 3, 2, 'CCS-IS'),
    ('ISANDE1', 'Systems Analysis', 3, 2, 'CCS-IS'),
    ('ISINFRA', 'Introduction to IT Infrastructures', 3, 2, 'CCS-IS'),
    ('ISANDE2', 'Systems Design & Development', 3, 2, 'CCS-IS'),
    ('ISSYSAD', 'Systems Administration', 3, 2, 'CCS-IS'),
    ('ISRESME', 'IS Research Methods', 3, 2, 'CCS-IS'),
    ('ISSYSQA', 'Systems Quality Assurance', 3, 2, 'CCS-IS'),
    ('ISPRENL', 'Predictive Analytics', 3, 2, 'CCS-IS'),
    ('ISENTAR', 'Enterprise Architecture', 3, 2, 'CCS-IS'),
    ('ISSECUR', 'Information Security', 3, 2, 'CCS-IS'),
    ('ISSTRMA', 'IT Strategic Management', 3, 2, 'CCS-IS');

CREATE TABLE Classes (
    class_id INT NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    program_id VARCHAR(20),
    instructor_id INT,
    college_id INT NOT NULL,
    room_number VARCHAR(20),
    max_capacity INT,
    CONSTRAINT classes_pk PRIMARY KEY (class_id),
    CONSTRAINT classes_fk_course FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    CONSTRAINT classes_fk_program FOREIGN KEY (program_id) REFERENCES Programs(program_id),
    CONSTRAINT classes_fk_instructor FOREIGN KEY (instructor_id) REFERENCES Instructor(inst_id),
    CONSTRAINT classes_fk_college FOREIGN KEY (college_id) REFERENCES Colleges(college_id)
);

CREATE TABLE Schedules (
    schedule_id INT AUTO_INCREMENT,
    class_id INT NOT NULL,
    instructor_id INT NOT NULL,
    scheduled_days VARCHAR(100) NOT NULL, 
    class_hours VARCHAR(100) NOT NULL,
    CONSTRAINT schedules_pk PRIMARY KEY (schedule_id),
    CONSTRAINT schedules_fk_class FOREIGN KEY (class_id) REFERENCES Classes(class_id),
    CONSTRAINT schedules_fk_instructor FOREIGN KEY (instructor_id) REFERENCES Instructor(inst_id)
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
    ('STALGC',  'CSALGCM'),     -- STALGC requires CSALGCM
    ('STHCUIX', 'CSSWENG'),    -- STHCUIX requires CSSWENG
    ('STINTSY', 'CSINTSY'),    -- STINTSY requires CSINTSY
    ('STDISCM', 'CSOPESY'),    -- STDISCM requires CSOPESY
    ('STMETRE', 'STALGC');   -- STMETRE requires STALGC

CREATE TABLE Students (
    student_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date VARCHAR(50),
    gender CHAR(1),
    address VARCHAR(100),
    email VARCHAR(50) UNIQUE,
    program_id VARCHAR(20),
    phone_number VARCHAR(20) UNIQUE,
    account_password VARCHAR(20) NOT NULL,
    CONSTRAINT students_pk PRIMARY KEY (student_id),
    CONSTRAINT students_fk_program FOREIGN KEY (program_id) REFERENCES Programs(program_id)
);

CREATE TABLE AcademicHistory (
    academic_history_id VARCHAR(50),
    student_id INT NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    status VARCHAR(20) CHECK (status IN ('Completed', 'In Progress', 'Failed', 'Dropped', 'Incomplete')),
    term VARCHAR(15) CHECK (term IN ('First Term', 'Second Term', 'Third Term')),
    school_year VARCHAR(10) NOT NULL,
    PRIMARY KEY (academic_history_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Grades (
    grade_id INT AUTO_INCREMENT,
    academic_history_id VARCHAR(50), -- Link to AcademicHistory table
    grade DECIMAL(2, 1) CHECK (grade IN (0.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0)),
    is_locked BOOLEAN DEFAULT FALSE, -- Column to lock grades after submission
    PRIMARY KEY (grade_id),
    FOREIGN KEY (academic_history_id) REFERENCES AcademicHistory(academic_history_id)
);

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT,
    student_id INT NOT NULL,
    class_id INT NOT NULL,
    enrollment_date DATE DEFAULT (CURDATE()),
    CONSTRAINT enrollments_pk PRIMARY KEY (enrollment_id),
    CONSTRAINT enrollments_fk_student FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT enrollments_fk_class FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

CREATE TABLE SystemSettings (
    setting_name VARCHAR(50) PRIMARY KEY,
    setting_value VARCHAR(50) NOT NULL
);

INSERT INTO SystemSettings (setting_name, setting_value) VALUES ('current_school_year', '2023-2024');
INSERT INTO SystemSettings (setting_name, setting_value) VALUES ('current_term', 'First Term');


INSERT INTO Instructor (inst_id, inst_first_name, inst_last_name, college_id, contact_no, inst_email, inst_password)
VALUES
    (100000001, 'Liam', 'Everett', 8, '09171230567', 'liam_everett@dlsu.edu.ph', '1UDxXW'),
    (100000002, 'Amelia', 'Foster', 8, '09171233567', 'amelia_foster@dlsu.edu.ph', 'j90pTA'),
    (100000003, 'Ethan', 'Harrison', 8, '09137545765', 'ethan_harrison@dlsu.edu.ph', 'ARxeDG'),
    (100000004, 'Olivia', 'Coleman', 8, '09191236567', 'olivia_coleman@dlsu.edu.ph', '3jcYd1'),
    (100000005, 'Mason', 'Green', 8, '09156845765', 'mason_green@dlsu.edu.ph', 'j9Mlc5'),
    (100000006, 'Ava', 'Nui', 8, '09173234567', 'ava_nui@dlsu.edu.ph', 'ojKxUa'),
    (100000007, 'Noah', 'Carter', 8, '09137812365', 'noah_carter@dlsu.edu.ph', 'UncEVW'),
    (100000008, 'Sophia', 'Anderson', 8, '09171934567', 'sophia_anderson@dlsu.edu.ph', 'lyquhy'),
    (100000009, 'Lucas', 'Brooks', 8, '09132345765', 'lucas_brooks@dlsu.edu.ph', 'kgYeGo'),
    (100000010, 'Isabella', 'Price', 8, '09171238567', 'isabella_price@dlsu.edu.ph', 'b01mly'),
    (100000011, 'Elijah', 'Rivera', 8, '09137845765', 'elijah_rivera@dlsu.edu.ph', 'pTexJc'),
    (100000012, 'Mia', 'Perry', 8, '09171234887', 'mia_perry@dlsu.edu.ph', 'p2Ms75'),
    (100000013, 'Benjamin', 'Bennett', 8, '09158475765', 'benjamin_bennett@dlsu.edu.ph', 'VnEizH'),
    (100000014, 'Ella', 'Cooper', 8, '09171232567', 'ella_cooper@dlsu.edu.ph', 'TV5CYA'),
    (100000015, 'James', 'Young', 8, '09136745765', 'james_young@dlsu.edu.ph', 'dVxWTZ'),
    (100000016, 'Scarlett', 'Wright', 8, '09171235467', 'scarlett_wright@dlsu.edu.ph', '0xYj60'),
    (100000017, 'Henry', 'Morgan', 8, '09123456789', 'henry_morgan@dlsu.edu.ph', 'IGDpHD'),
    (100000018, 'Grace', 'Bailey', 8, '09134567890', 'grace_bailey@dlsu.edu.ph', 'it7B39'),
    (100000019, 'Alexander', 'Scott', 8, '09145678901', 'alexander_scott@dlsu.edu.ph', 'xjP7tz'),
    (100000020, 'Charlotte', 'Rogers', 8, '09156789012', 'charlotte_rogers@dlsu.edu.ph', 'U1UGqC'),
    (100000021, 'Matthew', 'Long', 8, '09167890123', 'matthew_long@dlsu.edu.ph', 'Z102IN'),
    (100000022, 'Sofia', 'Lee', 8, '09178901234', 'sofia_lee@dlsu.edu.ph', 'x5ngtb'),
    (100000023, 'Jack', 'King', 8, '09189012345', 'jack_king@dlsu.edu.ph', 'cEnnDw'),
    (100000024, 'Emma', 'Flores', 8, '09190123456', 'emma_flores@dlsu.edu.ph', 'm6p0nz'),
    (100000025, 'Daniel', 'Kelly', 8, '09201234567', 'daniel_kelly@dlsu.edu.ph', 'qTwQrx'),
    (100000026, 'Lily', 'Sanders', 8, '09212345678', 'lily_sanders@dlsu.edu.ph', 'H9FmrF'),
    (100000027, 'David', 'Gray', 8, '09223456789', 'david_gray@dlsu.edu.ph', 'yLo66b'),
    (100000028, 'Hannah', 'Ross', 8, '09234567890', 'hannah_ross@dlsu.edu.ph', 'BLY3at'),
    (100000029, 'Logan', 'Collins', 8, '09245678901', 'logan_collins@dlsu.edu.ph', '9WXoqM'),
    (100000030, 'Chloe', 'Patterson', 8, '09256789012', 'chloe_patterson@dlsu.edu.ph', 'lNVxKX'),
    (100000031, 'Nathan', 'James', 8, '09171241568', 'nathan_james@dlsu.edu.ph', 'JR30kx'),
    (100000032, 'Aria', 'Myers', 8, '09171234569', 'aria_myers@dlsu.edu.ph', 'X6LjaI'),
    (100000033, 'Samuel', 'Bryant', 8, '09171234570', 'samuel_bryant@dlsu.edu.ph', 'BQBQO4'),
    (100000034, 'Zoe', 'Barnes', 8, '09171234571', 'zoe_barnes@dlsu.edu.ph', 'VwtKBN'),
    (100000035, 'Joshua', 'Simmons', 8, '09168234572', 'joshua_simmons@dlsu.edu.ph', 'YQRsNS'),
    (100000036, 'Leah', 'Jenkins', 8, '09171345573', 'leah_jenkins@dlsu.edu.ph', 'QUK44n'),
    (100000037, 'Christian', 'Mitchell', 8, '09167874574', 'christian_mitchell@dlsu.edu.ph', 'DsZhG8'),
    (100000038, 'Mila', 'Hughes', 8, '09141234575', 'mila_hughes@dlsu.edu.ph', 'zWTMlT'),
    (100000039, 'Isaac', 'Phillips', 8, '0917132176', 'isaac_phillips@dlsu.edu.ph', 'e2k1y7'),
    (100000040, 'Avery', 'Howard', 8, '09161234577', 'avery_howard@dlsu.edu.ph', 'I2oF7M'),
    (100000041, 'Ryan', 'Ward', 8, '09171234578', 'ryan_ward@dlsu.edu.ph', 'LBEr30'),
    (100000042, 'Madison', 'Cook', 8, '09171334579', 'madison_cook@dlsu.edu.ph', 'kqkISo'),
    (100000043, 'Caleb', 'Bell', 8, '09121234580', 'caleb_bell@dlsu.edu.ph', 'm5bb1S'),
    (100000044, 'Oliver', 'Bishop', 7, '09171234561', 'oliver_bishop@dlsu.edu.ph', 'l9Jyym'),
    (100000045, 'Emma', 'Shaw', 7, '09171774582', 'emma_shaw@dlsu.edu.ph', 'Zt0geP'),
    (100000046, 'James', 'Lloyd', 7, '09171234583', 'james_lloyd@dlsu.edu.ph', 'wAhtA3'),
    (100000047, 'Lily', 'Chapman', 7, '09171324584', 'lily_chapman@dlsu.edu.ph', 'YG5LpP'),
    (100000048, 'Daniel', 'Hunt', 7, '09171234685', 'daniel_hunt@dlsu.edu.ph', 'X8ftMs'),
    (100000049, 'Chloe', 'Knight', 7, '09179994586', 'chloe_knight@dlsu.edu.ph', 'Uzuk6f'),
    (100000050, 'Matthew', 'Woods', 7, '09178884587', 'matthew_woods@dlsu.edu.ph', 'ThZrKK'),
    (100000051, 'Ella', 'Watts', 7, '09171234588', 'ella_watts@dlsu.edu.ph', 'eqgYNk'),
    (100000052, 'Sebastian', 'Fisher', 7, '09174444589', 'sebastian_fisher@dlsu.edu.ph', 'f2EFSH'),
    (100000053, 'Avery', 'Riley', 7, '09171234590', 'avery_riley@dlsu.edu.ph', 'WXxKsY'),
    (100000054, 'Joseph', 'Dixon', 7, '09171200091', 'joseph_dixon@dlsu.edu.ph', 'HFBjZ8'),
    (100000055, 'Luna', 'Webb', 7, '09171234592', 'luna_webb@dlsu.edu.ph', '06qAPu'),
    (100000056, 'David', 'Burke', 7, '09133334593', 'david_burke@dlsu.edu.ph', 'c04njp'),
    (100000057, 'Harper', 'Bater', 7, '09175654594', 'harper_bater@dlsu.edu.ph', 'gJvGdX'),
    (100000058, 'Jacob', 'Rhodes', 7, '09171979795', 'jacob_rhodes@dlsu.edu.ph', 'Zqr5CV'),
    (100000059, 'Maya', 'Douglas', 7, '09171278996', 'maya_douglas@dlsu.edu.ph', 'DZqw1t'),
    (100000060, 'Andrew', 'Steele', 7, '09171234597', 'andrew_steele@dlsu.edu.ph', 'SWpx3A'),
    (100000061, 'Layla', 'Morris', 7, '09171277777', 'layla_morris@dlsu.edu.ph', 'jCrVTv'),
    (100000062, 'Luke', 'Grant', 7, '09137845769', 'luke_grant@dlsu.edu.ph', 'D6ElPn'),
    (100000063, 'Zoe', 'Harvey', 7, '09171234579', 'zoe_harvey@dlsu.edu.ph', 'ujTxP4'),
    (100000064, 'Nathan', 'Cole', 7, '09137845771', 'nathan_cole@dlsu.edu.ph', '2H7hxM'),
    (100000065, 'Elena', 'Reid', 7, '09171278772', 'elena_reid@dlsu.edu.ph', 'V43Gv4'),
    (100000066, 'Joshua', 'Turner', 7, '09138845773', 'joshua_turner@dlsu.edu.ph', 'TGmH8G'),
    (100000067, 'Isla', 'Jenkins', 7, '09171230074', 'isla_jenkins@dlsu.edu.ph', '2Ckzm8'),
    (100000068, 'Eli', 'Lane', 7, '09137777775', 'eli_lane@dlsu.edu.ph', 'YylAAP'),
    (100000069, 'Lydia', 'Gardner', 7, '09165767576', 'lydia_gardner@dlsu.edu.ph', 'jIEGC5'),
    (100000070, 'Grayson', 'Reeves', 7, '09137898977', 'grayson_reeves@dlsu.edu.ph', 'l1cfJz'),
    (100000071, 'Scarlett', 'Stone', 7, '09171934578', 'scarlett_stone@dlsu.edu.ph', 'S13v2y'),
    (100000072, 'Aaron', 'Fox', 7, '09137989779', 'aaron_fox@dlsu.edu.ph', 'J9j7mX'),
    (100000073, 'Paisley', 'Moss', 7, '09131145780', 'paisley_moss@dlsu.edu.ph', '3JxJRe'),
    (100000074, 'Cole', 'Owens', 7, '09137842581', 'cole_owens@dlsu.edu.ph', 'GK3qij'),
    (100000075, 'Leo', 'Reed', 6, '09137849682', 'leo_reed@dlsu.edu.ph', '9PyULQ'),
    (100000076, 'Hannah', 'Bell', 6, '09171333583', 'hannah_bell@dlsu.edu.ph', '7Opej7'),
    (100000077, 'Oscar', 'Fleming', 6, '09137555784', 'oscar_fleming@dlsu.edu.ph', 'ESbiGL'),
    (100000078, 'Sophia', 'Drake', 6, '09171236665', 'sophia_drake@dlsu.edu.ph', 'nr6mZQ'),
    (100000079, 'Henry', 'Ford', 6, '09155545786', 'henry_ford@dlsu.edu.ph', 'ekjPoD'),
    (100000080, 'Mila', 'Holmes', 6, '09171234587', 'mila_holmes@dlsu.edu.ph', 'h8orXC'),
    (100000081, 'Ryan', 'Sanders', 6, '09137848888', 'ryan_sanders@dlsu.edu.ph', 'VXuOjp'),
    (100000082, 'Layla', 'Newton', 6, '09171234589', 'layla_newton@dlsu.edu.ph', 'tkQRZf'),
    (100000083, 'Ethan', 'Cross', 6, '09137845790', 'ethan_cross@dlsu.edu.ph', 'SP8kxW'),
    (100000084, 'Aria', 'Blake', 6, '09171234591', 'aria_blake@dlsu.edu.ph', 'WSCp8i'),
    (100000085, 'Jack', 'Frost', 6, '09137845792', 'jack_frost@dlsu.edu.ph', 'gPGutb'),
    (100000086, 'Isabella', 'Tate', 6, '09171234593', 'isabella_tate@dlsu.edu.ph', 'KCQyJe'),
    (100000087, 'Michael', 'Baker', 6, '09137845794', 'michael_baker@dlsu.edu.ph', '2G42Oc'),
    (100000088, 'Ruby', 'Morgan', 6, '09171234595', 'ruby_morgan@dlsu.edu.ph', 'L0F6us'),
    (100000089, 'Charles', 'Gibson', 6, '09137845766', 'charles_gibson@dlsu.edu.ph', 'VkEApI'),
    (100000090, 'Evelyn', 'Stokes', 6, '09175954568', 'evelyn_stokes@dlsu.edu.ph', 'GfzTsD'),
    (100000091, 'Blake', 'Grant', 6, '09137445769', 'blake_grant@dlsu.edu.ph', 'f0GFRQ'),
    (100000092, 'Olivia', 'Ray', 6, '09151234570', 'olivia_ray@dlsu.edu.ph', 'bl27Cy'),
    (100000093, 'Carter', 'Bellamy', 6, '09137849971', 'carter_bellamy@dlsu.edu.ph', 'uucRxL'),
    (100000094, 'Zara', 'Hale', 6, '09137844542', 'zara_hale@dlsu.edu.ph', '6RTZnJ'),
    (100000095, 'Connor', 'Nixon', 6, '09137823373', 'connor_nixon@dlsu.edu.ph', 'KjzIlF'),
    (100000096, 'Sadie', 'Wyatt', 6, '09178884574', 'sadie_wyatt@dlsu.edu.ph', 'mmlrrz'),
    (100000097, 'Aiden', 'Mason', 6, '09137845999', 'aiden_mason@dlsu.edu.ph', 'HMnia9'),
    (100000098, 'Stella', 'Knight', 6, '09154934576', 'stella_knight@dlsu.edu.ph', 'wVrNon'),
    (100000099, 'Hugo', 'Bennett', 6, '09137845887', 'hugo_bennett@dlsu.edu.ph', 'VuN70N'),
    (100000100, 'Lila', 'Preston', 6, '09171209078', 'lila_preston@dlsu.edu.ph', 'qVAzLs'),
    (100000101, 'Benjamin', 'Griffin', 6, '09137845756', 'benjamin_griffin@dlsu.edu.ph', 'clgFB1'),
    (100000102, 'Aurora', 'Ellis', 6, '09187987568', 'aurora_ellis@dlsu.edu.ph', '6GneJx'),
    (100000103, 'Samuel', 'Gray', 6, '09137833769', 'samuel_gray@dlsu.edu.ph', 'esQdk0'),
    (100000104, 'Lena', 'Walsh', 6, '09171224570', 'lena_walsh@dlsu.edu.ph', 'gJSTlp'),
    (100000105, 'Nathaniel', 'Hayes', 6, '09137772771', 'nathaniel_hayes@dlsu.edu.ph', 'QdtmZv'),
    (100000106, 'Simon', 'Carter', 5, '09137845772', 'simon_carter@dlsu.edu.ph', 'YT5fzQ'),
    (100000107, 'Daisy', 'Cruz', 5, '09171234573', 'daisy_cruz@dlsu.edu.ph', 'qxSKL4'),
    (100000108, 'Liam', 'Andrews', 5, '09137845774', 'liam_andrews@dlsu.edu.ph', 'HYQG5g'),
    (100000109, 'Bella', 'Santiago', 5, '09171234575', 'bella_santiago@dlsu.edu.ph', 'XKylrk'),
    (100000110, 'Noah', 'Martinez', 5, '09137845776', 'noah_martinez@dlsu.edu.ph', 'aUROLT'),
    (100000111, 'Grace', 'Morales', 5, '09171234577', 'grace_morales@dlsu.edu.ph', '7fwcg2'),
    (100000112, 'Lucas', 'Ramos', 5, '09137845778', 'lucas_ramos@dlsu.edu.ph', 'G7Sg1e'),
    (100000113, 'Amelia', 'Diaz', 5, '09171255579', 'amelia_diaz@dlsu.edu.ph', 'tBvcMI'),
    (100000114, 'Eli', 'Ortega', 5, '09137845780', 'eli_ortega@dlsu.edu.ph', '12C78q'),
    (100000115, 'Hazel', 'Perez', 5, '09171114581', 'hazel_perez@dlsu.edu.ph', 'Y6KgFz'),
    (100000116, 'Julian', 'Cortez', 5, '09137848122', 'julian_cortez@dlsu.edu.ph', 'n84x1n'),
    (100000117, 'Maya', 'Rivera', 5, '09171239983', 'maya_rivera@dlsu.edu.ph', 'zXz6IT'),
    (100000118, 'Adrian', 'Santos', 5, '09137885780', 'adrian_santos@dlsu.edu.ph', 'r6I5e6'),
    (100000119, 'Lucy', 'Reyes', 5, '09171666685', 'lucy_reyes@dlsu.edu.ph', 'c3wU1W'),
    (100000120, 'Caleb', 'Silva', 5, '09137711786', 'caleb_silva@dlsu.edu.ph', 'bE1zuw'),
    (100000121, 'Nora', 'Torres', 5, '09170034568', 'nora_torres@dlsu.edu.ph', '0OhqBh'),
    (100000122, 'Evan', 'Lopez', 5, '09137835769', 'evan_lopez@dlsu.edu.ph', 'ktSXvl'),
    (100000123, 'Lily', 'Garcia', 5, '09173214570', 'lily_garcia@dlsu.edu.ph', 'JwDkFQ'),
    (100000124, 'Isaac', 'Vargas', 5, '09145455771', 'isaac_vargas@dlsu.edu.ph', '8mkEeW'),
    (100000125, 'Zoe', 'Navarro', 5, '09171007572', 'zoe_navarro@dlsu.edu.ph', '6MLNsi'),
    (100000126, 'Nathan', 'Aguilar', 5, '09164345773', 'nathan_aguilar@dlsu.edu.ph', '15wygb'),
    (100000127, 'Ella', 'Mendoza', 5, '09171239964', 'ella_mendoza@dlsu.edu.ph', '1wRaPl'),
    (100000128, 'Aaron', 'Castro', 5, '09168945775', 'aaron_castro@dlsu.edu.ph', 'gv7UuP'),
    (100000129, 'Scarlett', 'Guzman', 5, '09174367576', 'scarlett_guzman@dlsu.edu.ph', 'bjVzT6'),
    (100000130, 'Blake', 'Rosales', 5, '09137878787', 'blake_rosales@dlsu.edu.ph', 'LXzage'),
    (100000131, 'Julia', 'Padilla', 5, '09187784578', 'julia_padilla@dlsu.edu.ph', 'tz4mXr'),
    (100000132, 'Owen', 'Salazar', 5, '09138785279', 'owen_salazar@dlsu.edu.ph', 'TMrTdw'),
    (100000133, 'Sienna', 'Esquivel', 5, '09178785224', 'sienna_esquivel@dlsu.edu.ph', 'nr4Jvz'),
    (100000134, 'Max', 'Nunez', 5, '09137845781', 'max_nunez@dlsu.edu.ph', 'nIyIjI'),
    (100000135, 'Ariana', 'Blanco', 5, '09171234582', 'ariana_blanco@dlsu.edu.ph', 'WbrvSk'),
    (100000136, 'Olivia', 'Reed', 4, '09137845783', 'olivia_reed@dlsu.edu.ph', 'BQhLaH'),
    (100000137, 'Henry', 'Lynch', 4, '09171234584', 'henry_lynch@dlsu.edu.ph', 'WktPsQ'),
    (100000138, 'Mila', 'Moreno', 4, '09137845785', 'mila_moreno@dlsu.edu.ph', 'hqkXv7'),
    (100000139, 'Leo', 'Knight', 4, '09171234586', 'leo_knight@dlsu.edu.ph', 'gUCIFB'),
    (100000140, 'Violet', 'Scott', 4, '09137845787', 'violet_scott@dlsu.edu.ph', 'B9R2Kn'),
    (100000141, 'Oliver', 'Hale', 4, '09171234568', 'oliver_hale@dlsu.edu.ph', 'ZPfZIT'),
    (100000142, 'Luna', 'Parsons', 4, '09137745769', 'luna_parsons@dlsu.edu.ph', 'II8lzp'),
    (100000143, 'Jaxon', 'Moss', 4, '09168785370', 'jaxon_moss@dlsu.edu.ph', 'bx8y5R'),
    (100000144, 'Harper', 'Bates', 4, '09137845771', 'harper_bates@dlsu.edu.ph', 'Fdfo8a'),
    (100000145, 'Sebastian', 'Greene', 4, '09171234572', 'sebastian_greene@dlsu.edu.ph', 'Qg2qQN'),
    (100000146, 'Aurora', 'Foster', 4, '09137845773', 'aurora_foster@dlsu.edu.ph', '6UdcDp'),
    (100000147, 'David', 'Hunt', 4, '09171234574', 'david_hunt@dlsu.edu.ph', 'nz4Vgw'),
    (100000148, 'Ava', 'Lane', 4, '09137845775', 'ava_lane@dlsu.edu.ph', 'azEkIM'),
    (100000149, 'Nolan', 'Shaw', 4, '09171234576', 'nolan_shaw@dlsu.edu.ph', '38Jfxq'),
    (100000150, 'Isla', 'Bishop', 4, '09137845777', 'isla_bishop@dlsu.edu.ph', 'e55Ntm'),
    (100000151, 'Ethan', 'Mann', 4, '09198965778', 'ethan_mann@dlsu.edu.ph', 'giYvbV'),
    (100000152, 'Chloe', 'Todd', 4, '09137845779', 'chloe_todd@dlsu.edu.ph', 'gtmI9D'),
    (100000153, 'Isaac', 'Grant', 4, '09171234580', 'isaac_grant@dlsu.edu.ph', 'FzhpHi'),
    (100000154, 'Hazel', 'Perry', 4, '09171234581', 'hazel_perry@dlsu.edu.ph', 'lcxdqq'),
    (100000155, 'Leo', 'Ross', 4, '09137845782', 'leo_ross@dlsu.edu.ph', '3fshcw'),
    (100000156, 'Eliana', 'West', 4, '09166654583', 'eliana_west@dlsu.edu.ph', 'PLBtxe'),
    (100000157, 'Max', 'Hayes', 4, '09137845784', 'max_hayes@dlsu.edu.ph', 'LZIObY'),
    (100000158, 'Maya', 'Cohen', 4, '09171234585', 'maya_cohen@dlsu.edu.ph', 'wHPiHI'),
    (100000159, 'Adam', 'Morgan', 4, '09137845786', 'adam_morgan@dlsu.edu.ph', 'cN3T4Q'),
    (100000160, 'Zoe', 'Ford', 4, '09190989587', 'zoe_ford@dlsu.edu.ph', 'uOWlEj'),
    (100000161, 'Evan', 'Murphy', 4, '09137845788', 'evan_murphy@dlsu.edu.ph', 'cuRoTi'),
    (100000162, 'Sadie', 'Price', 4, '09137845789', 'sadie_price@dlsu.edu.ph', 'w92yfF'),
    (100000163, 'Asher', 'Reeves', 4, '09155545790', 'asher_reeves@dlsu.edu.ph', 'CwUojC'),
    (100000164, 'Molly', 'Sanders', 4, '09137845791', 'molly_sanders@dlsu.edu.ph', 'IvFGLw'),
    (100000165, 'Finn', 'Bennett', 4, '09137848782', 'finn_bennett@dlsu.edu.ph', 'z5eocq'),
    (100000166, 'Liam', 'Blake', 3, '09137845793', 'liam_blake@dlsu.edu.ph', 'lafUo3'),
    (100000167, 'Sophie', 'Cooper', 3, '09171234594', 'sophie_cooper@dlsu.edu.ph', 'ZNUj9q'),
    (100000168, 'Ryan', 'Dawson', 3, '09137845795', 'ryan_dawson@dlsu.edu.ph', 'i0wiMo'),
    (100000169, 'Ruby', 'Ellis', 3, '09171234596', 'ruby_ellis@dlsu.edu.ph', 'ZdTRP4'),
    (100000170, 'Jack', 'Flynn', 3, '09137845797', 'jack_flynn@dlsu.edu.ph', 'VLnMrI'),
    (100000171, 'Lily', 'Gray', 3, '09171234598', 'lily_gray@dlsu.edu.ph', 'EHC2YX'),
    (100000172, 'Aiden', 'Hayes', 3, '09137845799', 'aiden_hayes@dlsu.edu.ph', 'nj1lQF'),
    (100000173, 'Emma', 'Jenkins', 3, '09171234600', 'emma_jenkins@dlsu.edu.ph', '2H1cRL'),
    (100000174, 'Lucas', 'Kerr', 3, '09137845801', 'lucas_kerr@dlsu.edu.ph', '2W4XaO'),
    (100000175, 'Bella', 'Lewis', 3, '09171234602', 'bella_lewis@dlsu.edu.ph', 'eGJKor'),
    (100000176, 'Daniel', 'Morris', 3, '09137845803', 'daniel_morris@dlsu.edu.ph', '7wBco1'),
    (100000177, 'Ellie', 'Newton', 3, '09171234604', 'ellie_newton@dlsu.edu.ph', 'wMwrzs'),
    (100000178, 'Mason', 'Owens', 3, '09137845805', 'mason_owens@dlsu.edu.ph', '0BOsY9'),
    (100000179, 'Lydia', 'Parker', 3, '09171234606', 'lydia_parker@dlsu.edu.ph', 'UK5OPI'),
    (100000180, 'Caleb', 'Quinn', 3, '09137845808', 'caleb_quinn@dlsu.edu.ph', '5yBVtW'),
    (100000181, 'Molly', 'Reed', 3, '09171234609', 'molly_reed@dlsu.edu.ph', 'OnotxK'),
    (100000182, 'Noah', 'Sutton', 3, '09137845810', 'noah_sutton@dlsu.edu.ph', 'HfcdYF'),
    (100000183, 'Grace', 'Turner', 3, '09137845811', 'grace_turner@dlsu.edu.ph', '4Zf5CY'),
    (100000184, 'Ethan', 'Walker', 3, '09137845812', 'ethan_walker@dlsu.edu.ph', 'mr9qQR'),
    (100000185, 'Ava', 'Young', 3, '09137845813', 'ava_young@dlsu.edu.ph', '1zOwnX'),
    (100000186, 'James', 'Brooks', 3, '09137845814', 'james_brooks@dlsu.edu.ph', '28xOMe'),
    (100000187, 'Chloe', 'Ford', 3, '09137845815', 'chloe_ford@dlsu.edu.ph', 'Bw6Yq3'),
    (100000188, 'Connor', 'Gibbs', 3, '09137845816', 'connor_gibbs@dlsu.edu.ph', 'Ip31Ek'),
    (100000189, 'Hannah', 'Hunt', 3, '09137845817', 'hannah_hunt@dlsu.edu.ph', 'lQgq4J'),
    (100000190, 'Oliver', 'King', 3, '09137845818', 'oliver_king@dlsu.edu.ph', 'cXJ4EO'),
    (100000191, 'Maya', 'Lane', 3, '09137845819', 'maya_lane@dlsu.edu.ph', '3kaOSv'),
    (100000192, 'Samuel', 'Moore', 3, '09137845820', 'samuel_moore@dlsu.edu.ph', '8lTpwo'),
    (100000193, 'Lily', 'Patel', 3, '09137845821', 'lily_patel@dlsu.edu.ph', 'KzsoYe'),
    (100000194, 'Jacob', 'Ross', 3, '09137845822', 'jacob_ross@dlsu.edu.ph', 'ukk4wn'),
    (100000195, 'Zara', 'Smith', 3, '09137845823', 'zara_smith@dlsu.edu.ph', '5bUdu1'),
    (100000196, 'Lara', 'Scott', 2, '09137845824', 'lara_scott@dlsu.edu.ph', 'TWx1qA'),
    (100000197, 'Evan', 'Black', 2, '09171234625', 'evan_black@dlsu.edu.ph', 'rDY9vi'),
    (100000198, 'Nina', 'James', 2, '09137845826', 'nina_james@dlsu.edu.ph', 'aOnvzf'),
    (100000199, 'Owen', 'Wood', 2, '09171234627', 'owen_wood@dlsu.edu.ph', 'jlGmwx'),
    (100000200, 'Mia', 'Hall', 2, '09137845828', 'mia_hall@dlsu.edu.ph', 'f26Yxu'),
    (100000201, 'Liam', 'Lee', 2, '09171234629', 'liam_lee@dlsu.edu.ph', 'klvZWP'),
    (100000202, 'Ava', 'Price', 2, '09137845830', 'ava_price@dlsu.edu.ph', 'sCsDfC'),
    (100000203, 'Noah', 'West', 2, '09171234631', 'noah_west@dlsu.edu.ph', 'tXsbMT'),
    (100000204, 'Grace', 'Mills', 2, '09137845832', 'grace_mills@dlsu.edu.ph', 'pihQ7I'),
    (100000205, 'Henry', 'Hill', 2, '09171234633', 'henry_hill@dlsu.edu.ph', 'eMcz2l'),
    (100000206, 'Emily', 'Cook', 2, '09137845834', 'emily_cook@dlsu.edu.ph', 'L4xx3m'),
    (100000207, 'Lucas', 'Reed', 2, '09171234635', 'lucas_reed@dlsu.edu.ph', 'OBL6Kb'),
    (100000208, 'Sophie', 'Shaw', 2, '09137845836', 'sophie_shaw@dlsu.edu.ph', 'q7vZXP'),
    (100000209, 'Leo', 'Stone', 2, '09171234637', 'leo_stone@dlsu.edu.ph', 'UhqSGX'),
    (100000210, 'Ella', 'Ward', 2, '09137845838', 'ella_ward@dlsu.edu.ph', 'T8niLd'),
    (100000211, 'Max', 'Knight', 2, '09137845839', 'max_knight@dlsu.edu.ph', 'xb43zw'),
    (100000212, 'Xander', 'Ford', 2, '09171234640', 'xander_ford@dlsu.edu.ph', '1ffXwZ'),
    (100000213, 'Oscar', 'Cole', 2, '09137845841', 'oscar_cole@dlsu.edu.ph', '0vtgr9'),
    (100000214, 'Isla', 'Wright', 2, '09171234642', 'isla_wright@dlsu.edu.ph', 'DMdeyG'),
    (100000215, 'Jude', 'King', 2, '09137845843', 'jude_king@dlsu.edu.ph', 'Fg2Vv3'),
    (100000216, 'Clara', 'Lane', 2, '09171234644', 'clara_lane@dlsu.edu.ph', 'RVRXk7'),
    (100000217, 'Mason', 'Ward', 2, '09137845845', 'mason_ward@dlsu.edu.ph', 'SAnqgS'),
    (100000218, 'Emma', 'Young', 2, '09137845846', 'emma_young@dlsu.edu.ph', '9NfkmS'),
    (100000219, 'Aiden', 'White', 2, '09171234647', 'aiden_white@dlsu.edu.ph', '1Ybz3B'),
    (100000220, 'Lily', 'Brown', 2, '09137845848', 'lily_brown@dlsu.edu.ph', 'pS5Q8p'),
    (100000221, 'Ben', 'Gray', 2, '09171234649', 'ben_gray@dlsu.edu.ph', 'htiZ4F'),
    (100000222, 'Zara', 'Black', 2, '09137845850', 'zara_black@dlsu.edu.ph', 'w4rbdw'),
    (100000223, 'Hugo', 'Wells', 2, '09171234651', 'hugo_wells@dlsu.edu.ph', 'Mir6AA'),
    (100000224, 'Amy', 'Day', 2, '09137845852', 'amy_day@dlsu.edu.ph', 'SlnM5X'),
    (100000225, 'Eli', 'Dale', 2, '09171234653', 'eli_dale@dlsu.edu.ph', 'k71KlB'),
    (100000226, 'Brian', 'Lewis', 1, '09137845854', 'brian_lewis@dlsu.edu.ph', 'gtJST9'),
    (100000227, 'Jenna', 'Cole', 1, '09171234655', 'jenna_cole@dlsu.edu.ph', 'SyzRiN'),
    (100000228, 'Logan', 'Banks', 1, '09137845856', 'logan_banks@dlsu.edu.ph', 'J25ARs'),
    (100000229, 'Emma', 'Graham', 1, '09171234657', 'emma_graham@dlsu.edu.ph', '77g80A'),
    (100000230, 'Mark', 'Perry', 1, '09137845858', 'mark_perry@dlsu.edu.ph', 'QsyY9o'),
    (100000231, 'Sophia', 'Weston', 1, '09171234659', 'sophia_weston@dlsu.edu.ph', 'nceNJo'),
    (100000232, 'David', 'Moore', 1, '09137845860', 'david_moore@dlsu.edu.ph', 'Z5d03G'),
    (100000233, 'Lucy', 'Dunn', 1, '09171234661', 'lucy_dunn@dlsu.edu.ph', '5HDbTe'),
    (100000234, 'Oliver', 'Shaw', 1, '09137845862', 'oliver_shaw@dlsu.edu.ph', 'v8i9mQ'),
    (100000235, 'Rachel', 'Fox', 1, '09171234663', 'rachel_fox@dlsu.edu.ph', 'RSBjWs'),
    (100000236, 'Aaron', 'Wells', 1, '09137845864', 'aaron_wells@dlsu.edu.ph', 'N6PCIt'),
    (100000237, 'Hannah', 'Reese', 1, '09171234665', 'hannah_reese@dlsu.edu.ph', 'EaU0sm'),
    (100000238, 'Nathan', 'Quinn', 1, '09137845866', 'nathan_quinn@dlsu.edu.ph', 'GSHmiy'),
    (100000239, 'Megan', 'Boyd', 1, '09171234667', 'megan_boyd@dlsu.edu.ph', 'DwbpVz'),
    (100000240, 'Ethan', 'Blake', 1, '09137845868', 'ethan_blake@dlsu.edu.ph', 'AXiqln'),
    (100000241, 'Julia', 'Stone', 1, '09171234669', 'julia_stone@dlsu.edu.ph', 'AU6vSZ'),
    (100000242, 'Kevin', 'Page', 1, '09171234670', 'kevin_page@dlsu.edu.ph', '8Uq7sP'),
    (100000243, 'Amelia', 'Brooks', 1, '09137845871', 'amelia_brooks@dlsu.edu.ph', 'bPUR3P'),
    (100000244, 'Ryan', 'Foster', 1, '09171234672', 'ryan_foster@dlsu.edu.ph', 'Se8lBm'),
    (100000245, 'Ella', 'Owens', 1, '09171234673', 'ella_owens@dlsu.edu.ph', 'nS07he'),
    (100000246, 'Jake', 'Lynch', 1, '09137845874', 'jake_lynch@dlsu.edu.ph', 'IYVucc'),
    (100000247, 'Molly', 'Fleming', 1, '09171234675', 'molly_fleming@dlsu.edu.ph', 'jwvSlJ'),
    (100000248, 'Cole', 'Hughes', 1, '09137845876', 'cole_hughes@dlsu.edu.ph', 'Bu2yYd'),
    (100000249, 'Claire', 'Davidson', 1, '09171234677', 'claire_davidson@dlsu.edu.ph', 'XdqLJ3'),
    (100000250, 'Jack', 'Mason', 1, '09137845878', 'jack_mason@dlsu.edu.ph', 'Xy2jkl');
    
-- Classes for CCPROG1
INSERT INTO Classes (class_id, course_id, program_id, instructor_id, college_id, room_number, max_capacity)
VALUES
    (1001, 'CCPROG1', 'CCS-ST', 100000201, 2, 'G201', 30),
    (1002, 'CCPROG1', 'CCS-ST', 100000202, 2, 'G202', 30),
    (1003, 'CCPROG1', 'CCS-NIS', 100000203, 2, 'G203', 30),
    (1004, 'CCPROG1', 'CCS-IT', 100000204, 2, 'G204', 30);

-- Classes for CCPROG2
INSERT INTO Classes (class_id, course_id, program_id, instructor_id, college_id, room_number, max_capacity)
VALUES
    (2001, 'CCPROG2', 'CCS-ST', 100000205, 2, 'G205', 30),
    (2002, 'CCPROG2', 'CCS-ST', 100000206, 2, 'G206', 30),
    (2003, 'CCPROG2', 'CCS-NIS', 100000207, 2, 'G207', 30),
    (2004, 'CCPROG2', 'CCS-IT', 100000208, 2, 'G208', 30);

-- Classes for CCPROG3
INSERT INTO Classes (class_id, course_id, program_id, instructor_id, college_id, room_number, max_capacity)
VALUES
    (3001, 'CCPROG3', 'CCS-ST', 100000209, 2, 'G301', 25),
    (3002, 'CCPROG3', 'CCS-ST', 100000210, 2, 'G302', 25),
    (3003, 'CCPROG3', 'CCS-NIS', 100000211, 2, 'G303', 25),
    (3004, 'CCPROG3', 'CCS-IT', 100000212, 2, 'G304', 25);


-- Classes for CCDSTRU (Discrete Structures)
INSERT INTO Classes (class_id, course_id, program_id, instructor_id, college_id, room_number, max_capacity)
VALUES
    (4001, 'CCDSTRU', 'CCS-ST', 100000213, 2, 'G401', 30),
    (4002, 'CCDSTRU', 'CCS-ST', 100000214, 2, 'G402', 30),
    (4003, 'CCDSTRU', 'CCS-NIS', 100000215, 2, 'G403', 30),
    (4004, 'CCDSTRU', 'CCS-IT', 100000216, 2, 'G404', 30);


-- Classes for CCAPDEV (Web Application Development)
INSERT INTO Classes (class_id, course_id, program_id, instructor_id, college_id, room_number, max_capacity)
VALUES
    (5001, 'CCAPDEV', 'CCS-ST', 100000217, 2, 'G501', 25),
    (5002, 'CCAPDEV', 'CCS-ST', 100000218, 2, 'G502', 25),
    (5003, 'CCAPDEV', 'CCS-NIS', 100000219, 2, 'G503', 25),
    (5004, 'CCAPDEV', 'CCS-IT', 100000220, 2, 'G504', 25);


-- Classes for CSSWENG (Software Engineering)
INSERT INTO Classes (class_id, course_id, program_id, instructor_id, college_id, room_number, max_capacity)
VALUES
    (6001, 'CSSWENG', 'CCS-ST', 100000221, 2, 'G601', 25),
    (6002, 'CSSWENG', 'CCS-ST', 100000222, 2, 'G602', 25),
    (6003, 'CSSWENG', 'CCS-NIS', 100000223, 2, 'G603', 25),
    (6004, 'CSSWENG', 'CCS-IT', 100000224, 2, 'G604', 25);

-- Schedules for CCPROG1
INSERT INTO Schedules (class_id, instructor_id, scheduled_days, class_hours)
VALUES
    (1001, 100000201, 'Monday - Wednesday', '08:00 AM - 09:00 AM'),
    (1002, 100000202, 'Tuesday - Thursday', '09:00 AM - 10:00 AM'),
    (1003, 100000203, 'Wednesday - Friday', '10:00 AM - 11:00 AM'),
    (1004, 100000204, 'Monday - Thursday', '08:00 AM - 09:00 AM');


-- Schedules for CCPROG2
INSERT INTO Schedules (class_id, instructor_id, scheduled_days, class_hours)
VALUES
    (2001, 100000205, 'Monday - Tuesday', '10:00 AM - 11:00 AM'),
    (2002, 100000206, 'Tuesday - Friday', '11:00 AM - 12:00 PM'),
    (2003, 100000207, 'Wednesday - Saturday', '01:00 PM - 02:00 PM'),
    (2004, 100000208, 'Thursday - Friday', '02:00 PM - 03:00 PM');


-- Schedules for CCPROG3
INSERT INTO Schedules (class_id, instructor_id, scheduled_days, class_hours)
VALUES
    (3001, 100000209, 'Monday - Wednesday', '02:00 PM - 03:00 PM'),
    (3002, 100000210, 'Tuesday - Thursday', '03:00 PM - 04:00 PM'),
    (3003, 100000211, 'Wednesday - Friday', '08:00 AM - 09:00 AM'),
    (3004, 100000212, 'Thursday - Saturday', '10:00 AM - 11:00 AM');

-- Schedules for CCDSTRU
INSERT INTO Schedules (class_id, instructor_id, scheduled_days, class_hours)
VALUES
    (4001, 100000213, 'Monday - Tuesday', '08:00 AM - 09:00 AM'),
    (4002, 100000214, 'Tuesday - Thursday', '01:00 PM - 02:00 PM'),
    (4003, 100000215, 'Wednesday - Friday', '11:00 AM - 12:00 PM'),
    (4004, 100000216, 'Thursday - Saturday', '09:00 AM - 10:00 AM');


-- Schedules for CCAPDEV
INSERT INTO Schedules (class_id, instructor_id, scheduled_days, class_hours)
VALUES
    (5001, 100000217, 'Monday - Wednesday', '01:00 PM - 02:00 PM'),
    (5002, 100000218, 'Tuesday - Thursday', '02:00 PM - 03:00 PM'),
    (5003, 100000219, 'Wednesday - Friday', '03:00 PM - 04:00 PM'),
    (5004, 100000220, 'Thursday - Saturday', '01:00 PM - 02:00 PM');

-- Schedules for CSSWENG
INSERT INTO Schedules (class_id, instructor_id, scheduled_days, class_hours)
VALUES
    (6001, 100000221, 'Monday - Wednesday', '09:00 AM - 10:00 AM'),
    (6002, 100000222, 'Tuesday - Thursday', '10:00 AM - 11:00 AM'),
    (6003, 100000223, 'Wednesday - Friday', '12:00 PM - 01:00 PM'),
    (6004, 100000224, 'Thursday - Saturday', '03:00 PM - 04:00 PM');
        
