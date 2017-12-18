CREATE  OR REPLACE VIEW Advisor 
AS SELECT advising_session.adviserID, advising_session.cID, advising_session.date, advising_session.notes, advising_session.reasonID, advising_session.sessionID, job_history.date_hired, job_history.jID, internship_history.iID
FROM  advising_session, job_history, internship_history
WHERE advising_session.cID = job_history.cID = internship_history.cID
WITH CHECK OPTION;



CREATE OR REPLACE VIEW StudentsByReason
AS SELECT student.first_name, student.last_name, advising_session.notes
FROM student, advising_session, visit_reason
WHERE visit_reason.reasonID = advising_session.reasonID AND student.cID = advising_session.cID
WITH CHECK OPTION;



CREATE OR REPLACE VIEW StudentsByDate
AS SELECT student.first_name, student.last_name
FROM student, advising_session
WHERE advising_session.date = '11.10.2017'
WITH CHECK OPTION;
 
 
 
CREATE OR REPLACE VIEW AdminJobs
AS SELECT job_postings.o_contact_title,  job_postings.related_bc_programs, recruiting.event_name, recruiting.notes, recruiting.program_name, recruiting.oID
FROM  recruiting, job_postings, internships
WHERE  recruiting.oID = job_postings.oID = internships.oID
WITH CHECK OPTION; 



CREATE OR REPLACE VIEW AdminAdvisoring
AS SELECT advising_session.adviserID, advising_session.date, student.first_name, student.last_name
FROM advising_session, student
WHERE advising_session.cID = student.cID
WITH CHECK OPTION;



CREATE  OR REPLACE VIEW Interships 
AS SELECT *
FROM  internships
WITH CHECK OPTION;



CREATE  OR REPLACE VIEW JobPostings 
AS SELECT *
FROM  job_postings
WITH CHECK OPTION;



CREATE  OR REPLACE VIEW Organizations
AS SELECT *
FROM  organization
WITH CHECK OPTION;