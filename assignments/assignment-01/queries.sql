

SELECT DISTINCT CITY, STATE, ZIP 
	FROM CUSTOMER;


SELECT EMPNAME, DEPARTMENT, EMAIL, PHONE
	FROM EMPLOYEE
	WHERE PHONE LIKE '3-%';



SELECT *
	FROM RESOURCETBL
	WHERE RATE BETWEEN 10 AND 20
	ORDER BY RATE;


SELECT EVENTNO, DATEAUTH, STATUS
	FROM EVENTREQUEST
	WHERE STATUS IN('Denied', 'Approved')
	AND DATEAUTH >= '2013-7-01'
	AND DATEAUTH <= '2013-7-31';


SELECT LOCNO, LOCNAME
	FROM LOCATION, FACILITY
	WHERE LOCATION.FACNO = FACILITY.FACNO
	AND FACNAME = 'Basketball arena'; 


SELECT PLANNO, COUNT(LINENO), SUM(NUMBERFLD)
	FROM EVENTPLANLINE
	GROUP BY PLANNO;

SELECT EVENTREQUEST.EVENTNO, EVENTREQUEST.DATEHELD, OUTPUT.PLANS
	FROM EVENTREQUEST,
	(SELECT EVENTPLAN.EVENTNO, COUNT(EVENTPLAN.PLANNO) AS PLANS
		FROM EVENTPLAN
		WHERE EVENTPLAN.WORKDATE >= '2013-12-01'
		AND EVENTPLAN.WORKDATE <= '2013-12-31'
		GROUP BY EVENTPLAN.EVENTNO
		HAVING PLANS > 1) AS OUTPUT
	WHERE EVENTREQUEST.EVENTNO = OUTPUT.EVENTNO;


SELECT DISTINCT EVENTPLAN.PLANNO,  EVENTPLAN.EVENTNO, EVENTPLAN.WORKDATE, EVENTPLAN.ACTIVITY
	FROM EVENTPLAN,
	(SELECT  FACOUTPUT.EVENTS AS FINALEVENTS
		FROM FACILITY,
		(SELECT FACNO, EVENTPLAN.EVENTNO AS EVENTS
			FROM EVENTREQUEST, EVENTPLAN
			WHERE EVENTREQUEST.EVENTNO = EVENTPLAN.EVENTNO) AS FACOUTPUT
		WHERE FACILITY.FACNO = FACOUTPUT.FACNO
		AND FACNAME = 'Basketball arena') AS FINALOUTPUT
	WHERE FINALOUTPUT.FINALEVENTS = EVENTPLAN.EVENTNO
	AND EVENTPLAN.WORKDATE >= '2013-12-01'
	AND EVENTPLAN.WORKDATE <= '2013-12-31';


SELECT EVENTREQUEST.EVENTNO, EVENTREQUEST.DATEHELD, EVENTREQUEST.STATUS, EVENTREQUEST.ESTCOST
	FROM EVENTREQUEST,FACILITY,
	(SELECT EVENTPLAN.EVENTNO AS EVENTS
		FROM EVENTPLAN, EMPLOYEE
		WHERE EVENTPLAN.EMPNO = EMPLOYEE.EMPNO
		AND EMPLOYEE.EMPNAME = 'Mary Manager') AS OUTPUT
	WHERE EVENTREQUEST.FACNO = FACILITY.FACNO
	AND FACILITY.FACNAME = 'Basketball arena'
	AND EVENTREQUEST.DATEHELD >= '2013-10-01'
	AND EVENTREQUEST.DATEHELD <= '2013-12-31'
	AND EVENTREQUEST.EVENTNO = OUTPUT.EVENTS;




SELECT DISTINCT EVENTPLANLINE.PLANNO, EVENTPLANLINE.LINENO, RESOURCETBL.RESNAME, EVENTPLANLINE.NUMBERFLD, LOCATION.LOCNAME, EVENTPLANLINE.TIMESTART, EVENTPLANLINE.TIMEEND 
	FROM EVENTPLANLINE, RESOURCETBL, LOCATION,
	(SELECT EVENTOUTPUT.PLANSS AS PLANSSS
		FROM FACILITY,	
		(SELECT OPERATIONALACTIVITIES.PLANS AS PLANSS, EVENTREQUEST.FACNO AS FACS
			FROM EVENTREQUEST,  
			(SELECT EVENTPLANLINE.PLANNO AS PLANS, EVENTPLAN.EVENTNO AS EVENTS
				FROM EVENTPLAN,EVENTPLANLINE
				WHERE EVENTPLANLINE.PLANNO = EVENTPLAN.PLANNO
				AND EVENTPLAN.ACTIVITY = 'Operation'
				AND WORKDATE >= '2013-10-01'
				AND WORKDATE <= '2013-12-31') AS OPERATIONALACTIVITIES
			WHERE OPERATIONALACTIVITIES.EVENTS = EVENTREQUEST.EVENTNO) AS EVENTOUTPUT 	
		WHERE FACILITY.FACNO = EVENTOUTPUT.FACS
		AND FACILITY.FACNAME = 'Basketball arena') AS FINALOUTPUT
	WHERE RESOURCETBL.RESNO = EVENTPLANLINE.RESNO
	AND LOCATION.LOCNO = EVENTPLANLINE.LOCNO
	AND FINALOUTPUT.PLANSSS = EVENTPLANLINE.PLANNO;


INSERT INTO FACILITY 
	(FACNO,FACNAME) 
	VALUES 
	('F100','Swimming Pool');


INSERT INTO LOCATION 
	(LOCNO,FACNO,LOCNAME) 
	VALUES 
	('L107','F104','Door');


INSERT INTO LOCATION 
	(LOCNO,FACNO,LOCNAME) 
	VALUES 
	('L108','F104','Locker Room');

UPDATE LOCATION
	SET LOCNAME = 'Gate'
	WHERE LOCNO = 'L107';

DELETE FROM LOCATION WHERE LOCNO = 'L108';
