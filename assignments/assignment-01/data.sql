INSERT INTO EMPLOYEE 
	(EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE) 
	VALUES 
	('E100','Chuck Coordinator','Administration','chuck@colorado.edu','3-1111'),
	('E101','Mary Manager','Football','mary@colorado.edu','5-1111'),
	('E102','Sally Supervisor','Planning','sally@colorado.edu','3-2222'),
	('E103','Alan Administrator','Administration','alan@colorado.edu','3-3333');

INSERT INTO CUSTOMER 
	(CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) 
	VALUES 
	('C100','Football','Box 352200','Y','Mary Manager','6857100','Boulder','CO','80309'),
	('C101','Men''s Basketball','Box 352400','Y','Sally Supervisor','5431700','Boulder','CO','80309'),
 	('C103','Baseball','Box 352020','Y','Bill Baseball','5431234','Boulder','CO','80309'),
	('C104','Women''s Softball','Box 351200','Y','Sue Softball','5434321','Boulder','CO','80309'),
	('C105','High School Football','123 AnyStreet','N','Coach Bob','4441234','Louisville','CO','80027');

INSERT INTO RESOURCETBL 
	(RESNO,RESNAME,RATE) 
	VALUES 
	('R100','attendant',10),
	('R101','police',15),
	('R102','usher',10),
	('R103','nurse',20),
	('R104','janitor',15),
	('R105','food service',10);

INSERT INTO FACILITY 
	(FACNO,FACNAME) 
	VALUES 
	('F100','Football stadium'),
	('F101','Basketball arena'),
	('F102','Baseball field'),
	('F103','Recreation room');

INSERT INTO LOCATION 
	(LOCNO,FACNO,LOCNAME) 
	VALUES 
	('L100','F100','Locker room'),
	('L101','F100','Plaza'),
	('L102','F100','Vehicle gate'),
	('L103','F101','Locker room'),
	('L104','F100','Ticket Booth'),
	('L105','F101','Gate'),
	('L106','F100','Pedestrian gate');

INSERT INTO EVENTREQUEST 
	(EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) 
	VALUES 
	('E100',str_to_date('25,OCT,13','%d,%b,%y'),str_to_date('06,JUN,13','%d,%b,%y'),'C100','F100',str_to_date('08,JUN,13','%d,%b,%y'),'Approved',5000,80000,'B1000'),
	('E101',str_to_date('26,OCT,13','%d,%b,%y'),str_to_date('28,JUL,13','%d,%b,%y'),'C100','F100',null,'Pendig',5000,80000,'B1000'),
	('E103',str_to_date('21,SEP,13','%d,%b,%y'),str_to_date('28,JUL,13','%d,%b,%y'),'C100','F100',str_to_date('01,AUG,13','%d,%b,%y'),'Approved',5000,80000,'B1000'),
	('E102',str_to_date('14,SEP,13','%d,%b,%y'),str_to_date('28,JUL,13','%d,%b,%y'),'C100','F100',str_to_date('31,JUL,13','%d,%b,%y'),'Approved',5000,80000,'B1000'),
	('E104',str_to_date('03,DEC,13','%d,%b,%y'),str_to_date('28,JUL,13','%d,%b,%y'),'C101','F101',str_to_date('31,JUL,13','%d,%b,%y'),'Approved',2000,12000,'B1000'),
	('E105',str_to_date('05,DEC,13','%d,%b,%y'),str_to_date('28,JUL,13','%d,%b,%y'),'C101','F101',str_to_date('01,AUG,13','%d,%b,%y'),'Approved',2000,10000,'B1000'),
	('E106',str_to_date('12,DEC,13','%d,%b,%y'),str_to_date('28,JUL,13','%d,%b,%y'),'C101','F101',str_to_date('31,JUL,13','%d,%b,%y'),'Approved',2000,10000,'B1000'),
	('E107',str_to_date('23,NOV,13','%d,%b,%y'),str_to_date('28,JUL,13','%d,%b,%y'),'C105','F100',str_to_date('31,JUL,13','%d,%b,%y'),'Denied',10000,5000,null);


INSERT INTO EVENTPLAN 
	(PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) 
	VALUES 
	('P100','E100',str_to_date('25,OCT,13','%d,%b,%y'),'Standard operation','Operation','E102'),
	('P101','E104',str_to_date('03,DEC,13','%d,%b,%y'),'Watch for gate crashers','Operation','E100'),
 	('P102','E105',str_to_date('05,DEC,13','%d,%b,%y'),'Standard operation','Operation','E102'),
	('P103','E106',str_to_date('12,DEC,13','%d,%b,%y'),'Watch for seat switching','Operation',null),
	('P104','E101',str_to_date('26,OCT,13','%d,%b,%y'),'Standard cleanup','Cleanup','E101'),
	('P105','E100',str_to_date('25,OCT,13','%d,%b,%y'),'Light cleanup','Cleanup','E101'),
	('P199','E102',str_to_date('10,DEC,13','%d,%b,%y'),'ABC','Operation','E101'),
	('P299','E101',str_to_date('26,OCT,13','%d,%b,%y'),null,'Operation','E101'),
	('P349','E106',str_to_date('12,DEC,13','%d,%b,%y'),null,'Setup','E101'),
	('P85','E100',str_to_date('25,OCT,13','%d,%b,%y'),'Standard operation','Cleanup','E102'),
	('P95','E101',str_to_date('26,OCT,13','%d,%b,%y'),'Extra security','Cleanup','E102');

INSERT INTO EVENTPLANLINE 
	(PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) 
	VALUES 
	('P100',1, str_to_date('25,OCT,13 8:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,13 17:00:00','%d,%b,%y %H:%i:%s'),2,'L100','R100'),
	('P100',2, str_to_date('25,OCT,13 12:00:00','%d,%b,%y %H:%i:%s'),str_to_date('25,OCT,13 17:00:00','%d,%b,%y %H:%i:%s'), 2,'L101','R101'),
	('P100',3, str_to_date('25,OCT,13 7:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,13 16:30:00','%d,%b,%y %H:%i:%s'), 1,'L102','R102'),
	('P100',4, str_to_date('25,OCT,13 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('25,OCT,13 22:00:00','%d,%b,%y %H:%i:%s'),2,'L100','R102'),
	('P101',1, str_to_date('3,DEC,13 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('3,DEC,13 20:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R100'),
	('P101',2, str_to_date('3,DEC,13 18:30:00','%d,%b,%y %H:%i:%s'),str_to_date('3,DEC,13 19:00:00','%d,%b,%y %H:%i:%s'),4,'L105','R100'),
	('P101',3, str_to_date('3,DEC,13 19:00:00','%d,%b,%y %H:%i:%s'),str_to_date('3,DEC,13 20:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R103'),
	('P102',1, str_to_date('5,DEC,13 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('5,DEC,13 19:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R100'),
	('P102',2, str_to_date('5,DEC,13 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('5,DEC,13 21:00:00','%d,%b,%y %H:%i:%s'),4,'L105','R100'),
	('P102',3, str_to_date('5,DEC,13 19:00:00','%d,%b,%y %H:%i:%s'),str_to_date('5,DEC,13 22:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R103'),
	('P103',1, str_to_date('12,DEC,13 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('12,DEC,13 21:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R100'),
	('P103',2, str_to_date('12,DEC,13 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('12,DEC,13 21:00:00','%d,%b,%y %H:%i:%s'),4,'L105','R100'),
	('P103',3, str_to_date('12,DEC,13 19:00:00','%d,%b,%y %H:%i:%s'),str_to_date('12,DEC,13 22:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R103'),
	('P104',1, str_to_date('26,OCT,13 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('26,OCT,13 22:00:00','%d,%b,%y %H:%i:%s'),4,'L101','R104'),
	('P104',2, str_to_date('26,OCT,13 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('26,OCT,13 22:00:00','%d,%b,%y %H:%i:%s'),4,'L100','R104'),
	('P105',1, str_to_date('25,OCT,13 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('25,OCT,13 22:00:00','%d,%b,%y %H:%i:%s'),4,'L101','R104'),
	('P105',2, str_to_date('25,OCT,13 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('25,OCT,13 22:00:00','%d,%b,%y %H:%i:%s'),4,'L100','R104'),
	('P199',1, str_to_date('10,DEC,13 8:00:00','%d,%b,%y %H:%i:%s'), str_to_date('10,DEC,13 12:00:00','%d,%b,%y %H:%i:%s'),1,'L100','R100'),
	('P349',1, str_to_date('12,DEC,13 12:00:00','%d,%b,%y %H:%i:%s'),str_to_date('12,DEC,13 15:30:00','%d,%b,%y %H:%i:%s'),1,'L103','R100'),
	('P85',1,  str_to_date('25,OCT,13 9:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,13 17:00:00','%d,%b,%y %H:%i:%s'),5,'L100','R100'),
	('P85',2,  str_to_date('25,OCT,13 8:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,13 17:00:00','%d,%b,%y %H:%i:%s'),2,'L102','R101'),
	('P85',3, str_to_date('25,OCT,13 10:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,13 15:00:00','%d,%b,%y %H:%i:%s'),3,'L104','R100'),
	('P95',1, str_to_date('26,OCT,13 8:00:00','%d,%b,%y %H:%i:%s'),  str_to_date('26,OCT,13 17:00:00','%d,%b,%y %H:%i:%s'),4,'L100','R100'),
	('P95',2, str_to_date('26,OCT,13 9:00:00','%d,%b,%y %H:%i:%s'),  str_to_date('26,OCT,13 17:00:00','%d,%b,%y %H:%i:%s'),4,'L102','R101'),
	('P95',3, str_to_date('26,OCT,13 10:00:00','%d,%b,%y %H:%i:%s'), str_to_date('26,OCT,13 15:00:00','%d,%b,%y %H:%i:%s'),4,'L106','R100'),
	('P95',4, str_to_date('26,OCT,13 13:00:00','%d,%b,%y %H:%i:%s'), str_to_date('26,OCT,13 17:00:00','%d,%b,%y %H:%i:%s'),2,'L100','R103'),
	('P95',5, str_to_date('26,OCT,13 13:00:00','%d,%b,%y %H:%i:%s'), str_to_date('26,OCT,13 17:00:00','%d,%b,%y %H:%i:%s'),2,'L101','R104');