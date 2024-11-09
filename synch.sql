USE dbapp;

CREATE TABLE Colleges (
    college_id INT NOT NULL,
    college_name VARCHAR(50) NOT NULL,
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
    program_name VARCHAR(100) NOT NULL,
    college_id INT NOT NULL,
    CONSTRAINT programs_pk PRIMARY KEY (program_id),
    CONSTRAINT programs_fk_college FOREIGN KEY (college_id) REFERENCES Colleges(college_id)
);

ALTER TABLE Programs
MODIFY COLUMN program_name VARCHAR(300);

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
    course_id INT NOT NULL,
    course_name VARCHAR(50) NOT NULL,
    units INT(2) NOT NULL,
    instructor_id INT,
    prerequisite_id INT,
    CONSTRAINT courses_pk PRIMARY KEY (course_id),
    CONSTRAINT courses_fk_instructor FOREIGN KEY (instructor_id) REFERENCES Instructor(inst_id),
    CONSTRAINT courses_fk_prerequisite FOREIGN KEY (prerequisite_id) REFERENCES Courses(course_id)
);

ALTER TABLE Courses
ADD COLUMN college_id INT;

ALTER TABLE Courses
ADD CONSTRAINT courses_fk_college FOREIGN KEY (college_id) REFERENCES Colleges(college_id);

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

ALTER TABLE Classes
ADD COLUMN college_id INT;

ALTER TABLE Classes
ADD CONSTRAINT classes_fk_college FOREIGN KEY (college_id) REFERENCES Colleges(college_id);


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
