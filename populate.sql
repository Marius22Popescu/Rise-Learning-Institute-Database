insert into student(sID, first_name, last_name, middle_initial, email, contact_by_email, home_phone, cell_phone, street_address, city, state, zip, birth_date, genderID, foID, goalID, msID, disability, worker_retraining_student, race, hispanic_latino, refugee_immigrant, limited_english, hhID, residenceID, homeless, family_size, incomeID) values
	(950696363, 'Bob', 'Smith', 'N', 'bob@bellevuecollege.edu', TRUE, '4254354343', 'N/A', '56252 169th', 'Bellevue', 'WA', 98005, '1995-10-10', 1, 2, 1, 4, FALSE, FALSE, 6, FALSE, TRUE, TRUE, 2, 1, FALSE, 4, 3),
    (950693409, 'Jeff', 'Talada', 'W', 'j.talada@bellevuecollege.edu', TRUE, '4252412384', '2234993803', '15010 NE 10th Pl', 'Bellevue', 'WA', 98007, '1985-07-11', 2, 4, 3, 4, FALSE, FALSE, 5, FALSE, FALSE, FALSE, 4, 1, FALSE, 7, 3),
    (950692432, 'Boogy', 'Woo', 'W', 'boogy.woogy.woo@bellevuecollege.edu', TRUE, '4252344343', 'N/A', '342 20th Ave', 'Bellevue', 'WA', 98004, '1993-12-16', 3, 1, 4, 3, TRUE, TRUE, 3, TRUE, FALSE, FALSE, 3, 2, TRUE, 3, 2);
    
insert into staff(first_name, last_name, email, phone) values
	('Kaytlyn', 'Jones', 'kaytlyn.jones@bellevuecollege.edu', '425-564-6645'),
    ('Dr.', 'Who', 'Who@bellevuecollege.edu', '3488393939'),
    ('Patrick', 'Stewart', 'trick.stew@bellevuecollege.edu', '4849233847');

insert into advising_session(cID, adviserID, sDate, reasonID, notes) values
	(1, 1, '2017-09-22', 4, 'first appointment'),
    (2, 2, '2017-10-29', 1, 'definately my new companion'),
    (1, 3, '2017-11-04', 2, 'where do they find these people'),
    (3, 3, '2017-12-25', 3, 'what up dog');

insert into workshop(wName) values
	('asldfkj'),
    ('weoriu'),
    ('xc,nvm');

insert into wEvaluation(cID, staffID, wID, eDate, qID, wFound_out, meet_expectations, would_recommend, hand_outs, content, presentation, environment, would_change, suggestions) values
    (1, 1, 1, '2018-09-09', 4, 'sdflkjde', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'sdfluboxiwnerosidfvlkxncvsdfha;sdlkh sadlfkjw;e   asdflkjasd', 'dskfjhxcvuiy sdfnwerf asdflkycv'),
    (2, 3, 3, '2018-04-09', 2, 'dsf;lkj', FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, 'cvu;eoir e rlkje ;lkm   ;lksjdfoiusdofiudsf;oiuw;eorj;lkwer', 'xcvoiuewrn  sdf;iu sdf;jj f'),
    (3, 2, 2, '2018-06-09', 3, 'soibxcle', FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 'vfoiuxcfvoijnertn;pxov sd ;oiuaer;tlkj ejf;lk n;voiu l sd;flj', 'weroiub;lk dfgouwe;l m sdlfkj');
    
insert into job_posting(date_posted, qID, notes) values
	('2017-09-26', 4, 'ASAP, hiring manager position'),
    ('2017-04-03', 2, 'Need someone to watch paint dry');
     
insert into internship(date_posted, qID, notes) values
	('2016-06-15', 3, 'on campus marketing internship'),
    ('2017-09-18', 4, 'Expedia software engineering internship'),
    ('2017-02-19', 1, 'business intelegence internship at T-mobile');

insert into job_history(cID, jID, date_hired) values
	(1, 1, '2017-10-01'),
    (1, 2, '2017-05-23');

insert into internship_history(cID, iID, date_hired) values
	(1, 2, '2016-10-04'),
    (2, 2, '2016-10-12'),
    (3, 1, '2017-10-03');
    
insert into organization(oName, industry) values
	('Expedia', 'travel'),
	('T-mobile', 'telecommunications'),
    ('Batcorp', 'toys');

insert into program(program_name) values
	('asdflkj'),
    ('lsdkjff'),
    ('sldfkjjert');

insert into event(event_name) values
	('pwoeiru'),
    ('x,mvnxcv'),
    ('wpeoriu'),
    ('cxvlu'),
    ('etk,mn'),
    ('wertoibn'),
    ('bviuo');

insert into job_postings(jID, bc_lead, oID, o_contact_fn, o_contact_ln,o_contact_title,o_contact_dept, o_contact_email, o_contact_phone, related_bc_programs, notes) values
	(1, 1, 1, 'agfdgfdg', 'dsfgfd', 'xcvbxc', 'esfds', 'ggggg', 'gfdgfd', 'fgfdgfds', 'N/A'),
    (2, 2, 3, 'agfwerrg', 'dsfwed', 'xclwrc', 'egdfs', 'ggwer', 'fwerfd', 'fgfdgsfs', 'N/A');
	
insert into internships(iID, bc_lead, oID, o_contact_fn, o_contact_ln,o_contact_title,o_contact_dept, o_contact_email, o_contact_phone, related_bc_programs,notes) values
	(2, 1, 1,'agfdgfdg', 'dsfgfd', 'xcvbxc', 'esfds', 'ggggg', 'gfdgfd', 'fgfdgfds', 'ASAP!'),
    (1, 3, 1,'agfsdfg', 'dsdfsfgfd', 'xasdfc', 'easdfs', 'gasdfg', 'sadffd', 'asdgfrjs', 'asdfwer'),
    (3, 2, 3,'gfhfdfghg', 'dstyjfd', 'xcvtjyc', 'ertyds', 'gytrygg', 'gfdwerd', 'fgewrlds', 'ASsdf');
    
insert into recruiting(pID, eID, bc_lead, oID,  o_contact_fn, o_contact_ln, o_contact_title,o_contact_dept, o_contact_email, o_contact_phone, last_contact, related_bc_programs, notes ) values
	(1, 3, 1, 1, 'agfdgfdg', 'dsfgfd', 'xcvbxc', 'esfds', 'ggggg', 'gfdgfd', '2016-10-01', 'N/A', 'asfsdf'),
    (1, 3, 1, 2, 'afterdg', 'arflesnarf', 'bhdfgxc', 'esdfds', 'grgewg', 'ghgjfghjd', '2016-10-03', 'pie eating', 'angfhndf'),
    (2, 3, 3, 3, 'asfdwerg', 'dswerd', 'xwrec', 'ewers', 'wqetytg', 'hgjhgnd', '2017-04-05', 'N/A', 'assdfsd');

 insert into advisory_board (bc_lead, oID, o_contact_fn, o_contact_ln,o_contact_title,o_contact_dept, o_contact_email, o_contact_phone, last_contact, notes) values
	(1, 1, 'agfdgfdg', 'dsfgfd', 'xcvbxc', 'esfds', 'ggggg', 'gfdgfd', '2016-10-01','asfsdf'),
    (1, 2, 'asdf', 'dhjkhjd', 'xcyuic', 'eyuis', 'ewrtg', 'gcvbnd', '2017-01-06','assdff');

insert into grant_partner(bc_lead, oID,o_contact_fn, o_contact_ln,o_contact_title,o_contact_dept,  o_contact_email, o_contact_phone, last_contact, related_bc_programs, notes) values
	(3, 1, 'agfdgfdg', 'dsfgfd', 'xcvbxc', 'esfds', 'ggggg', 'gfdgfd', '2017-09-03','N/A', 'asdfdsa'),
    (3, 3, 'atyjtyj', 'dyjtyj', 'xtyjhty', 'nthys', 'ertg', 'gffdgj', '2017-10-23','N/A', 'ayuka');

insert into other(pID, eID, bc_lead, oID, o_contact_fn, o_contact_ln, o_contact_title,o_contact_dept, o_contact_email, o_contact_phone, last_contact, related_bc_programs, notes) values
    (2, 5, 2, 2, 'agfdgfdg', 'dsfgfd', 'xcvbxc', 'esfds', 'ggggg', 'gfdgfd',  '2017-09-03', 'N/A', 'No current notes'),
    (2, 3, 2, 3, 'ajhhnfdg', 'hhhh', 'hrthc', 'jtyjys', 'jtyjg', 'gf5jjtyd',  '2017-11-05', 'N/A', 'whack a mole'),
    (3, 7, 3, 3, 'asdfgdg', 'dcvbcfd', 'xcxcvbc', 'cxvbcs', 'gcxvbg', 'cvbdfgfd',  '2017-05-13', 'N/A', 'sdfjlk;otes');
