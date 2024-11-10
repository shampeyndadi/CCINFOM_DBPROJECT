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

-- Values for liberal arts --
INSERT INTO Courses (course_id, course_name, units, instructor_id, prerequisite_id, college_id) VALUES
    ('CLA CORE1', 'Logic and Critical Thinking', 3, 40000003, NULL, 4),
    ('CLA CORE2', 'Citizenship and Governance', 3, 40000002, NULL, 4),
    ('CLA CORE3', 'Wika, Kultra at Media', 3, 40000004, NULL, 4),
    ('CLA CORE4', 'Gender Studies & Multiculturalism', 3, 40000001, NULL, 4),
    ('CLA CORE5', 'Creative Writing', 3, 40000005, NULL, 4),
    ('MAJOR1', 'Peoples of the Philippines (PEOPHIL)', 3, 40000002, NULL, 4),
    ('MAJOR2', 'Sociological Theories (SOTHEO1)', 3, 40000003, NULL, 4),
    ('MAJOR3', 'Organizational Behavior (ORGABEV)', 3, 40000004, NULL, 4),
    ('MAJOR4', 'Human Resource Management (HUMAREM)', 3, 40000005, NULL, 4),
    ('MAJOR5', 'Organizational Development and Leadership (ORGANIV)', 3, 40000001, NULL, 4),
    ('MAJOR6', 'Anthropological Theories (SOTHEO2)', 3, 40000002, NULL, 4),
    ('MAJOR7', 'Change Management (CHANGES)', 3, 40000003, NULL, 4),
    ('MAJOR8', 'Group Dynamics (GROPROC)', 3, 40000004, NULL, 4),
    ('MAJOR9', 'Socio-cultural Assessment Methodologies (SOCSSES)', 3, 40000005, NULL, 4),
    ('MAJOR10', 'Social Statistics (SOCSTAT)', 3, 40000001, NULL, 4),
    ('MAJOR11', 'Social Research 1 (SOCRES1)', 3, 40000002, NULL, 4),
    ('MAJOR12', 'Quantitative Data Processing and Analysis (QUANTIPRO)', 6, 40000003, NULL, 4),
    ('MAJOR13', 'Program Development (PROGDEV – SL)', 3, 40000004, NULL, 4),
    ('MAJOR14', 'Social Research 2 (SOCRES2)', 3, 40000005, NULL, 4),
    ('MAJOR15', 'Qualitative Data Processing and Analysis (QUALIPRO)', 6, 40000001, NULL, 4),
    ('MAJOR16', 'Research Writing in the Social Sciences (RESWRIT)', 3, 40000002, NULL, 4),
    ('MAJOR17', 'Thesis 1 (THEOSD1)', 3, 40000003, NULL, 4),
    ('MAJOR18', 'Practicum (PRACOSD) [300 hours]', 6, 40000004, NULL, 4),
    ('MAJOR19', 'Society and Health (SOCHEAL)', 3, 40000005, NULL, 4),
    ('MAJOR20', 'Sociology of Organizations and Industry (SOCIORG)', 3, 40000001, NULL, 4),
    ('MAJOR21', 'THESIS2 (THEOSD2)', 3, 40000002, NULL, 4),
    ('MAJOR22', 'Sociological Analysis of the Philippine Society (SOCPHIL)', 3, 40000003, NULL, 4),
    ('MAJOR23', 'Social Stratification, Mobility, and Change (SOCSTRA)', 3, 40000004, NULL, 4),
    ('MAJOR24', 'Social Problems (SOCPROB)', 3, 40000005, NULL, 4),
    ('MAJOR25', 'Community Development (COMMDEV)', 3, 40000001, NULL, 4),
    ('MAJOR26', 'Knowledge Management (KNOWMAN)', 3, 40000002, NULL, 4),
    ('SOCDEVT', 'Social Development', 3, 40000003, 'POLIGOV', 4),
    ('DEVECON', 'Development Economics', 3, 40000004, 'POLIGOV', 4),
    ('PHILDEV', 'Philippine Development', 3, 40000005, 'POLIGOV', 4),
    ('DEVTMAN', 'Development Management', 3, 40000001, NULL, 4),
    ('DEVEFIN', 'Development Finance', 3, 40000002, 'DEVECON', 4),
    ('PLANDEV', 'Development Planning', 3, 40000003, 'SOCDEVT, DEVECON', 4),
    ('DEVCOMM', 'Development Communication', 3, 40000004, 'DEVTMAN', 4),
    ('INTDEVT', 'International Development', 3, 40000005, 'SOCDEVT, DEVECON', 4),
    ('MANPROJ', 'Management of Development Projects', 3, 40000001, 'DEVTMAN', 4),
    ('COMDEVT', 'Community Development', 3, 40000002, 'SOCDEVT', 4),
    ('ACREDEV', 'Action Research in Development', 3, 40000003, 'SOCDEVT, DEVECON', 4),
    ('PRCDSM1', 'Practicum', 3, 40000004, 'Completed all major courses', 4),
    ('MINOR', 'Minor in Political Science and Development Studies', 0, 40000005, NULL, 4),
    ('LEGISLA', 'Seminar in Legislation', 3, 40000001, NULL, 4),
    ('PIPOISU', 'Philippine Political Issues', 3, 40000002, NULL, 4),
    ('POLLANG', 'Political Language', 3, 40000003, NULL, 4),
    ('PIPOLEC', 'Philippine Political Economy', 3, 40000004, NULL, 4),
    ('ENVIPOL', 'Environmental Politics', 3, 40000005, NULL, 4),
    ('FIGURES', 'Political Personalities', 3, 40000001, NULL, 4),
    ('PARTIES', 'Political Parties and Party Systems', 3, 40000002, NULL, 4),
    ('POLMARK', 'Political Marketing', 3, 40000003, NULL, 4),
    ('CONTEST', 'Political Contestation', 3, 40000004, NULL, 4),
    ('POLIGEN', 'Politics of Sex', 3, 40000005, NULL, 4),
    ('WOMEPOL', 'Women and Politics', 3, 40000001, NULL, 4),
    ('DEVISSU', 'Development Issues', 3, 40000002, NULL, 4),
    ('DEVTPER', 'Development Perspectives', 3, 40000003, NULL, 4),
    ('DEVINST', 'Development Institutions', 3, 40000004, NULL, 4),
    ('PEACEDE', 'Peace and Development', 3, 40000005, NULL, 4),
    ('SUSDEVT', 'Sustainable Development', 3, 40000001, NULL, 4),
    ('URBADEV', 'Urban Development', 3, 40000002, NULL, 4),
    ('DEVADVO', 'Development Advocacy', 3, 40000003, NULL, 4),
    ('HISTINT', 'Introduction to the Study and Writing of History', 3, 40000001, NULL, 4),
    ('HISTPOH', 'Philosophy of History', 3, 40000002, NULL, 4),
    ('HISTMET', 'Historical Methodology', 3, 40000003, NULL, 4),
    ('HISTEAS', 'Survey of Asian Civilizations', 3, 40000004, NULL, 4),
    ('HISTWES', 'Survey of Western Civilization', 3, 40000005, NULL, 4),
    ('HISTOG1', 'Historiography of the Philippines 1', 3, 40000001, NULL, 4),
    ('HISTOG2', 'Historiography of the Philippines 2', 3, 40000002, NULL, 4),
    ('HISTOG3', 'Historiography of the Philippines 3', 3, 40000003, NULL, 4),
    ('HISTPRE', 'Pre-16th Century Philippines', 3, 40000004, NULL, 4),
    ('HISTSOC', 'Philippine Social History', 3, 40000005, NULL, 4),
    ('HISTETN', 'Ethnic Histories', 3, 40000001, NULL, 4),
    ('HISTNAT', 'Nationalism and History', 3, 40000002, NULL, 4)
    ('USAHIS1', 'History of the United States', 3, 40000001, NULL, 4),
    ('USAGOVT', 'Government and Politics of the United States', 3, 40000002, NULL, 4),
    ('USAECO1', 'The Economy of the United States', 3, 40000003, NULL, 4),
    ('USAFOR1', 'Foreign Policy and Relations of the United States 1', 3, 40000004, NULL, 4),
    ('USAFOR2', 'Foreign Policy and Relations of the United States 2', 3, 40000005, 'USAFOR1', 4),
    ('USAECO2', 'United States Economy and Business 2', 3, 40000001, 'USAECO1', 4),
    ('USALIT1', 'United States Literature 1', 3, 40000002, NULL, 4),
    ('USALIT2', 'United States Literature 2', 3, 40000003, 'USALIT1', 4),
    ('USARES1', 'United States Research 1 (Thesis Writing 1)', 3, 40000004, NULL, 4),
    ('USARES2', 'United States Research 2 (Thesis Writing 2)', 3, 40000005, 'USARES1', 4),
    ('USADEVT', 'United States and Development Institutions', 3, 40000001, 'USAFOR2', 4),
    ('ARESMET', 'Methods of Research for American Studies Majors', 3, 40000002, NULL, 4),
    ('USAPRAC', 'United States Practicum', 3, 40000003, 'USADEVT', 4),
    ('USALEC1', 'African Americans', 3, 40000004, NULL, 4),
    ('USALEC2', 'American Film', 3, 40000005, NULL, 4),
    ('USALEC3', 'American Immigration', 3, 40000001, NULL, 4),
    ('USALEC4', 'American Expansionism', 3, 40000002, NULL, 4),
    ('USALEC5', 'American Popular Culture', 3, 40000003, NULL, 4),
    ('USALEC6', 'American Religion', 3, 40000004, NULL, 4),
    ('USALEC7', 'Asian Americans', 3, 40000005, NULL, 4),
    ('USALEC8', 'Class and Democratic Thought in the United States', 3, 40000001, NULL, 4),
    ('USALEC9', 'Introduction to American Studies', 3, 40000002, NULL, 4),
    ('USALEC10', 'Latinos in the United States', 3, 40000003, NULL, 4),
    ('USALEC11', 'Native Americans', 3, 40000004, NULL, 4),
    ('USALEC12', 'Race and Gender in the United States', 3, 40000005, NULL, 4);
