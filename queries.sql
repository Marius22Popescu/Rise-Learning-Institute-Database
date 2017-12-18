# All queiries will be called from Java with certain variables filled in. A large part of the database is that it generates reports on all students from select zipcodes with certain filters. So we broke these queiries into pieces that will be combined in Java when a user selects multiple filters.

#find a student ID by email
SELECT 
    sID
FROM
    student
WHERE
    email = 'bob@bellevuecollege.edu';

#find out the race of a student 
SELECT 
    r.race
FROM
    student s,
    race r
WHERE
    s.email = 'bob@bellevuecollege.edu'
        AND r.raceID = s.race; #to find an exact race based on int that student typed in

#find the first name and organization ID that posted a specific job offering
SELECT 
    o_contact_fn, oID
FROM
    job_postings
WHERE
    jID = 2;

#find out organization's ID that offers internships
SELECT 
    oID
FROM
    internships
WHERE
    iID = 2;

#Query to check how the student heard about it
SELECT 
    fo.found_out
FROM
    student s,
    found_out fo
WHERE
    s.sID = '950696363' AND fo.foID = s.foID;
    
#shows all students under a certain zipcode 
SELECT 
    s.sID
FROM
    student s,
    zipcode z
WHERE
    s.zip = z.zip
GROUP BY s.sID;

#reports all students incomes
SELECT 
    s.sID
FROM
    family_income f,
    student s
WHERE
    f.incomeID = s.incomeID
GROUP BY f.income;

#report of the student's goal
SELECT 
    s.sID
FROM
    goal g,
    student s
WHERE
    g.goalID = s.goalID
GROUP BY g.goal;

#report of student's military status
SELECT 
    s.sID
FROM
    military_status m,
    student s
WHERE
    m.msID = s.msID
GROUP BY m.military_status;

#report of student's household type
SELECT 
    s.sID
FROM
    household_information h,
    student s
WHERE
    h.hhID = s.hhID
GROUP BY h.household_type;
