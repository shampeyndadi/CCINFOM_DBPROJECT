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
    section VARCHAR(20),
    instructor_id INT,
    college_id INT NOT NULL,
    term VARCHAR(10),
    school_year YEAR,
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
    scheduled_days VARCHAR(100) NOT NULL, 
    class_hours  VARCHAR(100) NOT NULL,
    CONSTRAINT schedules_pk PRIMARY KEY (schedule_id),
    CONSTRAINT schedules_fk_class FOREIGN KEY (class_id) REFERENCES Classes(class_id)
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
    phone_number VARCHAR(20) UNIQUE,
    account_password VARCHAR(20),
    CONSTRAINT students_pk PRIMARY KEY (student_id),
    CONSTRAINT students_fk_program FOREIGN KEY (program_id) REFERENCES Programs(program_id)
);

SELECT * FROM Students;

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

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT,
    student_id INT NOT NULL,
    class_id INT NOT NULL,
    enrollment_date DATE DEFAULT (CURDATE()),
    CONSTRAINT enrollments_pk PRIMARY KEY (enrollment_id),
    CONSTRAINT enrollments_fk_student FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT enrollments_fk_class FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

INSERT INTO Instructor (inst_id, inst_first_name, inst_last_name, college_id, contact_no, inst_email)
VALUES
    (100000001, 'Liam', 'Everett', 8, '09171230567', 'liam_everett@dlsu.edu.ph'),
    (100000002, 'Amelia', 'Foster', 8, '09171233567', 'amelia_foster@dlsu.edu.ph'),
    (100000003, 'Ethan', 'Harrison', 8, '09137545765', 'ethan_harrison@dlsu.edu.ph'),
    (100000004, 'Olivia', 'Coleman', 8, '09191236567', 'olivia_coleman@dlsu.edu.ph'),
    (100000005, 'Mason', 'Green', 8, '09156845765', 'mason_green@dlsu.edu.ph'),
    (100000006, 'Ava', 'Nui', 8, '09173234567', 'ava_nui@dlsu.edu.ph'),
    (100000007, 'Noah', 'Carter', 8, '09137812365', 'noah_carter@dlsu.edu.ph'),
    (100000008, 'Sophia', 'Anderson', 8, '09171934567', 'sophia_anderson@dlsu.edu.ph'),
    (100000009, 'Lucas', 'Brooks', 8, '09132345765', 'lucas_brooks@dlsu.edu.ph'),
    (100000010, 'Isabella', 'Price', 8, '09171238567', 'isabella_price@dlsu.edu.ph'),
    (100000011, 'Elijah', 'Rivera', 8, '09137845765', 'elijah_rivera@dlsu.edu.ph'),
    (100000012, 'Mia', 'Perry', 8, '09171234887', 'mia_perry@dlsu.edu.ph'),
    (100000013, 'Benjamin', 'Bennett', 8, '09158475765', 'benjamin_bennett@dlsu.edu.ph'),
    (100000014, 'Ella', 'Cooper', 8, '09171232567', 'ella_cooper@dlsu.edu.ph'),
    (100000015, 'James', 'Young', 8, '09136745765', 'james_young@dlsu.edu.ph'),
    (100000016, 'Scarlett', 'Wright', 8, '09171235467', 'scarlett_wright@dlsu.edu.ph'),
    (100000017, 'Henry', 'Morgan', 8, '09123456789', 'henry_morgan@dlsu.edu.ph'),
    (100000018, 'Grace', 'Bailey', 8, '09134567890', 'grace_bailey@dlsu.edu.ph'),
    (100000019, 'Alexander', 'Scott', 8, '09145678901', 'alexander_scott@dlsu.edu.ph'),
    (100000020, 'Charlotte', 'Rogers', 8, '09156789012', 'charlotte_rogers@dlsu.edu.ph'),
    (100000021, 'Matthew', 'Long', 8, '09167890123', 'matthew_long@dlsu.edu.ph'),
    (100000022, 'Sofia', 'Lee', 8, '09178901234', 'sofia_lee@dlsu.edu.ph'),
    (100000023, 'Jack', 'King', 8, '09189012345', 'jack_king@dlsu.edu.ph'),
    (100000024, 'Emma', 'Flores', 8, '09190123456', 'emma_flores@dlsu.edu.ph'),
    (100000025, 'Daniel', 'Kelly', 8, '09201234567', 'daniel_kelly@dlsu.edu.ph'),
    (100000026, 'Lily', 'Sanders', 8, '09212345678', 'lily_sanders@dlsu.edu.ph'),
    (100000027, 'David', 'Gray', 8, '09223456789', 'david_gray@dlsu.edu.ph'),
    (100000028, 'Hannah', 'Ross', 8, '09234567890', 'hannah_ross@dlsu.edu.ph'),
    (100000029, 'Logan', 'Collins', 8, '09245678901', 'logan_collins@dlsu.edu.ph'),
    (100000030, 'Chloe', 'Patterson', 8, '09256789012', 'chloe_patterson@dlsu.edu.ph'),
    (100000031, 'Nathan', 'James', 8, '09171241568', 'nathan_james@dlsu.edu.ph'),
    (100000032, 'Aria', 'Myers', 8, '09171234569', 'aria_myers@dlsu.edu.ph'),
    (100000033, 'Samuel', 'Bryant', 8, '09171234570', 'samuel_bryant@dlsu.edu.ph'),
    (100000034, 'Zoe', 'Barnes', 8, '09171234571', 'zoe_barnes@dlsu.edu.ph'),
    (100000035, 'Joshua', 'Simmons', 8, '09168234572', 'joshua_simmons@dlsu.edu.ph'),
    (100000036, 'Leah', 'Jenkins', 8, '09171345573', 'leah_jenkins@dlsu.edu.ph'),
    (100000037, 'Christian', 'Mitchell', 8, '09167874574', 'christian_mitchell@dlsu.edu.ph'),
    (100000038, 'Mila', 'Hughes', 8, '09141234575', 'mila_hughes@dlsu.edu.ph'),
    (100000039, 'Isaac', 'Phillips', 8, '0917132176', 'isaac_phillips@dlsu.edu.ph'),
    (100000040, 'Avery', 'Howard', 8, '09161234577', 'avery_howard@dlsu.edu.ph'),
    (100000041, 'Ryan', 'Ward', 8, '09171234578', 'ryan_ward@dlsu.edu.ph'),
    (100000042, 'Madison', 'Cook', 8, '09171334579', 'madison_cook@dlsu.edu.ph'),
    (100000043, 'Caleb', 'Bell', 8, '09121234580', 'caleb_bell@dlsu.edu.ph'),
    (100000044, 'Oliver', 'Bishop', 7, '09171234561', 'oliver_bishop@dlsu.edu.ph'),
    (100000045, 'Emma', 'Shaw', 7, '09171774582', 'emma_shaw@dlsu.edu.ph'),
    (100000046, 'James', 'Lloyd', 7, '09171234583', 'james_lloyd@dlsu.edu.ph'),
    (100000047, 'Lily', 'Chapman', 7, '09171324584', 'lily_chapman@dlsu.edu.ph'),
    (100000048, 'Daniel', 'Hunt', 7, '09171234685', 'daniel_hunt@dlsu.edu.ph'),
    (100000049, 'Chloe', 'Knight', 7, '09179994586', 'chloe_knight@dlsu.edu.ph'),
    (100000050, 'Matthew', 'Woods', 7, '09178884587', 'matthew_woods@dlsu.edu.ph'),
(100000051, 'Ella', 'Watts', 7, '09171234588', 'ella_watts@dlsu.edu.ph'),
    (100000052, 'Sebastian', 'Fisher', 7, '09174444589', 'sebastian_fisher@dlsu.edu.ph'),
    (100000053, 'Avery', 'Riley', 7, '09171234590', 'avery_riley@dlsu.edu.ph'),
    (100000054, 'Joseph', 'Dixon', 7, '09171200091', 'joseph_dixon@dlsu.edu.ph'),
    (100000055, 'Luna', 'Webb', 7, '09171234592', 'luna_webb@dlsu.edu.ph'),
    (100000056, 'David', 'Burke', 7, '09133334593', 'david_burke@dlsu.edu.ph'),
    (100000057, 'Harper', 'Bater', 7, '09175654594', 'harper_bater@dlsu.edu.ph'),
    (100000058, 'Jacob', 'Rhodes', 7, '09171979795', 'jacob_rhodes@dlsu.edu.ph'),
    (100000059, 'Maya', 'Douglas', 7, '09171278996', 'maya_douglas@dlsu.edu.ph'),
    (100000060, 'Andrew', 'Steele', 7, '09171234597', 'andrew_steele@dlsu.edu.ph'),
    (100000061, 'Layla', 'Morris', 7, '09171277777', 'layla_morris@dlsu.edu.ph'),
    (100000062, 'Luke', 'Grant', 7, '09137845769', 'luke_grant@dlsu.edu.ph'),
    (100000063, 'Zoe', 'Harvey', 7, '09171234579', 'zoe_harvey@dlsu.edu.ph'),
    (100000064, 'Nathan', 'Cole', 7, '09137845771', 'nathan_cole@dlsu.edu.ph'),
    (100000065, 'Elena', 'Reid', 7, '09171278772', 'elena_reid@dlsu.edu.ph'),
    (100000066, 'Joshua', 'Turner', 7, '09138845773', 'joshua_turner@dlsu.edu.ph'),
    (100000067, 'Isla', 'Jenkins', 7, '09171230074', 'isla_jenkins@dlsu.edu.ph'),
    (100000068, 'Eli', 'Lane', 7, '09137777775', 'eli_lane@dlsu.edu.ph'),
    (100000069, 'Lydia', 'Gardner', 7, '09165767576', 'lydia_gardner@dlsu.edu.ph'),
    (100000070, 'Grayson', 'Reeves', 7, '09137898977', 'grayson_reeves@dlsu.edu.ph'),
    (100000071, 'Scarlett', 'Stone', 7, '09171934578', 'scarlett_stone@dlsu.edu.ph'),
    (100000072, 'Aaron', 'Fox', 7, '09137989779', 'aaron_fox@dlsu.edu.ph'),
    (100000073, 'Paisley', 'Moss', 7, '09131145780', 'paisley_moss@dlsu.edu.ph'),
    (100000074, 'Cole', 'Owens', 7, '09137842581', 'cole_owens@dlsu.edu.ph'),
(100000075, 'Leo', 'Reed', 6, '09137849682', 'leo_reed@dlsu.edu.ph'),
    (100000076, 'Hannah', 'Bell', 6, '09171333583', 'hannah_bell@dlsu.edu.ph'),
    (100000077, 'Oscar', 'Fleming', 6, '09137555784', 'oscar_fleming@dlsu.edu.ph'),
    (100000078, 'Sophia', 'Drake', 6, '09171236665', 'sophia_drake@dlsu.edu.ph'),
    (100000079, 'Henry', 'Ford', 6, '09155545786', 'henry_ford@dlsu.edu.ph'),
    (100000080, 'Mila', 'Holmes', 6, '09171234587', 'mila_holmes@dlsu.edu.ph'),
    (100000081, 'Ryan', 'Sanders', 6, '09137848888', 'ryan_sanders@dlsu.edu.ph'),
    (100000082, 'Layla', 'Newton', 6, '09171234589', 'layla_newton@dlsu.edu.ph'),
    (100000083, 'Ethan', 'Cross', 6, '09137845790', 'ethan_cross@dlsu.edu.ph'),
    (100000084, 'Aria', 'Blake', 6, '09171234591', 'aria_blake@dlsu.edu.ph'),
    (100000085, 'Jack', 'Frost', 6, '09137845792', 'jack_frost@dlsu.edu.ph'),
    (100000086, 'Isabella', 'Tate', 6, '09171234593', 'isabella_tate@dlsu.edu.ph'),
    (100000087, 'Michael', 'Baker', 6, '09137845794', 'michael_baker@dlsu.edu.ph'),
    (100000088, 'Ruby', 'Morgan', 6, '09171234595', 'ruby_morgan@dlsu.edu.ph'),
    (100000089, 'Charles', 'Gibson', 6, '09137845766', 'charles_gibson@dlsu.edu.ph'),
    (100000090, 'Evelyn', 'Stokes', 6, '09175954568', 'evelyn_stokes@dlsu.edu.ph'),
    (100000091, 'Blake', 'Grant', 6, '09137445769', 'blake_grant@dlsu.edu.ph'),
    (100000092, 'Olivia', 'Ray', 6, '09151234570', 'olivia_ray@dlsu.edu.ph'),
    (100000093, 'Carter', 'Bellamy', 6, '09137849971', 'carter_bellamy@dlsu.edu.ph'),
    (100000094, 'Zara', 'Hale', 6, '09137844542', 'zara_hale@dlsu.edu.ph'),
    (100000095, 'Connor', 'Nixon', 6, '09137823373', 'connor_nixon@dlsu.edu.ph'),
    (100000096, 'Sadie', 'Wyatt', 6, '09178884574', 'sadie_wyatt@dlsu.edu.ph'),
    (100000097, 'Aiden', 'Mason', 6, '09137845999', 'aiden_mason@dlsu.edu.ph'),
    (100000098, 'Stella', 'Knight', 6, '09154934576', 'stella_knight@dlsu.edu.ph'),
    (100000099, 'Hugo', 'Bennett', 6, '09137845887', 'hugo_bennett@dlsu.edu.ph'),
    (100000100, 'Lila', 'Preston', 6, '09171209078', 'lila_preston@dlsu.edu.ph'),
    (100000101, 'Benjamin', 'Griffin', 6, '09137845756', 'benjamin_griffin@dlsu.edu.ph'),
    (100000102, 'Aurora', 'Ellis', 6, '09187987568', 'aurora_ellis@dlsu.edu.ph'),
    (100000103, 'Samuel', 'Gray', 6, '09137833769', 'samuel_gray@dlsu.edu.ph'),
    (100000104, 'Lena', 'Walsh', 6, '09171224570', 'lena_walsh@dlsu.edu.ph'),
    (100000105, 'Nathaniel', 'Hayes', 6, '09137772771', 'nathaniel_hayes@dlsu.edu.ph'),
(100000106, 'Simon', 'Carter', 5, '09137845772', 'simon_carter@dlsu.edu.ph'),
    (100000107, 'Daisy', 'Cruz', 5, '09171234573', 'daisy_cruz@dlsu.edu.ph'),
    (100000108, 'Liam', 'Andrews', 5, '09137845774', 'liam_andrews@dlsu.edu.ph'),
    (100000109, 'Bella', 'Santiago', 5, '09171234575', 'bella_santiago@dlsu.edu.ph'),
    (100000110, 'Noah', 'Martinez', 5, '09137845776', 'noah_martinez@dlsu.edu.ph'),
    (100000111, 'Grace', 'Morales', 5, '09171234577', 'grace_morales@dlsu.edu.ph'),
    (100000112, 'Lucas', 'Ramos', 5, '09137845778', 'lucas_ramos@dlsu.edu.ph'),
    (100000113, 'Amelia', 'Diaz', 5, '09171255579', 'amelia_diaz@dlsu.edu.ph'),
    (100000114, 'Eli', 'Ortega', 5, '09137845780', 'eli_ortega@dlsu.edu.ph'),
    (100000115, 'Hazel', 'Perez', 5, '09171114581', 'hazel_perez@dlsu.edu.ph'),
    (100000116, 'Julian', 'Cortez', 5, '09137848122', 'julian_cortez@dlsu.edu.ph'),
    (100000117, 'Maya', 'Rivera', 5, '09171239983', 'maya_rivera@dlsu.edu.ph'),
    (100000118, 'Adrian', 'Santos', 5, '09137885780', 'adrian_santos@dlsu.edu.ph'),
    (100000119, 'Lucy', 'Reyes', 5, '09171666685', 'lucy_reyes@dlsu.edu.ph'),
    (100000120, 'Caleb', 'Silva', 5, '09137711786', 'caleb_silva@dlsu.edu.ph'),
    (100000121, 'Nora', 'Torres', 5, '09170034568', 'nora_torres@dlsu.edu.ph'),
    (100000122, 'Evan', 'Lopez', 5, '09137835769', 'evan_lopez@dlsu.edu.ph'),
    (100000123, 'Lily', 'Garcia', 5, '09173214570', 'lily_garcia@dlsu.edu.ph'),
    (100000124, 'Isaac', 'Vargas', 5, '09145455771', 'isaac_vargas@dlsu.edu.ph'),
    (100000125, 'Zoe', 'Navarro', 5, '09171007572', 'zoe_navarro@dlsu.edu.ph'),
    (100000126, 'Nathan', 'Aguilar', 5, '09164345773', 'nathan_aguilar@dlsu.edu.ph'),
    (100000127, 'Ella', 'Mendoza', 5, '09171239964', 'ella_mendoza@dlsu.edu.ph'),
    (100000128, 'Aaron', 'Castro', 5, '09168945775', 'aaron_castro@dlsu.edu.ph'),
    (100000129, 'Scarlett', 'Guzman', 5, '09174367576', 'scarlett_guzman@dlsu.edu.ph'),
    (100000130, 'Blake', 'Rosales', 5, '09137878787', 'blake_rosales@dlsu.edu.ph'),
    (100000131, 'Julia', 'Padilla', 5, '09187784578', 'julia_padilla@dlsu.edu.ph'),
    (100000132, 'Owen', 'Salazar', 5, '09138785279', 'owen_salazar@dlsu.edu.ph'),
    (100000133, 'Sienna', 'Esquivel', 5, '09178785224', 'sienna_esquivel@dlsu.edu.ph'),
    (100000134, 'Max', 'Nunez', 5, '09137845781', 'max_nunez@dlsu.edu.ph'),
    (100000135, 'Ariana', 'Blanco', 5, '09171234582', 'ariana_blanco@dlsu.edu.ph'),
(100000136, 'Olivia', 'Reed', 4, '09137845783', 'olivia_reed@dlsu.edu.ph'),
    (100000137, 'Henry', 'Lynch', 4, '09171234584', 'henry_lynch@dlsu.edu.ph'),
    (100000138, 'Mila', 'Moreno', 4, '09137845785', 'mila_moreno@dlsu.edu.ph'),
    (100000139, 'Leo', 'Knight', 4, '09171234586', 'leo_knight@dlsu.edu.ph'),
    (100000140, 'Violet', 'Scott', 4, '09137845787', 'violet_scott@dlsu.edu.ph'),
    (100000141, 'Oliver', 'Hale', 4, '09171234568', 'oliver_hale@dlsu.edu.ph'),
    (100000142, 'Luna', 'Parsons', 4, '09137745769', 'luna_parsons@dlsu.edu.ph'),
    (100000143, 'Jaxon', 'Moss', 4, '09168785370', 'jaxon_moss@dlsu.edu.ph'),
    (100000144, 'Harper', 'Bates', 4, '09137845771', 'harper_bates@dlsu.edu.ph'),
    (100000145, 'Sebastian', 'Greene', 4, '09171234572', 'sebastian_greene@dlsu.edu.ph'),
    (100000146, 'Aurora', 'Foster', 4, '09137845773', 'aurora_foster@dlsu.edu.ph'),
    (100000147, 'David', 'Hunt', 4, '09171234574', 'david_hunt@dlsu.edu.ph'),
    (100000148, 'Ava', 'Lane', 4, '09137845775', 'ava_lane@dlsu.edu.ph'),
    (100000149, 'Nolan', 'Shaw', 4, '09171234576', 'nolan_shaw@dlsu.edu.ph'),
    (100000150, 'Isla', 'Bishop', 4, '09137845777', 'isla_bishop@dlsu.edu.ph'),
    (100000151, 'Ethan', 'Mann', 4, '09198965778', 'ethan_mann@dlsu.edu.ph'),
    (100000152, 'Chloe', 'Todd', 4, '09137845779', 'chloe_todd@dlsu.edu.ph'),
    (100000153, 'Isaac', 'Grant', 4, '09171234580', 'isaac_grant@dlsu.edu.ph'),
    (100000154, 'Hazel', 'Perry', 4, '09171234581', 'hazel_perry@dlsu.edu.ph'),
    (100000155, 'Leo', 'Ross', 4, '09137845782', 'leo_ross@dlsu.edu.ph'),
    (100000156, 'Eliana', 'West', 4, '09166654583', 'eliana_west@dlsu.edu.ph'),
    (100000157, 'Max', 'Hayes', 4, '09137845784', 'max_hayes@dlsu.edu.ph'),
    (100000158, 'Maya', 'Cohen', 4, '09171234585', 'maya_cohen@dlsu.edu.ph'),
    (100000159, 'Adam', 'Morgan', 4, '09137845786', 'adam_morgan@dlsu.edu.ph'),
    (100000160, 'Zoe', 'Ford', 4, '09190989587', 'zoe_ford@dlsu.edu.ph'),
    (100000161, 'Evan', 'Murphy', 4, '09137845788', 'evan_murphy@dlsu.edu.ph'),
    (100000162, 'Sadie', 'Price', 4, '09137845789', 'sadie_price@dlsu.edu.ph'),
    (100000163, 'Asher', 'Reeves', 4, '09155545790', 'asher_reeves@dlsu.edu.ph'),
    (100000164, 'Molly', 'Sanders', 4, '09137845791', 'molly_sanders@dlsu.edu.ph'),
    (100000165, 'Finn', 'Bennett', 4, '09137848782', 'finn_bennett@dlsu.edu.ph'),
	(100000166, 'Liam', 'Blake', 3, '09137845793', 'liam_blake@dlsu.edu.ph'),
    (100000167, 'Sophie', 'Cooper', 3, '09171234594', 'sophie_cooper@dlsu.edu.ph'),
    (100000168, 'Ryan', 'Dawson', 3, '09137845795', 'ryan_dawson@dlsu.edu.ph'),
    (100000169, 'Ruby', 'Ellis', 3, '09171234596', 'ruby_ellis@dlsu.edu.ph'),
    (100000170, 'Jack', 'Flynn', 3, '09137845797', 'jack_flynn@dlsu.edu.ph'),
    (100000171, 'Lily', 'Gray', 3, '09171234598', 'lily_gray@dlsu.edu.ph'),
    (100000172, 'Aiden', 'Hayes', 3, '09137845799', 'aiden_hayes@dlsu.edu.ph'),
    (100000173, 'Emma', 'Jenkins', 3, '09171234600', 'emma_jenkins@dlsu.edu.ph'),
    (100000174, 'Lucas', 'Kerr', 3, '09137845801', 'lucas_kerr@dlsu.edu.ph'),
    (100000175, 'Bella', 'Lewis', 3, '09171234602', 'bella_lewis@dlsu.edu.ph'),
    (100000176, 'Daniel', 'Morris', 3, '09137845803', 'daniel_morris@dlsu.edu.ph'),
    (100000177, 'Ellie', 'Newton', 3, '09171234604', 'ellie_newton@dlsu.edu.ph'),
    (100000178, 'Mason', 'Owens', 3, '09137845805', 'mason_owens@dlsu.edu.ph'),
    (100000179, 'Lydia', 'Parker', 3, '09171234606', 'lydia_parker@dlsu.edu.ph'),
    (100000180, 'Caleb', 'Quinn', 3, '09137845808', 'caleb_quinn@dlsu.edu.ph'),
    (100000181, 'Molly', 'Reed', 3, '09171234609', 'molly_reed@dlsu.edu.ph'),
    (100000182, 'Noah', 'Sutton', 3, '09137845810', 'noah_sutton@dlsu.edu.ph'),
    (100000183, 'Grace', 'Turner', 3, '09137845811', 'grace_turner@dlsu.edu.ph'),
    (100000184, 'Ethan', 'Walker', 3, '09137845812', 'ethan_walker@dlsu.edu.ph'),
    (100000185, 'Ava', 'Young', 3, '09137845813', 'ava_young@dlsu.edu.ph'),
    (100000186, 'James', 'Brooks', 3, '09137845814', 'james_brooks@dlsu.edu.ph'),
    (100000187, 'Chloe', 'Ford', 3, '09137845815', 'chloe_ford@dlsu.edu.ph'),
    (100000188, 'Connor', 'Gibbs', 3, '09137845816', 'connor_gibbs@dlsu.edu.ph'),
    (100000189, 'Hannah', 'Hunt', 3, '09137845817', 'hannah_hunt@dlsu.edu.ph'),
    (100000190, 'Oliver', 'King', 3, '09137845818', 'oliver_king@dlsu.edu.ph'),
    (100000191, 'Maya', 'Lane', 3, '09137845819', 'maya_lane@dlsu.edu.ph'),
    (100000192, 'Samuel', 'Moore', 3, '09137845820', 'samuel_moore@dlsu.edu.ph'),
    (100000193, 'Lily', 'Patel', 3, '09137845821', 'lily_patel@dlsu.edu.ph'),
    (100000194, 'Jacob', 'Ross', 3, '09137845822', 'jacob_ross@dlsu.edu.ph'),
    (100000195, 'Zara', 'Smith', 3, '09137845823', 'zara_smith@dlsu.edu.ph'),
    (100000196, 'Lara', 'Scott', 2, '09137845824', 'lara_scott@dlsu.edu.ph'),
    (100000197, 'Evan', 'Black', 2, '09171234625', 'evan_black@dlsu.edu.ph'),
    (100000198, 'Nina', 'James', 2, '09137845826', 'nina_james@dlsu.edu.ph'),
    (100000199, 'Owen', 'Wood', 2, '09171234627', 'owen_wood@dlsu.edu.ph'),
    (100000200, 'Mia', 'Hall', 2, '09137845828', 'mia_hall@dlsu.edu.ph'),
    (100000201, 'Liam', 'Lee', 2, '09171234629', 'liam_lee@dlsu.edu.ph'),
    (100000202, 'Ava', 'Price', 2, '09137845830', 'ava_price@dlsu.edu.ph'),
    (100000203, 'Noah', 'West', 2, '09171234631', 'noah_west@dlsu.edu.ph'),
    (100000204, 'Grace', 'Mills', 2, '09137845832', 'grace_mills@dlsu.edu.ph'),
    (100000205, 'Henry', 'Hill', 2, '09171234633', 'henry_hill@dlsu.edu.ph'),
    (100000206, 'Emily', 'Cook', 2, '09137845834', 'emily_cook@dlsu.edu.ph'),
    (100000207, 'Lucas', 'Reed', 2, '09171234635', 'lucas_reed@dlsu.edu.ph'),
    (100000208, 'Sophie', 'Shaw', 2, '09137845836', 'sophie_shaw@dlsu.edu.ph'),
    (100000209, 'Leo', 'Stone', 2, '09171234637', 'leo_stone@dlsu.edu.ph'),
    (100000210, 'Ella', 'Ward', 2, '09137845838', 'ella_ward@dlsu.edu.ph'),
    (100000211, 'Max', 'Knight', 2, '09137845839', 'max_knight@dlsu.edu.ph'),
    (100000212, 'Xander', 'Ford', 2, '09171234640', 'xander_ford@dlsu.edu.ph'),
    (100000213, 'Oscar', 'Cole', 2, '09137845841', 'oscar_cole@dlsu.edu.ph'),
    (100000214, 'Isla', 'Wright', 2, '09171234642', 'isla_wright@dlsu.edu.ph'),
    (100000215, 'Jude', 'King', 2, '09137845843', 'jude_king@dlsu.edu.ph'),
    (100000216, 'Clara', 'Lane', 2, '09171234644', 'clara_lane@dlsu.edu.ph'),
    (100000217, 'Mason', 'Ward', 2, '09137845845', 'mason_ward@dlsu.edu.ph'),
    (100000218, 'Emma', 'Young', 2, '09137845846', 'emma_young@dlsu.edu.ph'),
    (100000219, 'Aiden', 'White', 2, '09171234647', 'aiden_white@dlsu.edu.ph'),
    (100000220, 'Lily', 'Brown', 2, '09137845848', 'lily_brown@dlsu.edu.ph'),
    (100000221, 'Ben', 'Gray', 2, '09171234649', 'ben_gray@dlsu.edu.ph'),
    (100000222, 'Zara', 'Black', 2, '09137845850', 'zara_black@dlsu.edu.ph'),
    (100000223, 'Hugo', 'Wells', 2, '09171234651', 'hugo_wells@dlsu.edu.ph'),
    (100000224, 'Amy', 'Day', 2, '09137845852', 'amy_day@dlsu.edu.ph'),
    (100000225, 'Eli', 'Dale', 2, '09171234653', 'eli_dale@dlsu.edu.ph'),
    (100000226, 'Brian', 'Lewis', 1, '09137845854', 'brian_lewis@dlsu.edu.ph'),
    (100000227, 'Jenna', 'Cole', 1, '09171234655', 'jenna_cole@dlsu.edu.ph'),
    (100000228, 'Logan', 'Banks', 1, '09137845856', 'logan_banks@dlsu.edu.ph'),
    (100000229, 'Emma', 'Graham', 1, '09171234657', 'emma_graham@dlsu.edu.ph'),
    (100000230, 'Mark', 'Perry', 1, '09137845858', 'mark_perry@dlsu.edu.ph'),
    (100000231, 'Sophia', 'Weston', 1, '09171234659', 'sophia_weston@dlsu.edu.ph'),
    (100000232, 'David', 'Moore', 1, '09137845860', 'david_moore@dlsu.edu.ph'),
    (100000233, 'Lucy', 'Dunn', 1, '09171234661', 'lucy_dunn@dlsu.edu.ph'),
    (100000234, 'Oliver', 'Shaw', 1, '09137845862', 'oliver_shaw@dlsu.edu.ph'),
    (100000235, 'Rachel', 'Fox', 1, '09171234663', 'rachel_fox@dlsu.edu.ph'),
    (100000236, 'Aaron', 'Wells', 1, '09137845864', 'aaron_wells@dlsu.edu.ph'),
    (100000237, 'Hannah', 'Reese', 1, '09171234665', 'hannah_reese@dlsu.edu.ph'),
    (100000238, 'Nathan', 'Quinn', 1, '09137845866', 'nathan_quinn@dlsu.edu.ph'),
    (100000239, 'Megan', 'Boyd', 1, '09171234667', 'megan_boyd@dlsu.edu.ph'),
    (100000240, 'Ethan', 'Blake', 1, '09137845868', 'ethan_blake@dlsu.edu.ph'),
    (100000241, 'Julia', 'Stone', 1, '09171234669', 'julia_stone@dlsu.edu.ph'),
    (100000242, 'Kevin', 'Page', 1, '09171234670', 'kevin_page@dlsu.edu.ph'),
    (100000243, 'Amelia', 'Brooks', 1, '09137845871', 'amelia_brooks@dlsu.edu.ph'),
    (100000244, 'Ryan', 'Foster', 1, '09171234672', 'ryan_foster@dlsu.edu.ph'),
    (100000245, 'Ella', 'Owens', 1, '09171234673', 'ella_owens@dlsu.edu.ph'),
    (100000246, 'Jake', 'Lynch', 1, '09137845874', 'jake_lynch@dlsu.edu.ph'),
    (100000247, 'Molly', 'Fleming', 1, '09171234675', 'molly_fleming@dlsu.edu.ph'),
    (100000248, 'Cole', 'Hughes', 1, '09137845876', 'cole_hughes@dlsu.edu.ph'),
    (100000249, 'Claire', 'Davidson', 1, '09171234677', 'claire_davidson@dlsu.edu.ph'),
    (100000250, 'Jack', 'Mason', 1, '09137845878', 'jack_mason@dlsu.edu.ph');

-- Classes for CCPROG1
INSERT INTO Classes (class_id, course_id, program_id, section, instructor_id, college_id, term, school_year, room_number, max_capacity)
VALUES
    (1001, 'CCPROG1', 'CCS-ST', 'S1', 100000201, 2, '1st Term', 2024, 'G201', 30),
    (1002, 'CCPROG1', 'CCS-ST', 'S2', 100000202, 2, '1st Term', 2024, 'G202', 30),
    (1003, 'CCPROG1', 'CCS-NIS', 'N1', 100000203, 2, '1st Term', 2024, 'G203', 30),
    (1004, 'CCPROG1', 'CCS-IT', 'I1', 100000204, 2, '1st Term', 2024, 'G204', 30);

-- Classes for CCPROG2
INSERT INTO Classes (class_id, course_id, program_id, section, instructor_id, college_id, term, school_year, room_number, max_capacity)
VALUES
    (2001, 'CCPROG2', 'CCS-ST', 'S1', 100000205, 2, '2nd Term', 2024, 'G205', 30),
    (2002, 'CCPROG2', 'CCS-ST', 'S2', 100000206, 2, '2nd Term', 2024, 'G206', 30),
    (2003, 'CCPROG2', 'CCS-NIS', 'N1', 100000207, 2, '2nd Term', 2024, 'G207', 30),
    (2004, 'CCPROG2', 'CCS-IT', 'I1', 100000208, 2, '2nd Term', 2024, 'G208', 30);

-- Classes for CCPROG3
INSERT INTO Classes (class_id, course_id, program_id, section, instructor_id, college_id, term, school_year, room_number, max_capacity)
VALUES
    (3001, 'CCPROG3', 'CCS-ST', 'S1', 100000209, 2, '2nd Term', 2024, 'G301', 25),
    (3002, 'CCPROG3', 'CCS-ST', 'S2', 100000210, 2, '2nd Term', 2024, 'G302', 25),
    (3003, 'CCPROG3', 'CCS-NIS', 'N1', 100000211, 2, '2nd Term', 2024, 'G303', 25),
    (3004, 'CCPROG3', 'CCS-IT', 'I1', 100000212, 2, '2nd Term', 2024, 'G304', 25);

-- Classes for CCDSTRU (Discrete Structures)
INSERT INTO Classes (class_id, course_id, program_id, section, instructor_id, college_id, term, school_year, room_number, max_capacity)
VALUES
    (4001, 'CCDSTRU', 'CCS-ST', 'S1', 100000213, 2, '1st Term', 2024, 'G401', 30),
    (4002, 'CCDSTRU', 'CCS-ST', 'S2', 100000214, 2, '1st Term', 2024, 'G402', 30),
    (4003, 'CCDSTRU', 'CCS-NIS', 'N1', 100000215, 2, '1st Term', 2024, 'G403', 30),
    (4004, 'CCDSTRU', 'CCS-IT', 'I1', 100000216, 2, '1st Term', 2024, 'G404', 30);

-- Classes for CCAPDEV (Web Application Development)
INSERT INTO Classes (class_id, course_id, program_id, section, instructor_id, college_id, term, school_year, room_number, max_capacity)
VALUES
    (5001, 'CCAPDEV', 'CCS-ST', 'S1', 100000217, 2, '2nd Term', 2024, 'G501', 25),
    (5002, 'CCAPDEV', 'CCS-ST', 'S2', 100000218, 2, '2nd Term', 2024, 'G502', 25),
    (5003, 'CCAPDEV', 'CCS-NIS', 'N1', 100000219, 2, '2nd Term', 2024, 'G503', 25),
    (5004, 'CCAPDEV', 'CCS-IT', 'I1', 100000220, 2, '2nd Term', 2024, 'G504', 25);

-- Classes for CSSWENG (Software Engineering)
INSERT INTO Classes (class_id, course_id, program_id, section, instructor_id, college_id, term, school_year, room_number, max_capacity)
VALUES
    (6001, 'CSSWENG', 'CCS-ST', 'S1', 100000221, 2, '2nd Term', 2024, 'G601', 25),
    (6002, 'CSSWENG', 'CCS-ST', 'S2', 100000222, 2, '2nd Term', 2024, 'G602', 25),
    (6003, 'CSSWENG', 'CCS-NIS', 'N1', 100000223, 2, '2nd Term', 2024, 'G603', 25),
    (6004, 'CSSWENG', 'CCS-IT', 'I1', 100000224, 2, '2nd Term', 2024, 'G604', 25);


-- Schedules for CCPROG1
INSERT INTO Schedules (class_id, scheduled_days, class_hours)
VALUES
    (1001, 'Monday - Wednesday', '08:00 AM - 9:00 AM'),
    (1002, 'Tuesday - Thursday', '09:00 AM - 10:00 AM'),
    (1003, 'Wednesday - Friday', '10:00 AM - 11:00 PM'),
    (1004, 'Monday - Thursday', '08:00 AM - 09:00 AM');

-- Schedules for CCPROG2
INSERT INTO Schedules (class_id, scheduled_days, class_hours)
VALUES
    (2001, 'Monday - Tuesday', '10:00 AM - 11:00 PM'),
    (2002, 'Tuesday - Friday', '11:00 AM - 12:00 PM'),
    (2003, 'Wednesday - Saturday', '01:00 PM - 02:00 PM'),
    (2004, 'Thursday - Friday', '02:00 PM - 03:00 PM');

-- Schedules for CCPROG3
INSERT INTO Schedules (class_id, scheduled_days, class_hours)
VALUES
    (3001, 'Monday - Wednesday', '02:00 PM - 03:00 PM'),
    (3002, 'Tuesday - Thursday', '03:00 PM - 04:00 PM'),
    (3003, 'Wednesday - Friday', '08:00 AM - 09:00 AM'),
    (3004, 'Thursday - Saturday', '10:00 AM - 11:00 PM');

-- Schedules for CCDSTRU
INSERT INTO Schedules (class_id, scheduled_days, class_hours)
VALUES
    (4001, 'Monday - Tuesday', '08:00 AM - 09:00 AM'),
    (4002, 'Tuesday - Thursday', '01:00 PM - 02:00 PM'),
    (4003, 'Wednesday - Friday', '11:00 AM - 12:00 PM'),
    (4004, 'Thursday - Saturday', '09:00 AM - 10:00 AM');

-- Schedules for CCAPDEV
INSERT INTO Schedules (class_id, scheduled_days, class_hours)
VALUES
    (5001, 'Monday - Wednesday', '01:00 PM - 02:00 PM'),
    (5002, 'Tuesday - Thursday', '02:00 PM - 03:00 PM'),
    (5003, 'Wednesday - Friday', '03:00 PM - 04:00 PM'),
    (5004, 'Thursday - Saturday', '01:00 PM - 02:00 PM');

-- Schedules for CSSWENG
INSERT INTO Schedules (class_id, scheduled_days, class_hours)
VALUES
    (6001, 'Monday - Wednesday', '09:00 AM - 10:00 AM'),
    (6002, 'Tuesday - Thursday', '10:00 AM - 11:00 PM'),
    (6003, 'Wednesday - Friday', '12:00 PM - 01:00 PM'),
    (6004, 'Thursday - Saturday', '03:00 PM - 04:00 PM');
