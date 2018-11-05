/*회원 테이블*/
ALTER TABLE academy
ADD (aca_Content clob);
create table users(
	usr_id varchar2(100) primary key,
	usr_pass varchar2(100) not null,
	usr_name varchar2(100) not null,
	usr_addr varchar2(100) not null,
	enabled number default 1,
	nickname varchar2(100) not null,
	birthday varchar2(100) not null,
	usr_regdate date not null,
	usr_email varchar2(100) not null,
	usr_tel varchar2(100) not null
)
select * from users
drop table users
select usr_pass from users where usr_id='java3' and usr_email='ksm0799@naver.com'
select usr_email from users where usr_id='java3'
)
select * from academy
select * from faq
select sysdate from dual; 
select*from users;
select * from aca_users;
insert into users(usr_id,usr_pass,usr_name,usr_addr,enabled,nickname,birthday,usr_regdate,usr_email,usr_tel) 
values('academy','1','윤준상','판교',1,'자바','19841030',sysdate,'hopemans30@gmail.com','01042842646');
insert into users(usr_id,usr_pass,usr_name,usr_addr,enabled,nickname,birthday,usr_regdate,usr_email,usr_tel) 
values('admin','1','관리자','판교',1,'자바','19841030',sysdate,'hopemans30@gmail.com','01042842646');
insert into users(usr_id, usr_pass, usr_name, usr_addr, nickname, birthday, usr_regdate, usr_email, usr_tel) 
values('java', '1', 'name', 'gg', 'nick', 'birth', '2018-10-12', 'email', 'tel')

/*학원회원 테이블*/
create table aca_users(
	usr_id varchar2(100) not null,
	busi_reg_num varchar2(100) not null,
	aca_name varchar2(100) not null,
	aca_addr varchar2(100) not null,
	aca_tel varchar2(100) not null,
	constraint aca_users_fk foreign key(usr_id) references users(usr_id) on delete cascade,
	constraint aca_users_pk primary key(usr_id)
)

select usr_id
		from users where usr_name='김성민' and birthday='1991-07-02' and usr_email='ksm0799@naver.com'
select * from users

/*공지사항 테이블 및 시퀀스*/
drop table notice
create table notice(
	notice_no number primary key,
	notice_title varchar2(100) not null,
	notice_content clob not null,
	notice_regdate date not null,
	usr_id varchar2(100) not null,
	constraint notice_fk foreign key(usr_id) references users(usr_id) on delete cascade
)
drop sequence notice_seq
create sequence notice_seq start with 1 nocache

insert into notice(notice_no,notice_title,notice_content,notice_regdate,usr_id) values(notice_seq.nextval,'제목','내용',sysdate,'java1')
select count(*) from notice
select * from users
/* 공지사항파일첨부 및 시퀀스*/
drop table notice_attach_file
create table notice_attach_file(
	notice_att_no number primary key,
	notice_filepath varchar2(1000) not null,
	notice_no number not null,
	constraint notice_attach_file_fk foreign key(notice_no) references notice(notice_no) on delete cascade
)
create sequence notice_attach_file_seq start with 1 nocache

select n.notice_no,n.notice_title,n.notice_content,n.notice_regdate,u.usr_id,u.usr_name
		from (select notice_no,row_number() over(order by notice_no desc) as rnum,
		notice_title,notice_content,notice_regdate,usr_id from notice) n, users u
		where n.usr_id=u.usr_id and rnum between 1 and 10
		order by notice_no desc
/*권한 테이블*/
drop table authorities
create table authorities(
	authority varchar2(100) not null,
	usr_id varchar2(100) not null,
	constraint authorities_fk foreign key(usr_id) references users(usr_id) on delete cascade,
	constraint authorities_pk primary key(usr_id,authority)
)
insert into authorities(authority,usr_id) values('ROLE_ADMIN','java')
insert into authorities(authority,usr_id) values('ROLE_ADMIN','java5')
insert into authorities(authority,usr_id) values('ROLE_ACADEMY','spring')
select * from users where usr_id='java5'
select * from authorities
insert into authorities(authority,usr_id) values('ROLE_ACADEMY','java1')
insert into authorities(authority,usr_id)
values('ROLE_ACADEMY','admin1')
insert into authorities(authority,usr_id)
values('ROLE_USER','admin1')

select * from AUTHORITIES

/*학원홍보 게시판 테이블 및 시퀀스*/
drop table aca_promo_post
create table aca_promo_post(
	aca_promo_no number primary key,
	aca_promo_title varchar2(100) not null,
	aca_promo_content clob not null,
	aca_promo_regdate date not null,
	aca_promo_hits number default 0,
	usr_id varchar2(100) not null,
	constraint aca_promo_post_fk foreign key(usr_id) references users(usr_id) on delete cascade
)
select * from aca_promo_post
ALTER TABLE aca_promo_post
ALTER COLUMN aca_promo_hits not null default 0;

alter table aca_promo_post modify(aca_promo_hits default 0)

create sequence aca_promo_post_seq start with 1 nocache
select * from aca_promo_post
/*학원홍보 게시판 파일첨부 테이블 및 시퀀스*/
drop table aca_promo_attach_file
create table aca_promo_attach_file(
	aca_promo_att_no number primary key,
	aca_promo_filepath varchar2(1000) not null,
	aca_promo_no number not null,
	constraint aca_promo_attach_file_fk foreign key(aca_promo_no) references aca_promo_post(aca_promo_no) on delete cascade
)
create sequence aca_promo_attach_file_seq start with 1 nocache
select * from aca_promo
select * from aca_promo_attach_file
/*건의게시판 테이블 및 시퀀스*/
create table suggestion_post(
	sug_no number primary key,
	usr_id varchar2(100) not null,
	sug_title varchar2(100) not null,
	sug_content clob not null,
	sug_regdate date not null,
	constraint suggestion_post_fk foreign key(usr_id) references users(usr_id) on delete cascade
)
create sequence suggestion_post_seq start with 1 nocache
select * from suggestion_post
insert into suggestion_post(sug_no,sug_title,sug_content,sug_regdate,usr_id)
		values(suggestion_post_seq.nextval,'하이','응이하이',SYSDATE,'java')
		
		SELECT sug_no,sug_title,sug_content,sug_regdate,usr_id
		FROM(
		SELECT row_number() over(order by sug_no desc) rnum,sug_no,sug_title,sug_content,sug_regdate,usr_id
		 FROM suggestion_post
		) s where rnum between 1 and 5
		order by sug_no desc
/*건의게시판 파일첨부 테이블 및 시퀀스*/
create table sug_post_attach_file(
	sug_post_att_no number primary key,
	sug_post_filepath varchar2(1000) not null,
	sug_no number not null,
	constraint sug_post_attach_file_fk foreign key(sug_no) references suggestion_post(sug_no) on delete cascade
)
create sequence sug_post_attach_file_seq start with 1 nocache

/*FAQ 테이블 및 시퀀스*/
create table faq(
	faq_no number primary key,
	faq_title varchar2(100) not null,
	faq_content clob not null,
	faq_regdate date not null,
	usr_id varchar2(100) not null,
	constraint faq_fk foreign key(usr_id) references users(usr_id) on delete cascade
)
create sequence faq_seq start with 1 nocache

select f.faq_no,f.faq_title,f.faq_content,f.faq_regdate,u.usr_id
from (select faq_no,row_number() over(order by faq_no desc) as rnum,
faq_title,faq_content,faq_regdate,usr_id from faq) f, users u
where f.usr_id=u.usr_id and rnum between 1 and 5
order by faq_no desc

insert into faq(faq_no,faq_title,faq_content,faq_regdate,usr_id)
values(faq_seq.nextval,'제목','내용',sysdate,'java0')
insert into faq(faq_no,faq_title,faq_content,faq_regdate,usr_id)
values(faq_seq.nextval,'제목2','내용2',sysdate,'java0')
insert into faq(faq_no,faq_title,faq_content,faq_regdate,usr_id)
values(faq_seq.nextval,'제목3','내용3',sysdate,'java0')
insert into faq(faq_no,faq_title,faq_content,faq_regdate,usr_id)
values(faq_seq.nextval,'제목4','내용4',sysdate,'java0')
insert into faq(faq_no,faq_title,faq_content,faq_regdate,usr_id)
values(faq_seq.nextval,'제목5','내용5',sysdate,'java0')
insert into faq(faq_no,faq_title,faq_content,faq_regdate,usr_id)
values(faq_seq.nextval,'제목7','내용7',sysdate,'java0')
select * from faq

/*학원 테이블 및 시퀀스*/
create table academy(
	aca_no number primary key,
	aca_name varchar2(100) not null,
	aca_addr varchar2(100) not null,
	aca_tel varchar2(100) not null,
	usr_id varchar2(100) not null,
	constraint academy_fk foreign key(usr_id) references users(usr_id) on delete cascade
)
create table aca_attach_file(
   aca_att_no number primary key,
   aca_filepath varchar2(1000) not null,
   aca_no number not null,
   constraint aca_attach_file_fk foreign key(aca_no) references academy(aca_no) on delete cascade
)
delete from aca_attach_file
create sequence aca_attach_file_seq start with 1 nocache
alter table academy add(aca_main_pic clob)
create 
<<<<<<< HEAD
delete academy
=======
delete 
=======
drop table academy
>>>>>>> branch 'master' of https://github.com/MinseongJJang/Kosta_FinalProject_Team2.git
>>>>>>> branch 'master' of https://github.com/MinseongJJang/Kosta_FinalProject_Team2.git
select * from academy
create sequence academy_seq start with 1 nocache
alter table academy add(aca_main_pic clob);
alter table academy add(aca_content clob);


insert into academy(aca_no,aca_name,aca_addr,aca_tel,usr_id) 
values(academy_seq.nextval,'코스타1','판교','0312558779','java0');

select*from academy;

/*학원 첨부 파일 및 시퀀스*/
drop table aca_attach_file
create table aca_attach_file(
   aca_att_no number primary key,
   aca_filepath varchar2(1000) not null,
   aca_no number not null,
   constraint aca_attach_file_fk foreign key(aca_no) references academy(aca_no) on delete cascade
)
create sequence aca_attach_file_seq start with 1 nocache
alter table academy add(aca_main_pic clob);
/*학원 Q&A 및 시퀀스*/
drop table aca_qna
DELETE from aca_qna
create table aca_qna(
	qna_no number primary key,
	qna_title varchar2(100) not null,
	qna_content clob not null,
	qna_regdate date not null,
	usr_id varchar2(100) not null,
	constraint aca_qna_sfk foreign key(usr_id) references users(usr_id) on delete cascade
)

alter table academy add(aca_main_pic clob);
ALTER TABLE academy
ADD (aca_Content clob);
ALTER TABLE academy
ADD (aca_content clob);

select  a.aca_no, a.aca_name, a.aca_addr, a.aca_tel, a.aca_main_pic, 
		u.usr_id, u.usr_name, u.usr_addr, u.nickname, u.usr_regdate, u.usr_email, u.usr_tel from academy a, users u 
		where a.usr_id = u.usr_id and a.aca_no = '11'
		select  a.aca_no, a.aca_name, a.aca_addr, a.aca_tel, a.aca_main_pic, a.aca_content
		u.usr_id, u.usr_name, u.usr_addr, u.nickname, u.usr_regdate, u.usr_email, u.usr_tel from academy a, users u 
		where a.usr_id = u.usr_id and a.aca_no = '13'

alter table aca_qna drop constraint aca_qna_sfk
select * from ACA_QNA
select r.qna_rep_no,
		r.qna_rep_regdate, r.qna_rep_content, u.usr_id,
		u.nickname
		from
		aca_qna_reply r,users u where r.usr_id=u.usr_id and qna_no='7'
select * from curriculum
select count(*)
		from curriculum where aca_no='1'
select * from aca_qna
alter table aca_qna drop column aca_noss
alter table aca_qna drop constraint aca_qna_ffk
select qna_no, qna_title, qna_content, qna_regdate, usr_id from aca_qna where qna_no='12';
create sequence aca_qna_seq start with 1 nocache
insert into aca_qna(qna_no, qna_title, qna_content, qna_regdate, usr_id) values(aca_qna_seq.nextval, '질문1', '질문1내용', sysdate, 'java')
insert into aca_qna(qna_no, qna_title, qna_content, qna_regdate, usr_id) values(aca_qna_seq.nextval, '질문2', '질문2내용', sysdate, 'java')
insert into aca_qna(qna_no, qna_title, qna_content, qna_regdate, usr_id) values(aca_qna_seq.nextval, '질문3', '질문3내용', sysdate, 'java')
insert into aca_qna(qna_no, qna_title, qna_content, qna_regdate, usr_id) values(aca_qna_seq.nextval, '질문4', '질문4내용', sysdate, 'java')
insert into aca_qna(qna_no, qna_title, qna_content, qna_regdate, usr_id) values(aca_qna_seq.nextval, '질문5', '질문5내용', sysdate, 'java')
insert into aca_qna(qna_no, qna_title, qna_content, qna_regdate, usr_id) values(aca_qna_seq.nextval, '질문6', '질문6내용', sysdate, 'java')

select q.qna_no,q.qna_title,to_char(q.qna_regdate,'YYYY.MM.DD') as qna_regdate, u.usr_id
from(
	select row_number() over(order by qna_no desc) as rnum,qna_no,
	qna_title, qna_regdate,usr_id from aca_qna
)q, users u where q.usr_id=u.usr_id and rnum between 1 and 5
order by q.qna_no desc
	               
select q.qna_no,q.qna_title, to_char(q.qna_regdate,'YYYY.MM.DD') as qna_regdate, q.qna_content, u.usr_id
from aca_qna q, users u 
where q.usr_id=u.usr_id and qna_no='12'

select q.qna_no,q.qna_title,to_char(q.qna_regdate,'YYYY.MM.DD') as qna_regdate, u.usr_id, u.nickname
from(
	select row_number() over(order by qna_no desc) as rnum,qna_no,
	qna_title, qna_regdate,usr_id from aca_qna
)q, users u where q.usr_id=u.usr_id and rnum between 1 and 5
order by q.qna_no desc
drop table aca_qna_attach_file
/* Q&A 파일첨부 및 시퀀스 */
create table aca_qna_attach_file(
	qna_att_no number primary key,
	qna_filepath varchar2(1000) not null,
	qna_no number not null,
	constraint aca_qna_attach_file_fk foreign key(qna_no) references aca_qna(qna_no) on delete cascade
)
create sequence aca_qna_attach_file_seq start with 1 nocache

/*Q&A 댓글 테이블 및 시퀀스*/
drop table aca_qna_reply
create table aca_qna_reply(
	qna_rep_no number primary key,
	qna_rep_regdate date not null,
	qna_rep_content clob not null,
	qna_no number not null,
	usr_id varchar2(100) not null,
	constraint aca_qna_rep_ffk foreign key(qna_no) references aca_qna(qna_no) on delete cascade,
	constraint aca_qna_rep_sfk foreign key(usr_id) references users(usr_id) on delete cascade
) 
create sequence aca_qna_reply_seq start with 1 nocache
insert into aca_qna_reply(qna_rep_no,qna_rep_regdate,qna_rep_content,qna_no,usr_id) 
values(aca_qna_reply_seq.nextval,sysdate,'하이', '7',  'java')

insert into aca_qna_reply(qna_rep_no,qna_rep_regdate,qna_rep_content,qna_no,usr_id) 
values(aca_qna_reply_seq.nextval,sysdate,'공부', '7',  'java')
select * from aca_qna_reply
select r.qna_rep_no, r.qna_rep_regdate, r.qna_rep_content, u.usr_id, u.nickname 
from aca_qna_reply r,users u where r.usr_id=u.usr_id

/*Q&A 파일첨부 테이블 및 시퀀스*/
drop table aca_qna_reply_attach_file
create table aca_qna_reply_attach_file(
	qna_rep_att_no number primary key,
	qna_rep_filepath varchar2(1000) not null,
	qna_rep_no number not null,
	constraint aca_qna_reply_attach_file_fk foreign key(qna_rep_no) references aca_qna_reply(qna_rep_no) on delete cascade
)
create sequence aca_qna_reply_attach_file_seq start with 1 nocache

/*커리큘럼 테이블 및 시퀀스*/
create table curriculum(
	cur_no number primary key,
	aca_no number not null,
	cur_name varchar2(100) not null,
	limit_mem number not null,
	cur_content clob not null,
	cur_lecturer varchar2(100) not null,
	cur_textbook varchar2(100) not null,
	constraint curriculum_fk foreign key(aca_no) references academy(aca_no) on delete cascade
)

select * from curriculum
alter table curriculum add(cur_main_pic clob);
alter table curriculum drop column cur_main_pic
alter table curriculum add(cur_main_pic varchar2(1000));

select*from curriculum

SELECT c.cur_no,c.cur_name,c.limit_mem,c.cur_content,c.cur_lecturer,c.cur_textbook,c.aca_no FROM(
		SELECT row_number() over(order by cur_no desc) as rnum,cur_no,cur_name,limit_mem,cur_content,cur_lecturer,cur_textbook,aca_no
		FROM curriculum
		) c,academy a where c.aca_no=a.aca_no and rnum between '1' and '4'
		order by cur_no desc

				SELECT c.cur_no,c.cur_name,c.limit_mem,c.cur_content,c.cur_lecturer,c.cur_textbook,c.aca_no,a.aca_name FROM(
		SELECT row_number() over(order by cur_no desc) as rnum,cur_no,cur_name,limit_mem,cur_content,cur_lecturer,cur_textbook,aca_no
		FROM curriculum
		) c, a where c.aca_no=a.aca_no and a.aca_no='1' and rnum  between '1' and '4'
		order by c.cur_no desc
		
delete from curriculum where cur_no='2';
select
			curriculum_seq.nextval from dual
select
		c.cur_no,c.cur_name,NVL( c.cur_main_pic, 'UNKNOWN' ),c.limit_mem,c.cur_content,c.cur_lecturer,c.cur_textbook,c.aca_no,a.aca_name
		from curriculum
		c,academy a where
		c.aca_no=a.aca_no and
		c.cur_no='99'
		
		select
		c.cur_no,c.cur_name,c.cur_main_pic,c.limit_mem,c.cur_content,c.cur_lecturer,c.cur_textbook,c.aca_no,a.aca_name
		from curriculum
		c,academy a where
		c.aca_no=a.aca_no and
		c.cur_no='112'
		
	insert into
		curriculum(cur_no,aca_no,cur_name,limit_mem,cur_content,cur_lecturer,cur_textbook,cur_main_pic)
		values('100','5','자바','15','ㅁㅁ','ㅁ','ㅎ','ㅂ')

select cur_no,cur_name,NVL( cur_main_pic, 'UNKNOWN' ),limit_mem,cur_content,cur_lecturer,cur_textbook
		from curriculum
		 where
		cur_no='99'
delete from curriculum where cur_no between '1' and '141'
create sequence curriculum_seq start with 1 nocache
insert into curriculum(cur_no,aca_no,cur_name,limit_mem,cur_content,cur_lecturer,cur_textbook) 
values(curriculum_seq.nextval,'1','자바의 기초',10,'자바 쉽지 않지만 재밌다.','윤준상','자바의 정석');
insert into curriculum(cur_no,aca_no,cur_name,limit_mem,cur_content,cur_lecturer,cur_textbook) 
values(curriculum_seq.nextval,'1','자바의 기초',10,'자바 쉽지 않지만 재밌다.','윤준상','자바의 정석');
insert into curriculum(cur_no,aca_no,cur_name,limit_mem,cur_content,cur_lecturer,cur_textbook) 
values(curriculum_seq.nextval,'1','자바의 기초',10,'자바 쉽지 않지만 재밌다.','윤준상','자바의 정석');

SELECT c.cur_no,c.cur_name,c.limit_mem,c.cur_content,c.cur_lecturer,c.cur_textbook,c.aca_no FROM(
		SELECT row_number() over(order by cur_no desc) as rnum,cur_no,cur_name,limit_mem,cur_content,cur_lecturer,cur_textbook,aca_no
		FROM curriculum
		) c,academy a where c.aca_no=a.aca_no 
		order by cur_no desc
		
select*from CURRICULUM;
select sequence curriculum_seq;

update curriculum
		set
		cur_name='9',limit_mem='9',cur_content='9',cur_lecturer='9',cur_textbook='9'
		where cur_no='53'
		
/*커리큘럼 파일첨부테이블 및 시퀀스*/
private String curriculumAttNo;
	private String curriculumFilepath;
	private CurriculumVO curriculumVO;
	
create table cur_attach_file(
	cur_att_no number primary key,
	cur_filepath varchar2(1000) not null,
	cur_no number not null,
	constraint cur_attach_file_fk foreign key(cur_no) references curriculum(cur_no) on delete cascade
)
drop table cur_attach_file
create sequence cur_attach_file_seq start with 1 nocache


/*학원후기 게시판 테이블 및 시퀀스*/
create table aca_review_post(
	aca_rev_no number primary key,
	cur_no number not null,
	aca_rev_title varchar2(100) not null,
	aca_rev_content clob not null,
	aca_rev_regdate date not null,
	aca_rev_hits number default 0,
	usr_id varchar2(100) not null,
	constraint aca_review_post_ffk foreign key(cur_no) references curriculum(cur_no) on delete cascade,
	constraint aca_review_post_sfk foreign key(usr_id) references users(usr_id) on delete cascade
)
create sequence aca_review_post_seq start with 1 nocache
alter table aca_review_post drop column aca_rev_content
alter table aca_review_post add(aca_rev_content clob)

alter table aca_review_post modify(aca_rev_content clob not null)

alter table aca_review_reply rename to aca_rev_reply
drop sequence aca_review_reply_seq
create sequence aca_rev_reply_seq start with 1 nocache

alter table aca_review_post drop column aca_rev_content
alter table aca_review_post add(aca_rev_content clob)

select * from aca_review_reply
	
select * from( 
    select * from aca_review_post
    order by DBMS_RANDOM.RANDOM 
) where rownum < 6 and cur_no=11;

alter table aca_review_post modify(aca_rev_hits number default 0)
insert into aca_review_post(aca_rev_no,cur_no,aca_rev_title,aca_rev_content,aca_rev_regdate,usr_id) 
values(aca_review_post_seq.nextval,1,'코스타좋아요','코스타개조음',sysdate,'java')

alter table aca_review_post drop column aca_rev_content
alter table aca_review_post add(aca_rev_content clob)


insert into aca_review_post(aca_rev_no,cur_no,aca_rev_title,aca_rev_content,aca_rev_regdate,usr_id) 
values(aca_review_post_seq.nextval,2,'코스타좋아요1','코스타개조음',sysdate,'java')
insert into aca_review_post(aca_rev_no,cur_no,aca_rev_title,aca_rev_content,aca_rev_regdate,usr_id) 
values(aca_review_post_seq.nextval,11,'코스타2','코스타개조음',sysdate,'java1')
insert into aca_review_post(aca_rev_no,cur_no,aca_rev_title,aca_rev_content,aca_rev_regdate,usr_id) 
values(aca_review_post_seq.nextval,11,'코스타좋아요3','코스타개조음',sysdate,'java1')
insert into aca_review_post(aca_rev_no,cur_no,aca_rev_title,aca_rev_content,aca_rev_regdate,usr_id) 
values(aca_review_post_seq.nextval,11,'코스타14','코스타개조음1111',sysdate,'java1')
insert into aca_review_post(aca_rev_no,cur_no,aca_rev_title,aca_rev_content,aca_rev_regdate,usr_id) 
values(aca_review_post_seq.nextval,11,'코스타좋아요5','코스타개조음',sysdate,'java1')
insert into aca_review_post(aca_rev_no,cur_no,aca_rev_title,aca_rev_content,aca_rev_regdate,usr_id) 
values(aca_review_post_seq.nextval,11,'코스타좋아요6','코스타개조음',sysdate,'java1')

select * from aca_review_post
select * from aca_review_post


/*학원후기 만족도 테이블*/
create table aca_cur_satisfaction(
	aca_rev_no number not null,
	cur_satis number not null,
	amenities_satis number not null,
	lecturer_satis number not null,
	emp_links_satis number not null,
	traffic_satis number not null,
	constraint aca_cur_satisfaction_fk foreign key(aca_rev_no) references aca_review_post(aca_rev_no) on delete cascade
)
select * from aca_review_post
select * from aca_cur_satisfaction
select avg(cur_satis)*10, avg(amenities_satis)*10, avg(lecturer_satis)*10, avg(emp_links_satis)*10, avg(traffic_satis)*10 from aca_cur_satisfaction where 

select (AVG(a.cur_satis)*10) as cur_satis, (AVG(a.amenities_satis)*10) as amenities_satis, (AVG(a.lecturer_satis)*10) as lecturer_satis, (AVG(a.emp_links_satis)*10) as emp_links_satis, (AVG(a.traffic_satis)*10) as traffic_satis
from(
	select * from aca_cur_satisfaction
)a, aca_review_post r where a.aca_rev_no=r.aca_rev_no and r.cur_no=1;

select avg(a.cur_satis)*10, avg(a.amenities_satis)*10, avg(a.lecturer_satis)*10, avg(a.emp_links_satis)*10, avg(a.traffic_satis)*10
from(
	select * from aca_cur_satisfaction
)a, aca_review_post r where a.aca_rev_no=r.aca_rev_no and r.cur_no=11;

 	select a.cur_satis, a.amenities_satis, a.lecturer_satis, a.emp_links_satis, a.traffic_satis
		from(
			select * from aca_cur_satisfaction
		)a, aca_review_post r where a.aca_rev_no=r.aca_rev_no and r.cur_no=11;
 
/*해쉬태그 테이블*/
create table hashtag(
   hashtag_no number primary key,
   aca_rev_no number not null,
   hashtag_name varchar2(100) not null,
   constraint hashtag_fk foreign key(aca_rev_no) references aca_review_post(aca_rev_no) on delete cascade
)
drop table hashtag
create sequence hashtag_seq start with 1 nocache

select count(*) from users where usr_id='java3'
drop table hashtag
alter table aca_review_post drop column aca_rev_content
alter table aca_review_post add(aca_rev_content clob)
/*학원후기 파일첨부 및 시퀀스*/
drop table aca_rev_attach_file
create table aca_review_attach_file(
	aca_rev_att_no number primary key,
	aca_rev_no number not null,
	aca_rev_filepath varchar2(1000) not null,
	constraint aca_review_attach_file_fk foreign key(aca_rev_no) references aca_review_post(aca_rev_no) on delete cascade
)
alter table aca_review_attach_file modify(aca_rev_filepath varchar2(3000))
drop sequence aca_rev_attach_file_seq
create sequence aca_review_attach_file_seq start with 1 nocache
select aca_review_attach_file_seq.nextval from dual
/*학원후기 댓글 테이블 및 시퀀스*/
drop table aca_rev_reply
select * from aca_rev_reply
create table aca_rev_reply(
	aca_rev_rep_no number primary key,
	aca_rev_rep_regdate date not null,
	aca_rev_rep_content clob not null,
	aca_rev_no number not null,
	usr_id varchar2(100) not null,
	constraint aca_review_reply_fffk foreign key(aca_rev_no) references aca_review_post(aca_rev_no) on delete cascade,
	constraint aca_review_reply_sffk foreign key(usr_id) references users(usr_id) on delete cascade
)
alter table aca_rev_reply rename column review_rep_regdate to aca_rev_rep_regdate
alter table aca_rev_reply rename column review_rep_content to aca_rev_rep_content

insert into aca_rev_reply(aca_rev_rep_no,review_rep_regdate,review_rep_content,aca_rev_no,usr_id) values
(aca_rev_reply_seq.nextval,sysdate,'굿','25','java')
alter table aca_review_reply rename to aca_rev_reply
drop sequence aca_rev_reply_seq
create sequence aca_rev_reply_seq start with 1 nocache

/*학원후기 파일첨부 및 시퀀스*/
drop table aca_review_reply_attach_file
create table aca_review_reply_attach_file(
	aca_rev_rep_att_no number primary key,
	aca_rev_rep_filepath varchar2(1000) not null,
	aca_rev_rep_no number not null,
	constraint aca_rev_rep_attach_file_fk foreign key(aca_rev_rep_no) references aca_review_reply(aca_rev_rep_no) on delete cascade
)
drop sequence aca_rev_reply_attach_file_seq
create sequence aca_review_reply_attach_seq start with 1 nocache

select faq_no,faq_title,faq_content,faq_regdate,usr_id from faq

select f.faq_no,f.faq_title,f.faq_content,f.faq_regdate,u.usr_id
from (select faq_no,row_number() over(order by faq_no desc) as rnum,
faq_title,faq_content,faq_regdate,usr_id from faq) f, users u
where f.usr_id=u.usr_id and rnum between 1 and 3
order by faq_no desc

select faq_no,faq_title,faq_content,faq_regdate,usr_id
from faq where faq_no='4'


SELECT c.cur_no,c.cur_name,c.limit_mem,c.cur_content,c.cur_lecturer,c.cur_textbook,c.aca_no FROM(
SELECT row_number() over(order by cur_no desc) as rnum,cur_no,cur_name,limit_mem,cur_content,cur_lecturer,cur_textbook,aca_no
FROM curriculum
) c,academy a where c.aca_no=a.aca_no 
order by cur_no desc

select distinct a.busi_reg_num,a.aca_name,a.aca_addr,a.aca_tel,
		u.usr_id,u.usr_name,u.usr_addr,u.nickname,u.birthday,u.usr_regdate,u.usr_email,u.usr_tel from(
		select usr_id,usr_name,usr_addr,nickname,birthday,usr_regdate,usr_email,usr_tel
		from users) u, aca_users a where u.usr_id = 'java00'
		
		select a.usr_id as a.aca_id,a.busi_reg_num,a.aca_name,a.aca_addr,a.aca_tel,
		u.usr_id,u.usr_name,u.usr_addr,u.nickname,u.birthday,u.usr_regdate,u.usr_email,u.usr_tel from(
		select usr_id,usr_name,usr_addr,nickname,birthday,usr_regdate,usr_email,usr_tel
		from users) u, aca_users a where usr_id = 'java10'
		
		SELECT u.usr_id,u.usr_name,u.usr_addr,u.nickname,u.birthday,
		u.usr_regdate,u.usr_email,u.usr_tel
		FROM(
		SELECT row_number() over(order by usr_regdate asc) rnum,usr_id,usr_name,usr_addr,nickname,birthday,
		usr_regdate,usr_email,usr_tel FROM users
		) u,users au where u.usr_id=au.usr_id and rnum between 1 and 20
		order by u.usr_regdate asc

		select usr_id,usr_name,usr_addr,nickname,birthday,usr_regdate,usr_email,usr_tel
		from users where usr_id='java02'

create table hashtag(
   hashtag_no number primary key,
   aca_rev_no number not null,
   hashtag_name varchar2(100) not null,
   constraint hashtag_fk foreign key(aca_rev_no) references aca_review_post(aca_rev_no) on delete cascade
)
drop table hashtag

create sequence hashtag_seq start with 1 nocache
		
alter table aca_review_post drop column aca_rev_content
alter table aca_review_post add(aca_rev_content clob)

alter table aca_review_attach_file modify(aca_rev_filepath varchar2(3000))



create table location(
	province varchar2(100) not null,
	district varchar2(100) ,
	constraint province primary key (province, district)
)
select * from location
delete from location
insert into location (province, district) values ('서울', '종로구');
insert into location (province, district) values ('서울', '중구');
insert into location (province, district) values ('서울', '용산구');
insert into location (province, district) values ('서울', '광진구');
insert into location (province, district) values ('서울', '성북구');
insert into location (province, district) values ('서울', '도봉구');
insert into location (province, district) values ('서울', '노원구');
insert into location (province, district) values ('서울', '은평구');
insert into location (province, district) values ('서울', '서대문구');
insert into location (province, district) values ('서울', '강남구');
insert into location (province, district) values ('서울', '송파구');
insert into location (province, district) values ('서울', '관악구');
insert into location (province, district) values ('서울', '동작구');
insert into location (province, district) values ('서울', '강서구');
insert into location (province, district) values ('서울', '서초구');
insert into location (province, district) values ('서울', '중랑구');
insert into location (province, district) values ('경기 수원시', '장안구');
insert into location (province, district) values ('경기 수원시', '권선구');
insert into location (province, district) values ('경기 수원시', '팔달구');
insert into location (province, district) values ('경기 수원시', '영통구');
insert into location (province, district) values ('경기 성남시', '수정구');
insert into location (province, district) values ('경기 성남시', '중원구');
insert into location (province, district) values ('경기 성남시', '분당구');
insert into location (province, district) values ('경기 안양시', '만안구');
insert into location (province, district) values ('경기 안양시', '동안구');
insert into location (province, district) values ('경기 용인시', '처인구');
insert into location (province, district) values ('경기 용인시', '기흥구');
insert into location (province, district) values ('경기 용인시', '수지구');
insert into location (province, district) values ('경기 의정부시', '의정부동');
insert into location (province, district) values ('경기 의정부시', '호원동');
insert into location (province, district) values ('경기 의정부시', '신곡동');
insert into location (province, district) values ('경기 의정부시', '송산동');
insert into location (province, district) values ('강원도', '춘천시');
insert into location (province, district) values ('충청북도', '청주시');
insert into location (province, district) values ('충청남도', '천안시');
insert into location (province, district) values ('전라북도', '목포시');
insert into location (province, district) values ('전라남도', '여수시');
insert into location (province, district) values ('경상북도', '포항시');
insert into location (province, district) values ('경상남도', '창원시');
insert into location (province, district) values ('제주특별자치도', '제주시');
select r.aca_rev_no,r.aca_rev_title,r.aca_rev_content,r.aca_rev_regdate,r.aca_rev_hits,u.usr_id,
		(select usr_name from users where usr_id=r.usr_id) as usr_name,r.cur_no,(select cur_name from curriculum where cur_no = r.cur_no) as cur_name,
		c.aca_no ,(select aca_name from academy where aca_no = c.aca_no) as aca_name
		from aca_review_post r,users u , curriculum c
		where r.usr_id = u.usr_id and 
		c.cur_no = r.cur_no and
		r.aca_rev_no = '14'
		
select * from hashtag
select hashtag_no,hashtag_name from hashtag where aca_rev_no = '27'
select * from academy
select cur_no,cur_name from curriculum
select aca_no,aca_name from academy
select c.cur_no,c.cur_name,a.aca_no,a.aca_name from curriculum c , academy a 
		where c.aca_no = a.aca_no and
		c.aca_no = '3'
select c.cur_no,c.cur_name,a.aca_no,a.aca_name from curriculum c , academy a 
where c.aca_no = a.aca_no and
c.aca_no = '3'

create table aca_review_reply(
	aca_rev_rep_no number primary key,
	review_rep_regdate date not null,
	review_rep_content clob not null,
	aca_rev_no number not null,
	usr_id varchar2(100) not null,
	constraint aca_review_reply_ffk foreign key(aca_rev_no) references aca_review_post(aca_rev_no) on delete cascade,
	constraint aca_review_reply_sfk foreign key(usr_id) references users(usr_id) on delete cascade
)
insert into aca_rev_reply(aca_rev_rep_no,review_rep_regdate,review_rep_content,aca_rev_no,usr_id) values(
aca_rev_reply_seq.nextval,sysdate,'댓글2','67','spring')
select r.aca_rev_rep_no,r.review_rep_regdate,r.review_rep_content,u.usr_id,u.nickname,r.aca_rev_no
		from (select aca_rev_rep_no,row_number() over(order by aca_rev_rep_no desc) as rnum,review_rep_regdate,review_rep_content,
		aca_rev_no,usr_id from aca_rev_reply) r , users u
		where u.usr_id = r.usr_id and
		r.aca_rev_no = 30 and
		rnum between 1 and 5
		order by r.aca_rev_rep_no desc


select r.aca_rev_rep_no,r.review_rep_regdate,r.review_rep_content,u.usr_id,u.nickname,r.aca_rev_no
		from (select aca_rev_rep_no,row_number() over(order by aca_rev_rep_no desc) as rnum,review_rep_regdate,review_rep_content,
		aca_rev_no,usr_id from aca_rev_reply) r , users u
		where u.usr_id = r.usr_id and
		r.aca_rev_no = '1' and
		rnum between '1' and '5'
		order by r.aca_rev_rep_no desc


create table cur_attach_file(
   cur_att_no number primary key,
   cur_filepath varchar2(1000) not null,
   cur_no number not null,
   constraint cur_attach_file_fk foreign key(cur_no) references curriculum(cur_no) on delete cascade
)

create sequence cur_attach_file_seq start with 1 nocache

select a.aca_no, a.aca_name, a.aca_addr, a.aca_main_pic,c.cur_no, c.cur_name, c.cur_content,c.cur_main_pic
	from(select row_number() over(order by aca_no desc) as rnum, aca_no, cur_name, cur_no, cur_content,cur_main_pic from curriculum) c, academy a
	where upper (cur_name) LIKE '%'||upper('sp')||'%' and a.aca_no = c.aca_no 
	and  rnum between 1  and 5 order by a.aca_no desc

select * from curriculum

	select a.aca_no, a.aca_name, a.aca_addr, a.aca_main_pic, c.cur_no, c.cur_name, c.cur_content, c.cur_main_pic
	from(select row_number() over(order by aca_no desc) as rnum, aca_no, cur_name, cur_no, cur_content, cur_main_pic from curriculum) c, academy a
	where upper (c.cur_name) LIKE '%'||upper('sp')||'%' and a.aca_no = c.aca_no 
	and  rnum between 1  and 10 order by a.aca_no desc


drop table aca_attach_file
create table aca_attach_file(
   aca_att_no number primary key,
   aca_filepath varchar2(1000) not null,
   aca_no number not null,
   constraint aca_attach_file_fk foreign key(aca_no) references academy(aca_no) on delete cascade
)
create sequence aca_attach_file_seq start with 1 nocache
select * from curriculum
select a.aca_no, a.aca_name, a.aca_addr, a.aca_main_pic, c.cur_no, c.cur_name, c.cur_content, c.cur_main_pic
	from(select row_number() over(order by aca_no desc) as rnum, aca_no, cur_name, cur_no, cur_content, cur_main_pic from curriculum) c, academy a
	where upper (c.cur_name) LIKE '%'||upper('c++')||'%' and a.aca_no = c.aca_no 
	and  rnum between 1  and 5 order by a.aca_no desc

select a.aca_no,a.aca_name,a.aca_addr,a.aca_main_pic,c.cur_name from
(select row_number() over(order by aca_no desc) as rnum, aca_no ,aca_name,aca_addr,aca_main_pic from academy) a,curriculum c
where a.aca_no = c.aca_no and
a.aca_no = 1 and c.cur_name='자바'

select c.cur_no,c.cur_name,c.limit_mem,c.cur_content,c.cur_lecturer,c.cur_textbook,c.cur_main_pic,c.aca_no,a.aca_name
		from (select row_number() over(order by cur_no desc) as rnum,cur_no,cur_name,limit_mem,cur_content,cur_lecturer,cur_textbook,cur_main_pic,aca_no
		from curriculum) c,academy a 
		where c.aca_no=a.aca_no and a.aca_no=1 and rnum between 6 and 11
		order by cur_no desc

select a.aca_no, a.aca_name, a.aca_addr, a.aca_tel, u.usr_id, u.nickname, a.aca_main_pic
		from(select row_number() over(order by aca_no desc) as rnum, aca_no, aca_name, aca_addr, aca_tel, usr_id,aca_main_pic from academy) a, users u
		where a.usr_id = u.usr_id  and rnum between #{startRowNumber} and #{endRowNumber} order by aca_no desc

select * from curriculum where aca_no=1
select count(*)
from curriculum where aca_no=1

select a.aca_no, a.aca_name, a.aca_addr, a.aca_main_pic, c.cur_no, c.cur_name, c.cur_content, c.cur_main_pic
from(select row_number() over(order by aca_no desc) as rnum, aca_no, cur_name, cur_no, cur_content, cur_main_pic from curriculum) c, academy a
where upper (c.cur_name) LIKE '%'||upper('자바')||'%' and a.aca_no = c.aca_no
and  rnum between 1 and 5 order by a.aca_no desc

select
select a.aca_no,a.aca_name,c.cur_no,c.cur_name,c.cur_content,c.cur_main_pic
from (select row_number() over(order by aca_no desc) as rnum, aca_no , cur_name, cur_no , cur_content , cur_main_pic from curriculum) c , academy a
where a.aca_no = c.aca_no and c.cur_name like '%'||'자바'||'%' and 
rnum between 1 and 5 order by aca_no desc



select c.cur_no,c.cur_name,c.cur_content,c.cur_main_pic from (select row_number() over(order by cur_no desc) as rnum 
cur_no,cur_name,cur_content,cur_main_pic)
select * from users
select * from aca_promo_post
select * from aca_promo_post
insert into authorities(authority,usr_id) values('ROLE_ACADEMY','java')
SELECT * from authorities

select * from academy


select a.aca_no, a.aca_name, a.aca_addr, a.aca_main_pic,c.cur_no, c.cur_name, c.cur_content,c.cur_main_pic
	from(select row_number() over(order by aca_no desc) as rnum, aca_no, cur_name, cur_no, cur_content,cur_main_pic from curriculum) c, academy a
	where upper (a.aca_addr) LIKE '%'||upper('경기 성남시 분당구')||'%' and a.aca_no = c.aca_no 
	and  rnum between 1 and 5 order by a.aca_no desc
select count(*) from  academy
	where upper (aca_addr) LIKE '%'||upper('경기 성남시 분당구')||'%'
select a.aca_no, a.aca_name, a.aca_addr, a.aca_main_pic,c.cur_no, c.cur_name, c.cur_content,c.cur_main_pic
	from(select row_number() over(order by aca_no desc) as rnum, aca_no, cur_name, cur_no, cur_content,cur_main_pic from curriculum) c, academy a
	where upper (a.aca_addr) LIKE '%'||upper('경기 성남시 분당구')||'%' and a.aca_no = c.aca_no 
	and  rnum between 1 and 5 order by a.aca_no desc
	
select aca_att_no,aca_filepath from aca_attach_file where aca_no = 24