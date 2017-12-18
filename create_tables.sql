CREATE TABLE zipcode (
    zip INT,
    city VARCHAR(25),
    PRIMARY KEY (zip , city)
);

insert into zipcode (zip, city) values
	(98004, 'Bellevue'),
    (98005, 'Bellevue'),
    (98007, 'Bellevue');

CREATE TABLE gender (
    genderID TINYINT AUTO_INCREMENT PRIMARY KEY,
    gender VARCHAR(20)
);

insert into gender (gender) values
	('female'),
    ('male'),
    ('LGBTQ');

CREATE TABLE found_out (
    foID TINYINT AUTO_INCREMENT PRIMARY KEY,
    found_out VARCHAR(35)
);

insert into found_out (found_out) values 
  ('Print advertisement'),
  ('Web'),
  ('Faculty / staff'),
  ('Friend / relative'),
  ('Watchdog (student newspaper)'),
  ('Bellevue College course schedule'),
  ('Other');
  
CREATE TABLE goal (
    goalID TINYINT AUTO_INCREMENT PRIMARY KEY,
    goal VARCHAR(55)
);

insert into goal (goal) values
  ('Transfer degree'),
  ('Professional/technical degree or certificate'),
  ('Non-credit courses or certificate (e.g. Fast Track)'),
  ('Not currently taking classes');

CREATE TABLE military_status (
    msID TINYINT AUTO_INCREMENT PRIMARY KEY,
    military_status VARCHAR(40)
);

insert into military_status (military_status) values
  ('US Military (active, past or present)'),
  ('Minor dependent of active military'),
  ('Spouse or partner of active military'),
  ('No active military service');

CREATE TABLE race (
    raceID TINYINT AUTO_INCREMENT PRIMARY KEY,
    race VARCHAR(40)
);

insert into race (race) values
  ('American Indian or Alaska Native'),
  ('Asian, Asian-American'),
  ('Black, African-American, Other African'),
  ('Native Hawaiian or Facific Islander'),
  ('White/Caucasian'),
  ('Other'),
  ('Multi-Racial');

CREATE TABLE household_information (
    hhID TINYINT AUTO_INCREMENT PRIMARY KEY,
    household_type VARCHAR(40)
);

insert into household_information (household_type) values
  ('Adult female'),
  ('Adult male'),
  ('Single minor'),
  ('Married or partnered'),
  ('Other related adults'),
  ('Single parent female head of household'),
  ('Single parent male head of household'),
  ('Two parent household'),
  ('Other related adult household');

CREATE TABLE residence (
    residenceID TINYINT AUTO_INCREMENT PRIMARY KEY,
    residence_type VARCHAR(24)
);

insert into residence (residence_type) values
  ('Live within city limits'),
  ('Live outside city limits'),
  ('Live outside King County'),
  ('Unknown');

CREATE TABLE family_income (
    family_size TINYINT,
    incomeID TINYINT,
    income VARCHAR(16),
    PRIMARY KEY (family_size , incomeID)
);

insert into family_income (family_size, incomeID, income) values
  (1, 1, '$0 - 19,000'),
  (1, 2, '$19,001 - 31,650'),
  (1, 3, '$31,651 - 48,550'),
  (1, 4, '$48,551 & higher'),
  (2, 1, '$0 - 21,700'),
  (2, 2, '$21,701 - 36,150'),
  (2, 3, '$36,151 - 55,450'),
  (2, 4, '$55,451 & higher'),
  (3, 1, '$0 - 24,400'),
  (3, 2, '$24,401 - 40,650'),
  (3, 3, '$40,651 - 62,400'),
  (3, 4, '$62,401 & higher'),
  (4, 1, '$0 - 27,100'),
  (4, 2, '$27,101 - 45,150'),
  (4, 3, '$45,151 - 69,300'),
  (4, 4, '$69,301 & higher'),
  (5, 1, '$0 - 29,300'),
  (5, 2, '$29,301 - 48,800'),
  (5, 3, '$48,801 - 74,850'),
  (5, 4, '$74,851 & higher'),
  (6, 1, '$0 - 32,580'),
  (6, 2, '$32,581 - 52,400'),
  (6, 3, '$52,401 - 80,400'),
  (6, 4, '$80,401 & higher'),
  (7, 1, '$0 - 36,730'),
  (7, 2, '$36,731 - 56,000'),
  (7, 3, '$56,001 - 85,950'),
  (7, 4, '$85,951 & higher'),
  (8, 1, '$0 - 40,890'),
  (8, 2, '$40,891 - 59,600'),
  (8, 3, '$59,601 - 91,500'),
  (8, 4, '$91,501 & higher');

CREATE TABLE student (
    cID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    sID INT UNSIGNED,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    middle_initial CHAR(1),
    email VARCHAR(254),
    contact_by_email BOOLEAN,
    home_phone VARCHAR(20),
    cell_phone VARCHAR(20),
    street_address VARCHAR(50),
    city VARCHAR(25),
    state CHAR(2),
    zip INT,
    birth_date DATE,
    genderID TINYINT,
    foID TINYINT,
    goalID TINYINT,
    msID TINYINT,
    disability BOOLEAN,
    worker_retraining_student BOOLEAN,
    race TINYINT,
    hispanic_latino BOOLEAN,
    refugee_immigrant BOOLEAN,
    limited_english BOOLEAN,
    hhID TINYINT,
    residenceID TINYINT,
    homeless BOOLEAN,
    family_size TINYINT,
    incomeID TINYINT,
    FOREIGN KEY (zip , city)
        REFERENCES zipcode (zip , city),
    FOREIGN KEY (genderID)
        REFERENCES gender (genderID),
    FOREIGN KEY (foID)
        REFERENCES found_out (foID),
    FOREIGN KEY (goalID)
        REFERENCES goal (goalID),
    FOREIGN KEY (msID)
        REFERENCES military_status (msID),
    FOREIGN KEY (race)
        REFERENCES race (raceID),
    FOREIGN KEY (hhID)
        REFERENCES household_information (hhID),
    FOREIGN KEY (residenceID)
        REFERENCES residence (residenceID),
    FOREIGN KEY (family_size , incomeID)
        REFERENCES family_income (family_size , incomeID)
);

CREATE TABLE staff (
    staffID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(254) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE visit_reason (
    reasonID TINYINT AUTO_INCREMENT PRIMARY KEY,
    reason VARCHAR(19)
);

insert into visit_reason (reason) values
  ('Career Planning'),
  ('Scholarships'),
  ('Job-Search'),
  ('Internships'),
  ('Community Resources'),
  ('Work-Study');

CREATE TABLE advising_session (
    sessionID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cID INT UNSIGNED NOT NULL,
    adviserID INT UNSIGNED NOT NULL,
    sDate DATE,
    reasonID TINYINT,
    notes TEXT,
    FOREIGN KEY (cID)
        REFERENCES student (cID),
    FOREIGN KEY (adviserID)
        REFERENCES staff (staffID),
    FOREIGN KEY (reasonID)
        REFERENCES visit_reason (reasonID)
);

CREATE TABLE quarter (
    qID TINYINT AUTO_INCREMENT PRIMARY KEY,
    quarter VARCHAR(10),
    begin_date DATE,
    end_date DATE
);

insert into quarter (quarter, begin_date, end_date) values
	('winter 18', '2018-01-01', '2018-03-30'),
   	('spring 18', '2018-04-01', '2018-06-30'),
   	('summer 18', '2018-07-01', '2018-08-30'),
	('fall 18', '2018-09-01', '2018-12-30');

CREATE TABLE workshop (
    wID TINYINT AUTO_INCREMENT PRIMARY KEY,
    wName VARCHAR(30)
);

CREATE TABLE wEvaluation (
    wEvalID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cID INT UNSIGNED,
    staffID INT UNSIGNED,
    wID TINYINT,
    eDate DATE,
    qID TINYINT,
    wFound_out VARCHAR(35),
    meet_expectations BOOL,
    would_recommend BOOL,
    hand_outs BOOL,
    content BOOL,
    presentation BOOL,
    environment BOOL,
    would_change TEXT,
    suggestions TEXT,
    FOREIGN KEY (cID)
        REFERENCES student (cID),
    FOREIGN KEY (staffID)
        REFERENCES staff (staffID),
    FOREIGN KEY (wID)
        REFERENCES workshop (wID),
    FOREIGN KEY (qID)
        REFERENCES quarter (qID)
);

CREATE TABLE job_posting (
    jID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    date_posted DATE,
    qID TINYINT,
    notes TEXT,
    FOREIGN KEY (qID)
        REFERENCES quarter (qID)
);

CREATE TABLE internship (
    iID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    date_posted DATE,
    qID TINYINT,
    notes TEXT,
    FOREIGN KEY (qID)
        REFERENCES quarter (qID)
);

CREATE TABLE job_history (
    cID INT UNSIGNED NOT NULL,
    jID INT UNSIGNED NOT NULL,
    date_hired DATE,
    PRIMARY KEY (cID , jID),
    FOREIGN KEY (cID)
        REFERENCES student (cID),
    FOREIGN KEY (jID)
        REFERENCES job_posting (jID)
);

CREATE TABLE internship_history (
    cID INT UNSIGNED NOT NULL,
    iID INT UNSIGNED NOT NULL,
    date_hired DATE,
    PRIMARY KEY (cID , iID),
    FOREIGN KEY (cID)
        REFERENCES student (cID),
    FOREIGN KEY (iID)
        REFERENCES internship (iID)
);

CREATE TABLE organization (
    oID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    oName VARCHAR(50),
    industry VARCHAR(30)
);

CREATE TABLE job_postings (
    jID INT UNSIGNED,
    bc_lead INT UNSIGNED,
    oID INT UNSIGNED,
    o_contact_fn VARCHAR(30),
    o_contact_ln VARCHAR(30),
    o_contact_title VARCHAR(30),
    o_contact_dept VARCHAR(30),
    o_contact_email VARCHAR(254),
    o_contact_phone VARCHAR(20),
    related_bc_programs TEXT,
    notes TEXT,
    PRIMARY KEY (jID , oID , bc_lead),
    FOREIGN KEY (jID)
        REFERENCES job_posting (jID),
    FOREIGN KEY (oID)
        REFERENCES organization (oID),
    FOREIGN KEY (bc_lead)
        REFERENCES staff (staffID)
);

CREATE TABLE internships (
    iID INT UNSIGNED,
    bc_lead INT UNSIGNED,
    oID INT UNSIGNED,
    o_contact_fn VARCHAR(30),
    o_contact_ln VARCHAR(30),
    o_contact_title VARCHAR(30),
    o_contact_dept VARCHAR(30),
    o_contact_email VARCHAR(254),
    o_contact_phone VARCHAR(20),
    related_bc_programs TEXT,
    notes TEXT,
    PRIMARY KEY (iID , oID , bc_lead),
    FOREIGN KEY (iID)
        REFERENCES internship (iID),
    FOREIGN KEY (oID)
        REFERENCES organization (oID),
    FOREIGN KEY (bc_lead)
        REFERENCES staff (staffID)
);

CREATE TABLE program (
    pID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    program_name VARCHAR(50)
);

CREATE TABLE event (
    eID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(50)
);

CREATE TABLE recruiting (
    pID INT UNSIGNED,
    eID INT UNSIGNED,
    bc_lead INT UNSIGNED,
    oID INT UNSIGNED,
    o_contact_fn VARCHAR(30),
    o_contact_ln VARCHAR(30),
    o_contact_title VARCHAR(30),
    o_contact_dept VARCHAR(30),
    o_contact_email VARCHAR(254),
    o_contact_phone VARCHAR(20),
    last_contact DATE,
    related_bc_programs TEXT,
    notes TEXT,
    PRIMARY KEY (pID , eID , oID),
    FOREIGN KEY (oID)
        REFERENCES organization (oID),
    FOREIGN KEY (bc_lead)
        REFERENCES staff (staffID),
    FOREIGN KEY (pID)
        REFERENCES program (pID),
    FOREIGN KEY (eID)
        REFERENCES event (eID)
);

CREATE TABLE advisory_board (
    bc_lead INT UNSIGNED,
    oID INT UNSIGNED,
    o_contact_fn VARCHAR(30),
    o_contact_ln VARCHAR(30),
    o_contact_title VARCHAR(30),
    o_contact_dept VARCHAR(30),
    o_contact_email VARCHAR(254),
    o_contact_phone VARCHAR(20),
    last_contact DATE,
    notes TEXT,
    PRIMARY KEY (oID , bc_lead),
    FOREIGN KEY (oID)
        REFERENCES organization (oID),
    FOREIGN KEY (bc_lead)
        REFERENCES staff (staffID)
);

CREATE TABLE grant_partner (
    bc_lead INT UNSIGNED,
    oID INT UNSIGNED,
    o_contact_fn VARCHAR(30),
    o_contact_ln VARCHAR(30),
    o_contact_title VARCHAR(30),
    o_contact_dept VARCHAR(30),
    o_contact_email VARCHAR(254),
    o_contact_phone VARCHAR(20),
    last_contact DATE,
    related_bc_programs TEXT,
    notes TEXT,
    PRIMARY KEY (oID , bc_lead),
    FOREIGN KEY (oID)
        REFERENCES organization (oID),
    FOREIGN KEY (bc_lead)
        REFERENCES staff (staffID)
);

CREATE TABLE other (
    pID INT UNSIGNED,
    eID INT UNSIGNED,
    bc_lead INT UNSIGNED,
    oID INT UNSIGNED,
    o_contact_fn VARCHAR(30),
    o_contact_ln VARCHAR(30),
    o_contact_title VARCHAR(30),
    o_contact_dept VARCHAR(30),
    o_contact_email VARCHAR(254),
    o_contact_phone VARCHAR(20),
    last_contact DATE,
    related_bc_programs TEXT,
    notes TEXT,
    PRIMARY KEY (oID , bc_lead),
    FOREIGN KEY (oID)
        REFERENCES organization (oID),
    FOREIGN KEY (bc_lead)
        REFERENCES staff (staffID),
    FOREIGN KEY (pID)
        REFERENCES program (pID),
    FOREIGN KEY (eID)
        REFERENCES event (eID)
);