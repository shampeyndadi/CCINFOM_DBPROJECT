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
    ('BAGCED-CIESOL', 'Center for Innovative Education Solutions (CIESOL)', 1),
    ('AB-LSSD', 'Bachelor of Arts in Legal Studies and Sustainable Development', 3);

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
    
INSERT INTO Courses (course_id, course_name, units, college_id, program_id)
VALUES
    -- Core Business Courses (Common Across COB Programs)
    ('BUSMATH', 'Business Mathematics', 3, 7, NULL),
    ('BUSTAT', 'Business Statistics', 3, 7, NULL),
    ('BACC101', 'Fundamentals of Accounting', 3, 7, NULL),
    ('BLAW101', 'Introduction to Business Law', 3, 7, NULL),
    ('BMGT101', 'Principles of Management', 3, 7, NULL),
    ('BMKT101', 'Principles of Marketing', 3, 7, NULL),
    ('BFIN101', 'Introduction to Financial Management', 3, 7, NULL),
    ('BHRM101', 'Human Resource Management', 3, 7, NULL),
    ('BECON01', 'Introduction to Microeconomics', 3, 7, NULL),
    ('BECON02', 'Introduction to Macroeconomics', 3, 7, NULL),
    ('BRES101', 'Business Research Methods', 3, 7, NULL),
    ('BETHICS', 'Business Ethics and Corporate Social Responsibility', 3, 7, NULL),

    -- Bachelor of Science in Accountancy (COB-ACC)
    ('ACC101', 'Intermediate Accounting 1', 3, 7, 'COB-ACC'),
    ('ACC102', 'Intermediate Accounting 2', 3, 7, 'COB-ACC'),
    ('ACC103', 'Advanced Accounting', 3, 7, 'COB-ACC'),
    ('ACC104', 'Financial Accounting and Reporting', 3, 7, 'COB-ACC'),
    ('ACC105', 'Auditing and Assurance 1', 3, 7, 'COB-ACC'),
    ('ACC106', 'Auditing and Assurance 2', 3, 7, 'COB-ACC'),
    ('ACC107', 'Management Advisory Services', 3, 7, 'COB-ACC'),
    ('ACC108', 'Taxation', 3, 7, 'COB-ACC'),

    -- Bachelor of Science in Advertising Management (COB-ADV)
    ('ADV101', 'Introduction to Advertising', 3, 7, 'COB-ADV'),
    ('ADV102', 'Creative Strategies in Advertising', 3, 7, 'COB-ADV'),
    ('ADV103', 'Advertising Media Planning', 3, 7, 'COB-ADV'),
    ('ADV104', 'Digital Advertising and Social Media', 3, 7, 'COB-ADV'),
    ('ADV105', 'Advertising Campaign Management', 3, 7, 'COB-ADV'),
    ('ADV106', 'Consumer Behavior and Insights', 3, 7, 'COB-ADV'),

    -- Bachelor of Science in Applied Corporate Management (COB-ACM)
    ('ACM101', 'Introduction to Corporate Management', 3, 7, 'COB-ACM'),
    ('ACM102', 'Corporate Governance and Risk Management', 3, 7, 'COB-ACM'),
    ('ACM103', 'Business Negotiation and Conflict Resolution', 3, 7, 'COB-ACM'),
    ('ACM104', 'Operations and Supply Chain Management', 3, 7, 'COB-ACM'),
    ('ACM105', 'Business Leadership and Strategy', 3, 7, 'COB-ACM'),

    -- Bachelor of Science in Business Management (COB-BM)
    ('BM101', 'Business Organization and Environment', 3, 7, 'COB-BM'),
    ('BM102', 'Strategic Management', 3, 7, 'COB-BM'),
    ('BM103', 'Operations Management', 3, 7, 'COB-BM'),
    ('BM104', 'Project Management', 3, 7, 'COB-BM'),

    -- Bachelor of Science in Entrepreneurship (COB-ENT)
    ('ENT101', 'Introduction to Entrepreneurship', 3, 7, 'COB-ENT'),
    ('ENT102', 'Business Opportunity Identification', 3, 7, 'COB-ENT'),
    ('ENT103', 'Innovation and Product Development', 3, 7, 'COB-ENT'),
    ('ENT104', 'Small Business Management', 3, 7, 'COB-ENT'),
    ('ENT105', 'Entrepreneurial Finance', 3, 7, 'COB-ENT'),

    -- Bachelor of Science in Interdisciplinary Business Studies (COB-IBS)
    ('IBS101', 'Interdisciplinary Perspectives in Business', 3, 7, 'COB-IBS'),
    ('IBS102', 'Cultural Diversity in Business', 3, 7, 'COB-IBS'),
    ('IBS103', 'Global Business Strategies', 3, 7, 'COB-IBS'),
    ('IBS104', 'Corporate Social Innovation', 3, 7, 'COB-IBS'),

    -- Bachelor of Science in Legal Management (COB-LM)
    ('LM101', 'Introduction to Legal Management', 3, 7, 'COB-LM'),
    ('LM102', 'Business and Commercial Laws', 3, 7, 'COB-LM'),
    ('LM103', 'Contracts and Obligations', 3, 7, 'COB-LM'),
    ('LM104', 'Labor Laws and Social Legislation', 3, 7, 'COB-LM'),

    -- Bachelor of Science in Management of Financial Institutions (COB-MFI)
    ('MFI101', 'Introduction to Financial Institutions', 3, 7, 'COB-MFI'),
    ('MFI102', 'Risk Management in Financial Institutions', 3, 7, 'COB-MFI'),
    ('MFI103', 'Financial Markets and Instruments', 3, 7, 'COB-MFI'),
    ('MFI104', 'Banking Operations and Management', 3, 7, 'COB-MFI'),

    -- Bachelor of Science in Marketing Management (COB-MM)
    ('MM101', 'Introduction to Marketing Management', 3, 7, 'COB-MM'),
    ('MM102', 'Integrated Marketing Communications', 3, 7, 'COB-MM'),
    ('MM103', 'Marketing Analytics', 3, 7, 'COB-MM'),
    ('MM104', 'Brand Management', 3, 7, 'COB-MM'),

    -- Bachelor of Science in Management Accounting with Business Analytics (COB-MABA)
    ('MABA101', 'Introduction to Management Accounting', 3, 7, 'COB-MABA'),
    ('MABA102', 'Cost Accounting and Control', 3, 7, 'COB-MABA'),
    ('MABA103', 'Management Accounting for Decision Making', 3, 7, 'COB-MABA'),
    ('MABA104', 'Business Analytics for Accounting', 3, 7, 'COB-MABA'),

    -- Bachelor of Science in Management Accounting (COB-MA)
    ('MA101', 'Principles of Management Accounting', 3, 7, 'COB-MA'),
    ('MA102', 'Cost Accounting and Budgeting', 3, 7, 'COB-MA'),
    ('MA103', 'Financial Management for Accountants', 3, 7, 'COB-MA'),
    ('MA104', 'Strategic Management Accounting', 3, 7, 'COB-MA');
 
INSERT INTO Courses (course_id, course_name, units, college_id, program_id)
VALUES
    -- Core Science Courses (Common Across COS Programs)
    ('COSCHEM1', 'General Chemistry 1', 4, 5, NULL),
    ('COSCHEM2', 'General Chemistry 2', 4, 5, NULL),
    ('COSPHYS1', 'Physics 1 (Mechanics and Thermodynamics)', 4, 5, NULL),
    ('COSPHYS2', 'Physics 2 (Electricity and Magnetism)', 4, 5, NULL),
    ('COSMATH1', 'Calculus 1', 3, 5, NULL),
    ('COSMATH2', 'Calculus 2', 3, 5, NULL),
    ('COSSTAT', 'Introduction to Statistics', 3, 5, NULL),
    ('COSBIO1', 'General Biology 1', 4, 5, NULL),
    ('COSBIO2', 'General Biology 2', 4, 5, NULL),
    ('COSRES1', 'Introduction to Research in Science', 3, 5, NULL),
    ('COSRES2', 'Advanced Research Methods in Science', 3, 5, NULL),

    -- Bachelor of Science in Biochemistry (COS-BIOCHEM)
    ('BIOCHEM1', 'Introduction to Biochemistry', 4, 5, 'COS-BIOCHEM'),
    ('BIOCHEM2', 'Metabolic Biochemistry', 4, 5, 'COS-BIOCHEM'),
    ('BIOCHEM3', 'Molecular Biology and Biochemistry', 4, 5, 'COS-BIOCHEM'),
    ('BIOCHEM4', 'Biochemistry Laboratory Techniques', 3, 5, 'COS-BIOCHEM'),
    ('BIOCHEM5', 'Enzymology', 3, 5, 'COS-BIOCHEM'),
    ('BIOCHEM6', 'Biochemical Genetics', 3, 5, 'COS-BIOCHEM'),
    ('BIOCHEM7', 'Advanced Biochemistry', 4, 5, 'COS-BIOCHEM'),

    -- BS in Biology major in Medical Biology (COS-MBIO)
    ('MBIO1', 'Cell and Molecular Biology', 4, 5, 'COS-MBIO'),
    ('MBIO2', 'Human Anatomy and Physiology', 4, 5, 'COS-MBIO'),
    ('MBIO3', 'Immunology', 3, 5, 'COS-MBIO'),
    ('MBIO4', 'Medical Microbiology', 4, 5, 'COS-MBIO'),
    ('MBIO5', 'Pathophysiology', 4, 5, 'COS-MBIO'),
    ('MBIO6', 'Clinical Biochemistry', 4, 5, 'COS-MBIO'),

    -- BS in Biology major in Molecular Biology and Biotechnology (COS-MOLBIO)
    ('MOLBIO1', 'Principles of Biotechnology', 4, 5, 'COS-MOLBIO'),
    ('MOLBIO2', 'Molecular Genetics', 4, 5, 'COS-MOLBIO'),
    ('MOLBIO3', 'Recombinant DNA Technology', 4, 5, 'COS-MOLBIO'),
    ('MOLBIO4', 'Protein Engineering', 4, 5, 'COS-MOLBIO'),
    ('MOLBIO5', 'Industrial Biotechnology', 4, 5, 'COS-MOLBIO'),
    ('MOLBIO6', 'Bioinformatics', 4, 5, 'COS-MOLBIO'),

    -- BS in Biology major in Systematics and Ecology (COS-SYSBIO)
    ('SYSBIO1', 'Systematic Biology', 4, 5, 'COS-SYSBIO'),
    ('SYSBIO2', 'Ecology and Environmental Science', 4, 5, 'COS-SYSBIO'),
    ('SYSBIO3', 'Biodiversity Conservation', 4, 5, 'COS-SYSBIO'),
    ('SYSBIO4', 'Marine Biology', 4, 5, 'COS-SYSBIO'),
    ('SYSBIO5', 'Freshwater Ecology', 4, 5, 'COS-SYSBIO'),
    ('SYSBIO6', 'Field Methods in Ecology', 3, 5, 'COS-SYSBIO'),

    -- BS in Chemistry (COS-CHEM)
    ('CHEM1', 'Analytical Chemistry', 4, 5, 'COS-CHEM'),
    ('CHEM2', 'Organic Chemistry 1', 4, 5, 'COS-CHEM'),
    ('CHEM3', 'Organic Chemistry 2', 4, 5, 'COS-CHEM'),
    ('CHEM4', 'Physical Chemistry', 4, 5, 'COS-CHEM'),
    ('CHEM5', 'Inorganic Chemistry', 4, 5, 'COS-CHEM'),
    ('CHEM6', 'Instrumental Methods of Analysis', 4, 5, 'COS-CHEM'),

    -- BS in Chemistry major in Food Science (COS-CHEMFS)
    ('CHEMFS1', 'Food Chemistry', 4, 5, 'COS-CHEMFS'),
    ('CHEMFS2', 'Food Microbiology', 4, 5, 'COS-CHEMFS'),
    ('CHEMFS3', 'Food Analysis', 4, 5, 'COS-CHEMFS'),
    ('CHEMFS4', 'Food Processing Technology', 4, 5, 'COS-CHEMFS'),

    -- BS in Human Biology (COS-HUMBIO)
    ('HUMBIO1', 'Introduction to Human Biology', 4, 5, 'COS-HUMBIO'),
    ('HUMBIO2', 'Advanced Human Physiology', 4, 5, 'COS-HUMBIO'),
    ('HUMBIO3', 'Genetics and Human Disease', 4, 5, 'COS-HUMBIO'),
    ('HUMBIO4', 'Human Reproductive Biology', 4, 5, 'COS-HUMBIO'),

    -- BS in Mathematics with specialization in Business Applications (COS-MATHBA)
    ('MATHBA1', 'Mathematics of Investments', 4, 5, 'COS-MATHBA'),
    ('MATHBA2', 'Operations Research', 4, 5, 'COS-MATHBA'),
    ('MATHBA3', 'Quantitative Methods for Decision Making', 4, 5, 'COS-MATHBA'),

    -- BS in Mathematics with specialization in Computer Applications (COS-MATHCA)
    ('MATHCA1', 'Mathematical Foundations of Computing', 4, 5, 'COS-MATHCA'),
    ('MATHCA2', 'Numerical Analysis', 4, 5, 'COS-MATHCA'),
    ('MATHCA3', 'Algorithms and Mathematical Optimization', 4, 5, 'COS-MATHCA'),

    -- BS in Statistics Major in Actuarial Science (COS-STAT)
    ('STAT1', 'Probability Theory', 4, 5, 'COS-STAT'),
    ('STAT2', 'Statistical Inference', 4, 5, 'COS-STAT'),
    ('STAT3', 'Actuarial Mathematics', 4, 5, 'COS-STAT'),
    ('STAT4', 'Risk Theory', 4, 5, 'COS-STAT'),

    -- BS in Physics with specialization in Medical Instrumentation (COS-PHYSMED)
    ('PHYSMED1', 'Medical Physics', 4, 5, 'COS-PHYSMED'),
    ('PHYSMED2', 'Biomedical Instrumentation', 4, 5, 'COS-PHYSMED'),
    ('PHYSMED3', 'Radiation Physics and Dosimetry', 4, 5, 'COS-PHYSMED'),
    ('PHYSMED4', 'Medical Imaging', 4, 5, 'COS-PHYSMED'),

    -- Bachelor of Science in Animal Biology (COS-ANBIO)
    ('ANBIO1', 'Zoology', 4, 5, 'COS-ANBIO'),
    ('ANBIO2', 'Animal Physiology', 4, 5, 'COS-ANBIO'),
    ('ANBIO3', 'Animal Genetics', 4, 5, 'COS-ANBIO'),
    ('ANBIO4', 'Wildlife Biology', 4, 5, 'COS-ANBIO');
    
INSERT INTO Courses (course_id, course_name, units, college_id, program_id)
VALUES
    -- Core Engineering Courses (Common Across GCOE Programs)
    ('ENGCAL1', 'Engineering Calculus 1', 4, 6, NULL),
    ('ENGCAL2', 'Engineering Calculus 2', 4, 6, NULL),
    ('ENGPHY1', 'Engineering Physics 1', 4, 6, NULL),
    ('ENGPHY2', 'Engineering Physics 2', 4, 6, NULL),
    ('ENGSTAT', 'Engineering Statistics', 3, 6, NULL),
    ('ENGDRAW', 'Engineering Drawing and CAD', 3, 6, NULL),
    ('ENGMATH', 'Engineering Mathematics', 3, 6, NULL),
    ('ENGECON', 'Engineering Economics', 3, 6, NULL),
    ('ENGMECH', 'Engineering Mechanics', 3, 6, NULL),
    ('ENGETHICS', 'Engineering Ethics and Practices', 3, 6, NULL),

    -- Chemical Engineering (GCOE-CHE)
    ('CHEMAT1', 'Material and Energy Balances', 3, 6, 'GCOE-CHE'),
    ('CHEMENG1', 'Chemical Engineering Thermodynamics', 3, 6, 'GCOE-CHE'),
    ('CHEMENG2', 'Transport Phenomena', 4, 6, 'GCOE-CHE'),
    ('CHEMREA1', 'Chemical Reaction Engineering', 3, 6, 'GCOE-CHE'),
    ('CHEMPROD', 'Chemical Process Industries', 3, 6, 'GCOE-CHE'),
    ('CHEMPLANT', 'Plant Design and Economics', 4, 6, 'GCOE-CHE'),

    -- Civil Engineering (GCOE-CE)
    ('CESTRUC1', 'Structural Analysis 1', 3, 6, 'GCOE-CE'),
    ('CESTRUC2', 'Structural Analysis 2', 3, 6, 'GCOE-CE'),
    ('CESOIL', 'Soil Mechanics', 4, 6, 'GCOE-CE'),
    ('CEHYDRO', 'Hydraulics and Hydrology', 4, 6, 'GCOE-CE'),
    ('CECONST', 'Construction Methods and Project Management', 3, 6, 'GCOE-CE'),
    ('CEPLANNING', 'Urban and Regional Planning', 3, 6, 'GCOE-CE'),

    -- Electronics and Computer Engineering (GCOE-ECE)
    ('ECEBASIC', 'Basic Electronics', 3, 6, 'GCOE-ECE'),
    ('ECECOMM1', 'Communication Systems 1', 3, 6, 'GCOE-ECE'),
    ('ECECOMM2', 'Communication Systems 2', 3, 6, 'GCOE-ECE'),
    ('ECECIRCU', 'Digital and Analog Circuits', 4, 6, 'GCOE-ECE'),
    ('ECEMICRO', 'Microprocessors and Embedded Systems', 4, 6, 'GCOE-ECE'),
    ('ECENET', 'Network Engineering and Protocols', 3, 6, 'GCOE-ECE'),

    -- Industrial Engineering (GCOE-IE)
    ('IEOPER1', 'Operations Research 1', 3, 6, 'GCOE-IE'),
    ('IEOPER2', 'Operations Research 2', 3, 6, 'GCOE-IE'),
    ('IEPROD', 'Production Systems', 4, 6, 'GCOE-IE'),
    ('IEHUMFAC', 'Human Factors and Ergonomics', 3, 6, 'GCOE-IE'),
    ('IEQUALITY', 'Quality Engineering and Management', 3, 6, 'GCOE-IE'),
    ('IESYSTEM', 'Systems Engineering and Design', 3, 6, 'GCOE-IE'),

    -- Manufacturing Engineering and Management (GCOE-MEM)
    ('MEMMAT', 'Materials Engineering', 4, 6, 'GCOE-MEM'),
    ('MEMPROD', 'Production and Operations Management', 4, 6, 'GCOE-MEM'),
    ('MEMAUTO', 'Automation and Robotics', 4, 6, 'GCOE-MEM'),
    ('MEMCADD', 'Computer-Aided Design and Manufacturing', 4, 6, 'GCOE-MEM'),
    ('MEMLEAN', 'Lean Manufacturing Systems', 3, 6, 'GCOE-MEM'),
    ('MEMLOG', 'Logistics and Supply Chain Management', 3, 6, 'GCOE-MEM'),

    -- Mechanical Engineering (GCOE-ME)
    ('MEFLUID1', 'Fluid Mechanics 1', 3, 6, 'GCOE-ME'),
    ('MEFLUID2', 'Fluid Mechanics 2', 3, 6, 'GCOE-ME'),
    ('METHEMO', 'Thermodynamics', 3, 6, 'GCOE-ME'),
    ('MEMATERIAL', 'Strength of Materials', 3, 6, 'GCOE-ME'),
    ('MEMACHIN', 'Machine Design', 4, 6, 'GCOE-ME'),
    ('MEMECHA', 'Mechanical Vibrations and Mechatronics', 4, 6, 'GCOE-ME');
    
INSERT INTO Courses (course_id, course_name, units, college_id, program_id)
VALUES
    -- Core Liberal Arts Courses (Common Across CLA Programs)
    ('GENPHILO', 'General Philosophy', 3, 4, NULL),
    ('ETHICS', 'Ethics and Moral Philosophy', 3, 4, NULL),
    ('INTROHUM', 'Introduction to Humanities', 3, 4, NULL),
    ('RESMETH', 'Research Methods in Social Sciences', 3, 4, NULL),
    ('GLOBDEV', 'Globalization and Development', 3, 4, NULL),
    ('WRITCOM', 'Written Communication and Rhetoric', 3, 4, NULL),
    ('ORALCOM', 'Oral Communication and Public Speaking', 3, 4, NULL),

    -- Behavioral Sciences, Major in Organizational and Social Systems Development (CLA-BSHS-OSSD)
    ('BSHS101', 'Introduction to Behavioral Sciences', 3, 4, 'CLA-BSHS-OSSD'),
    ('BSHS102', 'Theories of Social Systems', 3, 4, 'CLA-BSHS-OSSD'),
    ('BSHS103', 'Group Dynamics and Organizational Behavior', 3, 4, 'CLA-BSHS-OSSD'),
    ('BSHS104', 'Community Development and Engagement', 3, 4, 'CLA-BSHS-OSSD'),
    ('BSHS105', 'Behavioral Research and Analysis', 3, 4, 'CLA-BSHS-OSSD'),

    -- Development Studies (CLA-DS)
    ('DS101', 'Introduction to Development Studies', 3, 4, 'CLA-DS'),
    ('DS102', 'Political Economy of Development', 3, 4, 'CLA-DS'),
    ('DS103', 'Sustainable Development Goals and Practices', 3, 4, 'CLA-DS'),
    ('DS104', 'Development Policy and Advocacy', 3, 4, 'CLA-DS'),
    ('DS105', 'Gender and Development', 3, 4, 'CLA-DS'),

    -- History (CLA-HIS)
    ('HIS101', 'Introduction to Philippine History', 3, 4, 'CLA-HIS'),
    ('HIS102', 'World History: Ancient to Modern', 3, 4, 'CLA-HIS'),
    ('HIS103', 'Historical Methods and Analysis', 3, 4, 'CLA-HIS'),
    ('HIS104', 'Asian History and Cultures', 3, 4, 'CLA-HIS'),
    ('HIS105', 'Contemporary Global Issues in Historical Context', 3, 4, 'CLA-HIS'),

    -- Southeast Asian Studies (CLA-SEA)
    ('SEA101', 'Introduction to Southeast Asian Studies', 3, 4, 'CLA-SEA'),
    ('SEA102', 'History of Southeast Asia', 3, 4, 'CLA-SEA'),
    ('SEA103', 'Politics and Governance in Southeast Asia', 3, 4, 'CLA-SEA'),
    ('SEA104', 'Cultural Practices in Southeast Asia', 3, 4, 'CLA-SEA'),
    ('SEA105', 'Economic Development in Southeast Asia', 3, 4, 'CLA-SEA'),

    -- Literature, Major in Creative Writing (CLA-LIT-CW)
    ('LITCW101', 'Introduction to Creative Writing', 3, 4, 'CLA-LIT-CW'),
    ('LITCW102', 'Poetry Writing and Techniques', 3, 4, 'CLA-LIT-CW'),
    ('LITCW103', 'Fiction Writing: Short Stories and Novels', 3, 4, 'CLA-LIT-CW'),
    ('LITCW104', 'Playwriting and Screenwriting', 3, 4, 'CLA-LIT-CW'),
    ('LITCW105', 'Creative Writing for Multimedia', 3, 4, 'CLA-LIT-CW'),

    -- Political Science (CLA-PLS)
    ('PLS101', 'Introduction to Political Science', 3, 4, 'CLA-PLS'),
    ('PLS102', 'Comparative Politics and Systems', 3, 4, 'CLA-PLS'),
    ('PLS103', 'Philippine Government and Constitution', 3, 4, 'CLA-PLS'),
    ('PLS104', 'International Politics and Policy', 3, 4, 'CLA-PLS'),
    ('PLS105', 'Political Research and Methodology', 3, 4, 'CLA-PLS'),

    -- Communication Arts (CLA-CA)
    ('CA101', 'Introduction to Communication Arts', 3, 4, 'CLA-CA'),
    ('CA102', 'Media Writing and Storytelling', 3, 4, 'CLA-CA'),
    ('CA103', 'Visual and Performing Arts', 3, 4, 'CLA-CA'),
    ('CA104', 'Media and Society', 3, 4, 'CLA-CA'),
    ('CA105', 'Communication Campaigns and Strategies', 3, 4, 'CLA-CA'),

    -- Psychology (CLA-PSY)
    ('PSY101', 'Introduction to Psychology', 3, 4, 'CLA-PSY'),
    ('PSY102', 'Cognitive Psychology', 3, 4, 'CLA-PSY'),
    ('PSY103', 'Social Psychology', 3, 4, 'CLA-PSY'),
    ('PSY104', 'Developmental Psychology', 3, 4, 'CLA-PSY'),
    ('PSY105', 'Clinical and Counseling Psychology', 3, 4, 'CLA-PSY');



INSERT INTO Courses (course_id, course_name, units, college_id, program_id)
VALUES
    -- Core Law Courses (AB-LSSD Program)
    ('LAW101', 'Introduction to Law and Legal Systems', 3, 3, 'AB-LSSD'),
    ('LAW102', 'Legal Writing and Research', 3, 3, 'AB-LSSD'),
    ('LAW103', 'Statutory Construction and Interpretation', 3, 3, 'AB-LSSD'),
    ('LAW104', 'Ethics and the Legal Profession', 3, 3, 'AB-LSSD'),
    ('LAW105', 'Constitutional Law 1', 3, 3, 'AB-LSSD'),
    ('LAW106', 'Constitutional Law 2', 3, 3, 'AB-LSSD'),

    -- Civil Law
    ('CIVLAW1', 'Persons and Family Relations', 3, 3, 'AB-LSSD'),
    ('CIVLAW2', 'Obligations and Contracts', 3, 3, 'AB-LSSD'),
    ('CIVLAW3', 'Property Law', 3, 3, 'AB-LSSD'),
    ('CIVLAW4', 'Wills and Succession', 3, 3, 'AB-LSSD'),
    ('CIVLAW5', 'Special Contracts', 3, 3, 'AB-LSSD'),

    -- Criminal Law
    ('CRIMLAW1', 'Introduction to Criminal Law', 3, 3, 'AB-LSSD'),
    ('CRIMLAW2', 'Criminal Procedure', 3, 3, 'AB-LSSD'),
    ('CRIMLAW3', 'Crimes and Penalties', 3, 3, 'AB-LSSD'),

    -- Labor Law
    ('LABLAW1', 'Labor Standards and Relations', 3, 3, 'AB-LSSD'),
    ('LABLAW2', 'Social Legislation', 3, 3, 'AB-LSSD'),

    -- Taxation Law
    ('TAXLAW1', 'General Principles of Taxation', 3, 3, 'AB-LSSD'),
    ('TAXLAW2', 'Taxation on Income, Transfer, and Business', 3, 3, 'AB-LSSD'),

    -- Commercial Law
    ('COMLAW1', 'General Principles of Commercial Law', 3, 3, 'AB-LSSD'),
    ('COMLAW2', 'Negotiable Instruments and Banking Laws', 3, 3, 'AB-LSSD'),
    ('COMLAW3', 'Corporation Law', 3, 3, 'AB-LSSD'),
    ('COMLAW4', 'Special Commercial Laws', 3, 3, 'AB-LSSD'),

    -- Remedial Law
    ('REMLAW1', 'Civil Procedure', 3, 3, 'AB-LSSD'),
    ('REMLAW2', 'Special Proceedings', 3, 3, 'AB-LSSD'),
    ('REMLAW3', 'Evidence', 3, 3, 'AB-LSSD'),

    -- International Law
    ('INTLAW1', 'Public International Law', 3, 3, 'AB-LSSD'),
    ('INTLAW2', 'Private International Law', 3, 3, 'AB-LSSD'),

    -- Administrative Law
    ('ADMLAW1', 'Administrative Law and the Law on Public Officers', 3, 3, 'AB-LSSD'),

    -- Legal Practice and Advocacy
    ('LEGALPRAC', 'Legal Counseling and Advocacy', 3, 3, 'AB-LSSD'),
    ('MOOTCOURT', 'Moot Court and Trial Techniques', 3, 3, 'AB-LSSD'),
    ('BARREV', 'Bar Review', 3, 3, 'AB-LSSD');

INSERT INTO Courses (course_id, course_name, units, college_id, program_id)
VALUES
    -- Core Education Courses (Common Across BAGCED Programs)
    ('EDUC101', 'Introduction to Education', 3, 1, NULL),
    ('EDUC102', 'Foundations of Curriculum Development', 3, 1, NULL),
    ('EDUC103', 'Educational Psychology', 3, 1, NULL),
    ('EDUC104', 'Assessment and Evaluation in Education', 3, 1, NULL),
    ('EDUC105', 'Teaching Strategies and Classroom Management', 3, 1, NULL),
    ('EDUC106', 'Technology Integration in Education', 3, 1, NULL),
    ('EDUC107', 'Research in Education', 3, 1, NULL),
    ('EDUC108', 'Educational Leadership and Policy', 3, 1, NULL),

    -- Counseling and Educational Psychology (BAGCED-CEP)
    ('CEP101', 'Introduction to Counseling', 3, 1, 'BAGCED-CEP'),
    ('CEP102', 'Theories of Personality and Counseling', 3, 1, 'BAGCED-CEP'),
    ('CEP103', 'Developmental Psychology in Education', 3, 1, 'BAGCED-CEP'),
    ('CEP104', 'Group Counseling Techniques', 3, 1, 'BAGCED-CEP'),
    ('CEP105', 'Guidance Program Development', 3, 1, 'BAGCED-CEP'),

    -- Educational Leadership and Management (BAGCED-ELM)
    ('ELM101', 'Introduction to Educational Leadership', 3, 1, 'BAGCED-ELM'),
    ('ELM102', 'School Organization and Management', 3, 1, 'BAGCED-ELM'),
    ('ELM103', 'Leadership in Diverse Educational Settings', 3, 1, 'BAGCED-ELM'),
    ('ELM104', 'Education Policy and Governance', 3, 1, 'BAGCED-ELM'),
    ('ELM105', 'Ethics in Educational Leadership', 3, 1, 'BAGCED-ELM'),

    -- English and Applied Linguistics (BAGCED-EAL)
    ('EAL101', 'Introduction to Linguistics', 3, 1, 'BAGCED-EAL'),
    ('EAL102', 'Theories of Language Acquisition', 3, 1, 'BAGCED-EAL'),
    ('EAL103', 'Language and Literacy in Education', 3, 1, 'BAGCED-EAL'),
    ('EAL104', 'English for Specific Purposes', 3, 1, 'BAGCED-EAL'),
    ('EAL105', 'Curriculum Design in English Language Teaching', 3, 1, 'BAGCED-EAL'),

    -- Physical Education (BAGCED-PE)
    ('PE101', 'Foundations of Physical Education', 3, 1, 'BAGCED-PE'),
    ('PE102', 'Kinesiology and Biomechanics', 3, 1, 'BAGCED-PE'),
    ('PE103', 'Sports and Recreation Management', 3, 1, 'BAGCED-PE'),
    ('PE104', 'Fitness and Wellness Education', 3, 1, 'BAGCED-PE'),
    ('PE105', 'Teaching Strategies in Physical Education', 3, 1, 'BAGCED-PE'),

    -- Science Education (BAGCED-SE)
    ('SE101', 'Introduction to Science Education', 3, 1, 'BAGCED-SE'),
    ('SE102', 'Physics for Educators', 3, 1, 'BAGCED-SE'),
    ('SE103', 'Chemistry for Educators', 3, 1, 'BAGCED-SE'),
    ('SE104', 'Biology for Educators', 3, 1, 'BAGCED-SE'),
    ('SE105', 'Environmental Science Education', 3, 1, 'BAGCED-SE'),

    -- Offshore and Extension Programs (BAGCED-OEP)
    ('OEP101', 'Global Trends in Education', 3, 1, 'BAGCED-OEP'),
    ('OEP102', 'Intercultural Competence in Education', 3, 1, 'BAGCED-OEP'),
    ('OEP103', 'International Comparative Education', 3, 1, 'BAGCED-OEP'),
    ('OEP104', 'Project Management for Education', 3, 1, 'BAGCED-OEP'),
    ('OEP105', 'Innovative Practices in Teaching and Learning', 3, 1, 'BAGCED-OEP'),

    -- Center for Innovative Education Solutions (BAGCED-CIESOL)
    ('CIESOL101', 'Educational Innovations and Technologies', 3, 1, 'BAGCED-CIESOL'),
    ('CIESOL102', 'Design Thinking in Education', 3, 1, 'BAGCED-CIESOL'),
    ('CIESOL103', 'Digital Learning Tools and Platforms', 3, 1, 'BAGCED-CIESOL'),
    ('CIESOL104', 'Gamification in Education', 3, 1, 'BAGCED-CIESOL'),
    ('CIESOL105', 'Implementing E-Learning Solutions', 3, 1, 'BAGCED-CIESOL');
    
INSERT INTO Courses (course_id, course_name, units, college_id, program_id)
VALUES
    -- Core Economics Courses (Common Across SOE Programs)
    ('ECON101', 'Introduction to Microeconomics', 3, 8, NULL),
    ('ECON102', 'Introduction to Macroeconomics', 3, 8, NULL),
    ('ECON103', 'Mathematical Methods for Economics', 3, 8, NULL),
    ('ECON104', 'Statistics for Economists', 3, 8, NULL),
    ('ECON105', 'Econometrics 1', 3, 8, NULL),
    ('ECON106', 'Econometrics 2', 3, 8, NULL),
    ('ECON107', 'History of Economic Thought', 3, 8, NULL),
    ('ECON108', 'Development Economics', 3, 8, NULL),
    ('ECON109', 'Public Economics', 3, 8, NULL),
    ('ECON110', 'International Economics', 3, 8, NULL),
    ('ECON111', 'Environmental Economics', 3, 8, NULL),
    ('ECON112', 'Economic Research Methods', 3, 8, NULL),

    -- Bachelor of Science in Applied Economics major in Industrial Economics (SOE-BS-AEI)
    ('AEI101', 'Principles of Industrial Organization', 3, 8, 'SOE-BS-AEI'),
    ('AEI102', 'Game Theory in Industrial Economics', 3, 8, 'SOE-BS-AEI'),
    ('AEI103', 'Economic Regulation and Policy', 3, 8, 'SOE-BS-AEI'),
    ('AEI104', 'Innovation and Technology in Economics', 3, 8, 'SOE-BS-AEI'),

    -- Bachelor of Science in Applied Economics major in Financial Economics (SOE-BS-AEF)
    ('AEF101', 'Financial Markets and Institutions', 3, 8, 'SOE-BS-AEF'),
    ('AEF102', 'Behavioral Economics in Finance', 3, 8, 'SOE-BS-AEF'),
    ('AEF103', 'Corporate Finance and Valuation', 3, 8, 'SOE-BS-AEF'),
    ('AEF104', 'Risk Management and Derivatives', 3, 8, 'SOE-BS-AEF'),

    -- Bachelor of Arts major in Economics (SOE-AB-ECM)
    ('ECM101', 'Philosophy of Economics', 3, 8, 'SOE-AB-ECM'),
    ('ECM102', 'Cultural and Political Economics', 3, 8, 'SOE-AB-ECM'),
    ('ECM103', 'Economic Anthropology', 3, 8, 'SOE-AB-ECM'),
    ('ECM104', 'Comparative Economic Systems', 3, 8, 'SOE-AB-ECM'),

    -- Elective Courses for SOE
    ('ELEC101', 'Health Economics', 3, 8, NULL),
    ('ELEC102', 'Labor Economics', 3, 8, NULL),
    ('ELEC103', 'Urban and Regional Economics', 3, 8, NULL),
    ('ELEC104', 'Energy Economics', 3, 8, NULL),
    ('ELEC105', 'Political Economy', 3, 8, NULL);


CREATE TABLE Classes (
    class_id INT NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    program_id VARCHAR(20),
    instructor_id INT,
    college_id INT NOT NULL,
    room_number VARCHAR(20),
    max_capacity INT,
    term VARCHAR(15) NOT NULL CHECK (term IN ('First Term', 'Second Term', 'Third Term')),
    school_year VARCHAR(10) NOT NULL,
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
    -- Existing prerequisites
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
    ('STALGC',  'CSALGCM'),    -- STALGC requires CSALGCM
    ('STHCUIX', 'CSSWENG'),    -- STHCUIX requires CSSWENG
    ('STINTSY', 'CSINTSY'),    -- STINTSY requires CSINTSY
    ('STDISCM', 'CSOPESY'),    -- STDISCM requires CSOPESY
    ('STMETRE', 'STALGC'),     -- STMETRE requires STALGC
    ('BASSTAT', 'BASMATH'),    -- BASSTAT requires BASMATH
    ('CSMODEL', 'CSMATH1'),    -- CSMODEL requires CSMATH1 (Differential Calculus)
    ('CSMATH2', 'CSMATH1'),    -- CSMATH2 requires CSMATH1 (Differential Calculus)
    ('CSNETWK', 'CSARCH1'),    -- CSNETWK requires CSARCH1
    ('CEETRN2', 'CEETRN1'),    -- CEETRN2 requires CEETRN1
    ('CEETRN3', 'CEETRN2'),    -- CEETRN3 requires CEETRN2
    ('CEDISP2', 'CEDISP1'),    -- CEDISP2 requires CEDISP1 (Digital Signal Processing 1)
    ('CEMICRO', 'CEETRN2'),    -- CEMICRO requires CEETRN2
    ('CECNTRL', 'CEMICRO'),    -- CECNTRL requires CEMICRO
    ('CEPARCO', 'CECNTRL'),    -- CEPARCO requires CECNTRL
    ('CERESME', 'CEPARCO'),    -- CERESME requires CEPARCO
    ('NSSECU2', 'NSSECU1'),    -- NSSECU2 requires NSSECU1
    ('NSSECU3', 'NSSECU2'),    -- NSSECU3 requires NSSECU2
    ('NSEMBED', 'NSETRON'),    -- NSEMBED requires NSETRON
    ('NSDSYST', 'NSCOM02'),    -- NSDSYST requires NSCOM02
    ('NSRESME', 'NSDSYST'),    -- NSRESME requires NSDSYST
    ('ITISHCI', 'ITISORG'),    -- ITISHCI requires ITISORG
    ('ITISDEV', 'ITISHCI'),    -- ITISDEV requires ITISHCI
    ('ITISSES', 'ITISDEV'),    -- ITISSES requires ITISDEV
    ('ITISPRJ', 'ITISSES'),    -- ITISPRJ requires ITISSES
    ('ISTREND', 'ITISPRJ'),    -- ISTREND requires ITISPRJ
    ('ISANDE1', 'ISINFOM'),    -- ISANDE1 requires ISINFOM
    ('ISANDE2', 'ISANDE1'),    -- ISANDE2 requires ISANDE1
    ('ISSYSQA', 'ISANDE2'),    -- ISSYSQA requires ISANDE2
    ('ISENTAR', 'ISSYSAD'),    -- ISENTAR requires ISSYSAD
    ('ISRESME', 'ISSYSQA'),    -- ISRESME requires ISSYSQA
    ('ISPRENL', 'ISINFOM'),    -- ISPRENL requires ISINFOM
    ('ISSTRMA', 'ISENTAR');    -- ISSTRMA requires ISENTAR

INSERT INTO Prerequisites (course_id, prerequisite_id)
VALUES
    -- Core Business Courses (Common Across COB Programs)
    ('BUSTAT', 'BUSMATH'), -- Business Statistics requires Business Mathematics
    ('BFIN101', 'BUSMATH'), -- Introduction to Financial Management requires Business Mathematics
    ('BRES101', 'BECON01'), -- Business Research Methods requires Introduction to Microeconomics
    ('BETHICS', 'BMGT101'), -- Business Ethics requires Principles of Management

    -- Bachelor of Science in Accountancy (COB-ACC)
    ('ACC102', 'ACC101'), -- Intermediate Accounting 2 requires Intermediate Accounting 1
    ('ACC103', 'ACC102'), -- Advanced Accounting requires Intermediate Accounting 2
    ('ACC105', 'ACC104'), -- Auditing and Assurance 1 requires Financial Accounting and Reporting

    -- Bachelor of Science in Advertising Management (COB-ADV)
    ('ADV102', 'ADV101'), -- Creative Strategies in Advertising requires Introduction to Advertising
    ('ADV105', 'ADV103'), -- Advertising Campaign Management requires Advertising Media Planning

    -- Bachelor of Science in Applied Corporate Management (COB-ACM)
    ('ACM102', 'ACM101'), -- Corporate Governance and Risk Management requires Introduction to Corporate Management
    ('ACM104', 'BMGT101'), -- Operations and Supply Chain Management requires Principles of Management

    -- Bachelor of Science in Business Management (COB-BM)
    ('BM102', 'BM101'), -- Strategic Management requires Business Organization and Environment
    ('BM104', 'BM103'), -- Project Management requires Operations Management

    -- Bachelor of Science in Entrepreneurship (COB-ENT)
    ('ENT102', 'ENT101'), -- Business Opportunity Identification requires Introduction to Entrepreneurship
    ('ENT105', 'ENT101'), -- Entrepreneurial Finance requires Introduction to Entrepreneurship

    -- Bachelor of Science in Interdisciplinary Business Studies (COB-IBS)
    ('IBS102', 'IBS101'), -- Cultural Diversity in Business requires Interdisciplinary Perspectives in Business
    ('IBS104', 'IBS103'), -- Corporate Social Innovation requires Global Business Strategies

    -- Bachelor of Science in Legal Management (COB-LM)
    ('LM102', 'LM101'), -- Business and Commercial Laws requires Introduction to Legal Management
    ('LM103', 'LM102'), -- Contracts and Obligations requires Business and Commercial Laws

    -- Bachelor of Science in Management of Financial Institutions (COB-MFI)
    ('MFI103', 'MFI101'), -- Financial Markets and Instruments requires Introduction to Financial Institutions
    ('MFI104', 'MFI102'), -- Banking Operations and Management requires Risk Management in Financial Institutions

    -- Bachelor of Science in Marketing Management (COB-MM)
    ('MM102', 'BMKT101'), -- Integrated Marketing Communications requires Principles of Marketing
    ('MM104', 'MM103'), -- Brand Management requires Marketing Analytics

    -- Bachelor of Science in Management Accounting with Business Analytics (COB-MABA)
    ('MABA102', 'MABA101'), -- Cost Accounting and Control requires Introduction to Management Accounting
    ('MABA104', 'MABA103'), -- Business Analytics for Accounting requires Management Accounting for Decision Making

    -- Bachelor of Science in Management Accounting (COB-MA)
    ('MA102', 'MA101'), -- Cost Accounting and Budgeting requires Principles of Management Accounting
    ('MA104', 'MA103'); -- Strategic Management Accounting requires Financial Management for Accountants

INSERT INTO Prerequisites (course_id, prerequisite_id)
VALUES
    -- Core Science Courses
    ('COSCHEM2', 'COSCHEM1'), -- General Chemistry 2 requires General Chemistry 1
    ('COSPHYS2', 'COSPHYS1'), -- Physics 2 requires Physics 1
    ('COSMATH2', 'COSMATH1'), -- Calculus 2 requires Calculus 1
    ('COSRES2', 'COSRES1'),   -- Advanced Research Methods requires Introduction to Research in Science
    ('COSBIO2', 'COSBIO1'),   -- General Biology 2 requires General Biology 1

    -- Bachelor of Science in Biochemistry (COS-BIOCHEM)
    ('BIOCHEM2', 'BIOCHEM1'), -- Metabolic Biochemistry requires Introduction to Biochemistry
    ('BIOCHEM3', 'BIOCHEM2'), -- Molecular Biology and Biochemistry requires Metabolic Biochemistry
    ('BIOCHEM4', 'BIOCHEM1'), -- Biochemistry Laboratory Techniques requires Introduction to Biochemistry
    ('BIOCHEM5', 'BIOCHEM2'), -- Enzymology requires Metabolic Biochemistry
    ('BIOCHEM7', 'BIOCHEM5'), -- Advanced Biochemistry requires Enzymology

    -- BS in Biology major in Medical Biology (COS-MBIO)
    ('MBIO2', 'COSBIO1'),     -- Human Anatomy and Physiology requires General Biology 1
    ('MBIO3', 'MBIO2'),       -- Immunology requires Human Anatomy and Physiology
    ('MBIO4', 'MBIO3'),       -- Medical Microbiology requires Immunology
    ('MBIO5', 'MBIO2'),       -- Pathophysiology requires Human Anatomy and Physiology
    ('MBIO6', 'BIOCHEM1'),    -- Clinical Biochemistry requires Introduction to Biochemistry

    -- BS in Biology major in Molecular Biology and Biotechnology (COS-MOLBIO)
    ('MOLBIO2', 'COSBIO1'),   -- Molecular Genetics requires General Biology 1
    ('MOLBIO3', 'MOLBIO2'),   -- Recombinant DNA Technology requires Molecular Genetics
    ('MOLBIO4', 'MOLBIO3'),   -- Protein Engineering requires Recombinant DNA Technology
    ('MOLBIO6', 'MOLBIO2'),   -- Bioinformatics requires Molecular Genetics

    -- BS in Biology major in Systematics and Ecology (COS-SYSBIO)
    ('SYSBIO2', 'COSBIO1'),   -- Ecology and Environmental Science requires General Biology 1
    ('SYSBIO3', 'SYSBIO2'),   -- Biodiversity Conservation requires Ecology and Environmental Science
    ('SYSBIO4', 'SYSBIO3'),   -- Marine Biology requires Biodiversity Conservation
    ('SYSBIO5', 'SYSBIO2'),   -- Freshwater Ecology requires Ecology and Environmental Science
    ('SYSBIO6', 'SYSBIO2'),   -- Field Methods in Ecology requires Ecology and Environmental Science

    -- BS in Chemistry (COS-CHEM)
    ('CHEM2', 'COSCHEM1'),    -- Organic Chemistry 1 requires General Chemistry 1
    ('CHEM3', 'CHEM2'),       -- Organic Chemistry 2 requires Organic Chemistry 1
    ('CHEM4', 'COSMATH1'),    -- Physical Chemistry requires Calculus 1
    ('CHEM5', 'COSCHEM1'),    -- Inorganic Chemistry requires General Chemistry 1
    ('CHEM6', 'CHEM4'),       -- Instrumental Methods of Analysis requires Physical Chemistry

    -- BS in Chemistry major in Food Science (COS-CHEMFS)
    ('CHEMFS1', 'COSCHEM1'),  -- Food Chemistry requires General Chemistry 1
    ('CHEMFS2', 'CHEMFS1'),   -- Food Microbiology requires Food Chemistry
    ('CHEMFS3', 'CHEMFS1'),   -- Food Analysis requires Food Chemistry
    ('CHEMFS4', 'CHEMFS3'),   -- Food Processing Technology requires Food Analysis

    -- BS in Human Biology (COS-HUMBIO)
    ('HUMBIO2', 'COSBIO1'),   -- Advanced Human Physiology requires General Biology 1
    ('HUMBIO3', 'HUMBIO2'),   -- Genetics and Human Disease requires Advanced Human Physiology
    ('HUMBIO4', 'HUMBIO2'),   -- Human Reproductive Biology requires Advanced Human Physiology

    -- BS in Mathematics with specialization in Business Applications (COS-MATHBA)
    ('MATHBA2', 'COSMATH1'),  -- Operations Research requires Calculus 1
    ('MATHBA3', 'MATHBA2'),   -- Quantitative Methods for Decision Making requires Operations Research

    -- BS in Mathematics with specialization in Computer Applications (COS-MATHCA)
    ('MATHCA2', 'COSMATH1'),  -- Numerical Analysis requires Calculus 1
    ('MATHCA3', 'MATHCA2'),   -- Algorithms and Mathematical Optimization requires Numerical Analysis

    -- BS in Statistics Major in Actuarial Science (COS-STAT)
    ('STAT2', 'STAT1'),       -- Statistical Inference requires Probability Theory
    ('STAT3', 'STAT2'),       -- Actuarial Mathematics requires Statistical Inference
    ('STAT4', 'STAT3'),       -- Risk Theory requires Actuarial Mathematics

    -- BS in Physics with specialization in Medical Instrumentation (COS-PHYSMED)
    ('PHYSMED2', 'COSPHYS1'), -- Biomedical Instrumentation requires Physics 1
    ('PHYSMED3', 'COSPHYS2'), -- Radiation Physics and Dosimetry requires Physics 2
    ('PHYSMED4', 'PHYSMED2'), -- Medical Imaging requires Biomedical Instrumentation

    -- Bachelor of Science in Animal Biology (COS-ANBIO)
    ('ANBIO2', 'COSBIO1'),    -- Animal Physiology requires General Biology 1
    ('ANBIO3', 'COSBIO1'),    -- Animal Genetics requires General Biology 1
    ('ANBIO4', 'ANBIO2');     -- Wildlife Biology requires Animal Physiology
    
INSERT INTO Prerequisites (course_id, prerequisite_id)
VALUES
    -- Core Engineering Courses
    ('ENGCAL2', 'ENGCAL1'), -- Engineering Calculus 2 requires Engineering Calculus 1
    ('ENGPHY2', 'ENGPHY1'), -- Engineering Physics 2 requires Engineering Physics 1
    ('ENGMATH', 'ENGCAL1'), -- Engineering Mathematics requires Engineering Calculus 1
    ('ENGMECH', 'ENGPHY1'), -- Engineering Mechanics requires Engineering Physics 1
    ('ENGECON', 'ENGSTAT'), -- Engineering Economics requires Engineering Statistics

    -- Chemical Engineering (GCOE-CHE)
    ('CHEMENG1', 'ENGCAL2'), -- Chemical Engineering Thermodynamics requires Engineering Calculus 2
    ('CHEMENG2', 'CHEMENG1'), -- Transport Phenomena requires Chemical Engineering Thermodynamics
    ('CHEMREA1', 'CHEMENG2'), -- Chemical Reaction Engineering requires Transport Phenomena
    ('CHEMPROD', 'CHEMAT1'), -- Chemical Process Industries requires Material and Energy Balances
    ('CHEMPLANT', 'CHEMREA1'), -- Plant Design and Economics requires Chemical Reaction Engineering

    -- Civil Engineering (GCOE-CE)
    ('CESTRUC1', 'ENGMECH'), -- Structural Analysis 1 requires Engineering Mechanics
    ('CESTRUC2', 'CESTRUC1'), -- Structural Analysis 2 requires Structural Analysis 1
    ('CESOIL', 'ENGPHY2'), -- Soil Mechanics requires Engineering Physics 2
    ('CEHYDRO', 'ENGPHY2'), -- Hydraulics and Hydrology requires Engineering Physics 2
    ('CECONST', 'CESTRUC1'), -- Construction Methods and Project Management requires Structural Analysis 1
    ('CEPLANNING', 'ENGECON'), -- Urban and Regional Planning requires Engineering Economics

    -- Electronics and Computer Engineering (GCOE-ECE)
    ('ECECOMM1', 'ECEBASIC'), -- Communication Systems 1 requires Basic Electronics
    ('ECECOMM2', 'ECECOMM1'), -- Communication Systems 2 requires Communication Systems 1
    ('ECECIRCU', 'ECEBASIC'), -- Digital and Analog Circuits requires Basic Electronics
    ('ECEMICRO', 'ECECIRCU'), -- Microprocessors and Embedded Systems requires Digital and Analog Circuits
    ('ECENET', 'ECECIRCU'), -- Network Engineering and Protocols requires Digital and Analog Circuits

    -- Industrial Engineering (GCOE-IE)
    ('IEOPER1', 'ENGSTAT'), -- Operations Research 1 requires Engineering Statistics
    ('IEOPER2', 'IEOPER1'), -- Operations Research 2 requires Operations Research 1
    ('IEPROD', 'ENGMECH'), -- Production Systems requires Engineering Mechanics
    ('IEHUMFAC', 'ENGMATH'), -- Human Factors and Ergonomics requires Engineering Mathematics
    ('IEQUALITY', 'ENGSTAT'), -- Quality Engineering and Management requires Engineering Statistics
    ('IESYSTEM', 'IEOPER1'), -- Systems Engineering and Design requires Operations Research 1

    -- Manufacturing Engineering and Management (GCOE-MEM)
    ('MEMMAT', 'ENGPHY1'), -- Materials Engineering requires Engineering Physics 1
    ('MEMPROD', 'MEMMAT'), -- Production and Operations Management requires Materials Engineering
    ('MEMAUTO', 'MEMMAT'), -- Automation and Robotics requires Materials Engineering
    ('MEMCADD', 'ENGDRAW'), -- Computer-Aided Design and Manufacturing requires Engineering Drawing and CAD
    ('MEMLEAN', 'ENGECON'), -- Lean Manufacturing Systems requires Engineering Economics
    ('MEMLOG', 'MEMPROD'), -- Logistics and Supply Chain Management requires Production and Operations Management

    -- Mechanical Engineering (GCOE-ME)
    ('MEFLUID2', 'MEFLUID1'), -- Fluid Mechanics 2 requires Fluid Mechanics 1
    ('METHEMO', 'ENGCAL2'), -- Thermodynamics requires Engineering Calculus 2
    ('MEMATERIAL', 'ENGMECH'), -- Strength of Materials requires Engineering Mechanics
    ('MEMACHIN', 'MEMATERIAL'), -- Machine Design requires Strength of Materials
    ('MEMECHA', 'MEMACHIN'); -- Mechanical Vibrations and Mechatronics requires Machine Design
    
INSERT INTO Prerequisites (course_id, prerequisite_id)
VALUES
    -- Core Law Courses
    ('LAW102', 'LAW101'),    -- Legal Writing and Research requires Introduction to Law and Legal Systems
    ('LAW103', 'LAW102'),    -- Statutory Construction and Interpretation requires Legal Writing and Research
    ('LAW105', 'LAW101'),    -- Constitutional Law 1 requires Introduction to Law and Legal Systems
    ('LAW106', 'LAW105'),    -- Constitutional Law 2 requires Constitutional Law 1

    -- Civil Law
    ('CIVLAW2', 'CIVLAW1'),  -- Obligations and Contracts requires Persons and Family Relations
    ('CIVLAW3', 'CIVLAW2'),  -- Property Law requires Obligations and Contracts
    ('CIVLAW4', 'CIVLAW2'),  -- Wills and Succession requires Obligations and Contracts
    ('CIVLAW5', 'CIVLAW3'),  -- Special Contracts requires Property Law

    -- Criminal Law
    ('CRIMLAW2', 'CRIMLAW1'),  -- Criminal Procedure requires Introduction to Criminal Law
    ('CRIMLAW3', 'CRIMLAW2'),  -- Crimes and Penalties requires Criminal Procedure

    -- Labor Law
    ('LABLAW2', 'LABLAW1'),  -- Social Legislation requires Labor Standards and Relations

    -- Taxation Law
    ('TAXLAW2', 'TAXLAW1'),  -- Taxation on Income, Transfer, and Business requires General Principles of Taxation

    -- Commercial Law
    ('COMLAW2', 'COMLAW1'),  -- Negotiable Instruments and Banking Laws requires General Principles of Commercial Law
    ('COMLAW3', 'COMLAW1'),  -- Corporation Law requires General Principles of Commercial Law
    ('COMLAW4', 'COMLAW3'),  -- Special Commercial Laws requires Corporation Law

    -- Remedial Law
    ('REMLAW2', 'REMLAW1'),  -- Special Proceedings requires Civil Procedure
    ('REMLAW3', 'REMLAW1'),  -- Evidence requires Civil Procedure

    -- International Law
    ('INTLAW2', 'INTLAW1'),  -- Private International Law requires Public International Law

    -- Administrative Law
    ('ADMLAW1', 'LAW101'),  -- Administrative Law requires Introduction to Law and Legal Systems

    -- Legal Practice and Advocacy
    ('MOOTCOURT', 'LAW102'),  -- Moot Court and Trial Techniques requires Legal Writing and Research
    ('LEGALPRAC', 'LAW104'),  -- Legal Counseling and Advocacy requires Ethics and the Legal Profession
    ('BARREV', 'LAW106');    -- Bar Review requires Constitutional Law 2

INSERT INTO Prerequisites (course_id, prerequisite_id)
VALUES
    -- Core Education Courses
    ('EDUC102', 'EDUC101'),  -- Foundations of Curriculum Development requires Introduction to Education
    ('EDUC103', 'EDUC101'),  -- Educational Psychology requires Introduction to Education
    ('EDUC104', 'EDUC103'),  -- Assessment and Evaluation requires Educational Psychology
    ('EDUC105', 'EDUC102'),  -- Teaching Strategies requires Foundations of Curriculum Development
    ('EDUC107', 'EDUC104'),  -- Research in Education requires Assessment and Evaluation
    ('EDUC108', 'EDUC105'),  -- Educational Leadership and Policy requires Teaching Strategies

    -- Counseling and Educational Psychology (BAGCED-CEP)
    ('CEP102', 'CEP101'),    -- Theories of Personality requires Introduction to Counseling
    ('CEP103', 'CEP101'),    -- Developmental Psychology requires Introduction to Counseling
    ('CEP104', 'CEP103'),    -- Group Counseling Techniques requires Developmental Psychology
    ('CEP105', 'CEP104'),    -- Guidance Program Development requires Group Counseling Techniques

    -- Educational Leadership and Management (BAGCED-ELM)
    ('ELM102', 'ELM101'),    -- School Organization requires Introduction to Educational Leadership
    ('ELM103', 'ELM101'),    -- Leadership in Diverse Settings requires Introduction to Educational Leadership
    ('ELM104', 'ELM102'),    -- Education Policy and Governance requires School Organization and Management
    ('ELM105', 'ELM103'),    -- Ethics in Leadership requires Leadership in Diverse Educational Settings

    -- English and Applied Linguistics (BAGCED-EAL)
    ('EAL102', 'EAL101'),    -- Theories of Language Acquisition requires Introduction to Linguistics
    ('EAL103', 'EAL102'),    -- Language and Literacy requires Theories of Language Acquisition
    ('EAL104', 'EAL103'),    -- English for Specific Purposes requires Language and Literacy
    ('EAL105', 'EAL103'),    -- Curriculum Design requires Language and Literacy

    -- Physical Education (BAGCED-PE)
    ('PE102', 'PE101'),      -- Kinesiology requires Foundations of Physical Education
    ('PE103', 'PE101'),      -- Sports and Recreation requires Foundations of Physical Education
    ('PE104', 'PE102'),      -- Fitness and Wellness requires Kinesiology
    ('PE105', 'PE103'),      -- Teaching Strategies in PE requires Sports and Recreation Management

    -- Science Education (BAGCED-SE)
    ('SE102', 'SE101'),      -- Physics for Educators requires Introduction to Science Education
    ('SE103', 'SE101'),      -- Chemistry for Educators requires Introduction to Science Education
    ('SE104', 'SE101'),      -- Biology for Educators requires Introduction to Science Education
    ('SE105', 'SE101'),      -- Environmental Science requires Introduction to Science Education

    -- Offshore and Extension Programs (BAGCED-OEP)
    ('OEP102', 'OEP101'),    -- Intercultural Competence requires Global Trends in Education
    ('OEP103', 'OEP101'),    -- International Comparative Education requires Global Trends in Education
    ('OEP104', 'OEP103'),    -- Project Management requires International Comparative Education
    ('OEP105', 'OEP104'),    -- Innovative Practices requires Project Management

    -- Center for Innovative Education Solutions (BAGCED-CIESOL)
    ('CIESOL102', 'CIESOL101'),  -- Design Thinking requires Educational Innovations
    ('CIESOL103', 'CIESOL102'),  -- Digital Learning Tools requires Design Thinking
    ('CIESOL104', 'CIESOL103'),  -- Gamification requires Digital Learning Tools
    ('CIESOL105', 'CIESOL104');  -- E-Learning Solutions requires Gamification
    
INSERT INTO Prerequisites (course_id, prerequisite_id)
VALUES
    -- Core Economics Courses
    ('ECON103', 'ECON101'),  -- Mathematical Methods for Economics requires Introduction to Microeconomics
    ('ECON104', 'ECON101'),  -- Statistics for Economists requires Introduction to Microeconomics
    ('ECON105', 'ECON104'),  -- Econometrics 1 requires Statistics for Economists
    ('ECON106', 'ECON105'),  -- Econometrics 2 requires Econometrics 1
    ('ECON107', 'ECON102'),  -- History of Economic Thought requires Introduction to Macroeconomics
    ('ECON108', 'ECON101'),  -- Development Economics requires Introduction to Microeconomics
    ('ECON109', 'ECON101'),  -- Public Economics requires Introduction to Microeconomics
    ('ECON110', 'ECON102'),  -- International Economics requires Introduction to Macroeconomics
    ('ECON111', 'ECON101'),  -- Environmental Economics requires Introduction to Microeconomics
    ('ECON112', 'ECON105'),  -- Economic Research Methods requires Econometrics 1

    -- Bachelor of Science in Applied Economics major in Industrial Economics (SOE-BS-AEI)
    ('AEI102', 'AEI101'),    -- Game Theory in Industrial Economics requires Principles of Industrial Organization
    ('AEI103', 'AEI102'),    -- Economic Regulation and Policy requires Game Theory in Industrial Economics
    ('AEI104', 'AEI103'),    -- Innovation and Technology in Economics requires Economic Regulation and Policy

    -- Bachelor of Science in Applied Economics major in Financial Economics (SOE-BS-AEF)
    ('AEF102', 'AEF101'),    -- Behavioral Economics in Finance requires Financial Markets and Institutions
    ('AEF103', 'AEF101'),    -- Corporate Finance and Valuation requires Financial Markets and Institutions
    ('AEF104', 'AEF103'),    -- Risk Management and Derivatives requires Corporate Finance and Valuation

    -- Bachelor of Arts major in Economics (SOE-AB-ECM)
    ('ECM102', 'ECM101'),    -- Cultural and Political Economics requires Philosophy of Economics
    ('ECM103', 'ECM102'),    -- Economic Anthropology requires Cultural and Political Economics
    ('ECM104', 'ECM103'),    -- Comparative Economic Systems requires Economic Anthropology

    -- Elective Courses
    ('ELEC101', 'ECON101'),  -- Health Economics requires Introduction to Microeconomics
    ('ELEC102', 'ECON101'),  -- Labor Economics requires Introduction to Microeconomics
    ('ELEC103', 'ECON101'),  -- Urban and Regional Economics requires Introduction to Microeconomics
    ('ELEC104', 'ECON101'),  -- Energy Economics requires Introduction to Microeconomics
    ('ELEC105', 'ECON102');  -- Political Economy requires Introduction to Macroeconomics


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
    grade DECIMAL(2, 1) CHECK (grade IN (0.0, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0)),
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
INSERT INTO Classes (class_id, course_id, program_id, instructor_id, college_id, room_number, max_capacity, term, school_year)
VALUES
    (1001, 'CCPROG1', 'CCS-ST', 100000201, 2, 'G201', 30, 'First Term', '2023-2024'),
    (1002, 'CCPROG1', 'CCS-ST', 100000202, 2, 'G202', 30, 'First Term', '2023-2024'),
    (1003, 'CCPROG1', 'CCS-NIS', 100000203, 2, 'G203', 30, 'First Term', '2023-2024'),
    (1004, 'CCPROG1', 'CCS-IT', 100000204, 2, 'G204', 30, 'First Term', '2023-2024');

-- Classes for CCPROG2
INSERT INTO Classes (class_id, course_id, program_id, instructor_id, college_id, room_number, max_capacity, term, school_year)
VALUES
    (2001, 'CCPROG2', 'CCS-ST', 100000205, 2, 'G205', 30, 'Second Term', '2023-2024'),
    (2002, 'CCPROG2', 'CCS-ST', 100000206, 2, 'G206', 30, 'Second Term', '2023-2024'),
    (2003, 'CCPROG2', 'CCS-NIS', 100000207, 2, 'G207', 30, 'Second Term', '2023-2024'),
    (2004, 'CCPROG2', 'CCS-IT', 100000208, 2, 'G208', 30, 'Second Term', '2023-2024');

-- Classes for CCPROG3
INSERT INTO Classes (class_id, course_id, program_id, instructor_id, college_id, room_number, max_capacity, term, school_year)
VALUES
    (3001, 'CCPROG3', 'CCS-ST', 100000209, 2, 'G301', 25, 'Third Term', '2023-2024'),
    (3002, 'CCPROG3', 'CCS-ST', 100000210, 2, 'G302', 25, 'Third Term', '2023-2024'),
    (3003, 'CCPROG3', 'CCS-NIS', 100000211, 2, 'G303', 25, 'Third Term', '2023-2024'),
    (3004, 'CCPROG3', 'CCS-IT', 100000212, 2, 'G304', 25, 'Third Term', '2023-2024');

-- Classes for CCDSTRU (Discrete Structures)
INSERT INTO Classes (class_id, course_id, program_id, instructor_id, college_id, room_number, max_capacity, term, school_year)
VALUES
    (4001, 'CCDSTRU', 'CCS-ST', 100000213, 2, 'G401', 30, 'First Term', '2023-2024'),
    (4002, 'CCDSTRU', 'CCS-ST', 100000214, 2, 'G402', 30, 'Second Term', '2023-2024'),
    (4003, 'CCDSTRU', 'CCS-NIS', 100000215, 2, 'G403', 30, 'Third Term', '2023-2024'),
    (4004, 'CCDSTRU', 'CCS-IT', 100000216, 2, 'G404', 30, 'Third Term', '2023-2024');

INSERT INTO Classes (class_id, course_id, program_id, instructor_id, college_id, room_number, max_capacity, term, school_year)
VALUES
    (5001, 'CCAPDEV', 'CCS-ST', 100000217, 2, 'G501', 25, 'First Term', '2023-2024'),
    (5002, 'CCAPDEV', 'CCS-ST', 100000218, 2, 'G502', 25, 'Second Term', '2023-2024'),
    (5003, 'CCAPDEV', 'CCS-NIS', 100000219, 2, 'G503', 25, 'Third Term', '2023-2024'),
    (5004, 'CCAPDEV', 'CCS-IT', 100000220, 2, 'G504', 25, 'First Term', '2023-2024');

-- Classes for CSSWENG (Software Engineering)
INSERT INTO Classes (class_id, course_id, program_id, instructor_id, college_id, room_number, max_capacity, term, school_year)
VALUES
    (6001, 'CSSWENG', 'CCS-ST', 100000221, 2, 'G601', 25, 'First Term', '2023-2024'),
    (6002, 'CSSWENG', 'CCS-ST', 100000222, 2, 'G602', 25, 'Second Term', '2023-2024'),
    (6003, 'CSSWENG', 'CCS-NIS', 100000223, 2, 'G603', 25, 'Third Term', '2023-2024'),
    (6004, 'CSSWENG', 'CCS-IT', 100000224, 2, 'G604', 25, 'First Term', '2023-2024');


-- Schedules for CCPROG1
INSERT INTO Schedules (class_id, instructor_id, scheduled_days, class_hours)
VALUES
    (1001, 100000201, 'Monday - Thursday', '08:00 AM - 09:00 AM'),
    (1002, 100000202, 'Tuesday - Thursday', '09:00 AM - 10:00 AM'),
    (1003, 100000203, 'Wednesday - Saturday', '10:00 AM - 11:00 AM'),
    (1004, 100000204, 'Monday - Thursday', '08:00 AM - 09:00 AM');
    
-- Schedules for CCPROG2
INSERT INTO Schedules (class_id, instructor_id, scheduled_days, class_hours)
VALUES
    (2001, 100000205, 'Monday - Thursday', '10:00 AM - 11:00 AM'),
    (2002, 100000206, 'Tuesday - Friday', '11:00 AM - 12:00 PM'),
    (2003, 100000207, 'Wednesday - Saturday', '01:00 PM - 02:00 PM'),
    (2004, 100000208, 'Tuesday - Friday', '02:00 PM - 03:00 PM');

-- Schedules for CCPROG3
INSERT INTO Schedules (class_id, instructor_id, scheduled_days, class_hours)
VALUES
    (3001, 100000209, 'Monday - Thursday', '02:00 PM - 03:00 PM'),
    (3002, 100000210, 'Tuesday - Friday', '03:00 PM - 04:00 PM'),
    (3003, 100000211, 'Wednesday - Saturday', '08:00 AM - 09:00 AM'),
    (3004, 100000212, 'Wednesday - Saturday', '10:00 AM - 11:00 AM');

-- Schedules for CCDSTRU
INSERT INTO Schedules (class_id, instructor_id, scheduled_days, class_hours)
VALUES
    (4001, 100000213, 'Monday - Thursday', '08:00 AM - 09:00 AM'),
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
        
