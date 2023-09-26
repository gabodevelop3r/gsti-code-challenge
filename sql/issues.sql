drop database db_desafio;
create database db_desafio;

SELECT * 
	FROM db_desafio.issues;

ALTER TABLE db_desafio.issues
	ADD assigned_user_id INT ,
	ADD FOREIGN KEY (assigned_user_id) REFERENCES users(id);
    
UPDATE db_desafio.issues
	SET assigned_user_id = 1
	WHERE issue_type_id = 1;

ALTER TABLE db_desafio.issues
	ADD date_close datetime;
    
UPDATE db_desafio.issues 
	SET date_close = '2023-09-15 00:30:00' 
    WHERE issues.id = 1;

SELECT * FROM db_desafio.issues
	WHERE (date_close BETWEEN '2023-09-01 00:00:00' AND '2023-09-30 23:59:59');
    
SELECT count(*),assigned_user_id  FROM db_desafio.issues
	WHERE (date_close BETWEEN '2023-09-01 00:00:00' AND '2023-09-30 23:59:59')
    Group by assigned_user_id;
    
ALTER TABLE db_desafio.issues
	ADD state TINYINT (2) default 0 ;
    
