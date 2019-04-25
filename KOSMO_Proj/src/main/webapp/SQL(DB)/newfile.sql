
/* Drop Tables */


DROP TABLE baby_border CASCADE CONSTRAINTS;
DROP TABLE calender  CASCADE CONSTRAINTS;
DROP TABLE reservation CASCADE CONSTRAINTS;
DROP TABLE carpool_border  CASCADE CONSTRAINTS;
DROP TABLE hospital CASCADE CONSTRAINTS;
DROP TABLE kidhouse CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE map CASCADE CONSTRAINTS;
DROP TABLE code CASCADE CONSTRAINTS;
DROP TABLE partner_members CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE baby_border
(
	no number NOT NULL,
	title nvarchar2(20) NOT NULL,
	thumbnail varchar2(300),
	url varchar2(300) NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE calender 
(
	cal_no number NOT NULL,
	title nvarchar2(20) NOT NULL,
	startday date NOT NULL,
	endday date,
	content nvarchar2(300),
	type nvarchar2(20),
	id varchar2(20) NOT NULL,
	PRIMARY KEY (Cal_no)
);


CREATE TABLE carpool_border 
(
	cp_no number NOT NULL,
	startpoint nvarchar2(100) NOT NULL,
	endpoint nvarchar2(100) NOT NULL,
	type nvarchar2(10),
	content nvarchar2(20),
	start_Xpos number NOT NULL,
	start_Ypos number NOT NULL,
	end_Xpos number NOT NULL,
	end_Ypos number NOT NULL,
	id varchar2(20) NOT NULL,
	-- 0 : 카시트 미 존재
	-- 1 : 카시트 존재
	carseat char(1) DEFAULT '0' CONSTRAINTS carseat_CK CHECK (carseat = '0' OR carseat = '1'),
	time Date NOT NULL,
	price number NOT NULL,
	PRIMARY KEY (cp_no)
);


CREATE TABLE code
(
	code number NOT NULL,
	code_name nvarchar2(20),
	PRIMARY KEY (code)
);


CREATE TABLE hospital
(
	no number NOT NULL,
	subject nvarchar2(20),
	nightcare varchar2(10),
	map_no number NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE kidhouse
(
	no number NOT NULL,
	limitcount number,
	teachercount number,
	map_no number NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE map
(
	map_no number NOT NULL,
	name nvarchar2(20),
	addr nvarchar2(20),
	tel varchar2(20),
	totalscore number,
	code number NOT NULL,
	PRIMARY KEY (map_no)
);


CREATE TABLE members
(
	id varchar2(20) NOT NULL,
	-- 최소 : 6자
	-- 최대 : 16자
	-- 영문과 숫자와 특수문자의 조합으로...
	pwd varchar2(16) NOT NULL,
	name nvarchar2(5) NOT NULL,
	addr nvarchar2(100) NOT NULL,
	email varchar2(50) NOT NULL,
	tel nvarchar2(15) NOT NULL,
	-- 이메일 인증 키 입니다.
	authkey nvarchar2(50),
	-- 이메일 인증이 완료가되면 값이 들어갑니다. 
	-- 0이면 인증이 되지 않았습니다. 
	-- 1이면 인증이 되어있는 상태입니다.
    -- 추후 시큐리티와 밀접한 연관이 있기때문에 체크하지않으면 아예 홈페이지가 맛이갑니다.
	enabled number(1) DEFAULT 0 CONSTRAINTS enabled_CK CHECK (enabled = 0 OR enabled = 1),
    partnerstatus char(1) DEFAULT '0' CONSTRAINTS partnerstatus_CK CHECK (partnerstatus = '0' OR partnerstatus = '1'),
	AUTHORITY nvarchar2(20)  DEFAULT 'ROLE_USER',
	PRIMARY KEY (id)
);


CREATE TABLE partner_members
(
	p_no number NOT NULL,
	id varchar2(20) NOT NULL,
	carnumber nvarchar2(20),
	-- 소형차
	-- 중형차
	-- 대형차
	cartype nvarchar2(10),
	career nvarchar2(10),
	photo varchar2(300),
	totalscore number,
	totalcount number,
	PRIMARY KEY (p_no)
);


CREATE TABLE reservation
(
	rs_no number NOT NULL,
	score number,
	-- 계약이 완료되었는지 판단하는 컬럼입니다
	-- 0이면 아직 진행중, 1이면 완료되어 완료테이블에서 조회 가능합니다.
	finish char(1) DEFAULT '0' CONSTRAINTS finish_CK CHECK (finish = '0' OR finish = '1'),
	id varchar2(20) NOT NULL,
	cp_no number NOT NULL,
	PRIMARY KEY (rs_no)
);


CREATE TABLE review
(
	rv_no number NOT NULL,
	title nvarchar2(50),
	content nvarchar2(2000),
	score number,
	id varchar2(20) NOT NULL,
	map_no number NOT NULL,
	PRIMARY KEY (rv_no)
);



/* Create Foreign Keys */

ALTER TABLE reservation
	ADD FOREIGN KEY (cp_no)
	REFERENCES carpool_border  (cp_no)
;


ALTER TABLE map
	ADD FOREIGN KEY (code)
	REFERENCES code (code)
;


ALTER TABLE hospital
	ADD FOREIGN KEY (map_no)
	REFERENCES map (map_no)
;


ALTER TABLE kidhouse
	ADD FOREIGN KEY (map_no)
	REFERENCES map (map_no)
;


ALTER TABLE review
	ADD FOREIGN KEY (map_no)
	REFERENCES map (map_no)
;


ALTER TABLE calender 
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE carpool_border 
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE partner_members
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE reservation
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE review
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;



-- 관리자 아이디넣기
insert into members values('admin','asd123!@#','관리자','주소','이메일','01012345678','인증키','1',1,default);

-- 카풀 게시판

insert into carpool_border values(2,'강남역','역삼역','태워주세요','연락처 010-1234-5678',37.498184,127.028484,37.500474,127.036082,'lee',0,sysdate,10000);
insert into carpool_border values(3,'강남역','역삼역','태워주세요','연락처 010-1234-5678',37.498184,127.028484,37.500474,127.036082,'park',0,sysdate,10000);
insert into carpool_border values(4,'강남역','역삼역','태워주세요','연락처 010-1234-5678, 37.498184,127.028484,37.500474,127.036082,'choi',0,sysdate,10000);
insert into members values('lee','1234','이길동','천호동','01012345678','adf@nate.com',0,0,0);
insert into members values('kim','1234','김길동','천호동','01012345678','adf@nate.com',0,0,0);
insert into members values('park','1234','박길동','천호동','01012345678','adf@nate.com',0,0,0);
insert into members values('choi','1234','최길동','천호동','01012345678','adf@nate.com',0,0,0);



commit;


