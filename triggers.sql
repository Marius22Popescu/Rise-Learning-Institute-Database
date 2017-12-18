DELIMITER $$
CREATE  TRIGGER before_interships_update
BEFORE UPDATE ON internships
FOR EACH ROW
BEGIN 
	INSERT INTO intership
    SET action = 'update',
    oID = OLD.oID,
    changedate_posted = NOW();
    END$$
    
    
DELIMITER $$
CREATE TRIGGER before_job_postings_update
BEFORE UPDATE ON job_postings
FOR EACH ROW
BEGIN 
	INSERT INTO job_posting
    SET action = 'update',
    oID = OLD.oID,
    changedate_posted = NOW();
    END$$
    
    
 DELIMITER $$
 CREATE TRIGGER before_advisory_board_update
 BEFORE UPDATE ON advisory_board
 FOR EACH ROW
 BEGIN
 INSERT INTO advising_session
  SET action = 'update',
    cID = OLD.cID,
    changedate = NOW();
    END$$  