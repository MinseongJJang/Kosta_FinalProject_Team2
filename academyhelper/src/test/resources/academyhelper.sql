/*회원 테이블*/
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
select * from academy
select * from faq
select sysdate from dual; 
select*from users;
select * from aca_users;
insert into users(usr_id,usr_pass,usr_name,usr_addr,enabled,nickname,birthday,usr_regdate,usr_email,usr_tel) 
values('java','1','윤준상','판교',1,'자바','19841030',sysdate,'hopemans30@gmail.com','01042842646');
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
	notice_filepath varchar2(100) not null,
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
insert into authorities(authority,usr_id) values('ROLE_ADMIN','java1')
insert into authorities(authority,usr_id)
values('ROLE_ACADEMY','admin1')
insert into authorities(authority,usr_id)
values('ROLE_USER','admin1')

select * from AUTHORITIES

/*학원홍보 게시판 테이블 및 시퀀스*/
create table aca_promo_post(
	aca_promo_no number primary key,
	aca_promo_title varchar2(100) not null,
	aca_promo_content clob not null,
	aca_promo_regdate date not null,
	aca_promo_hits number not null,
	usr_id varchar2(100) not null,
	constraint aca_promo_post_fk foreign key(usr_id) references users(usr_id) on delete cascade
)
create sequence aca_promo_post_seq start with 1 nocache

/*학원홍보 게시판 파일첨부 테이블 및 시퀀스*/
create table aca_promo_attach_file(
	aca_promo_att_no number primary key,
	aca_promo_filepath varchar2(100) not null,
	aca_promo_no number not null,
	constraint aca_promo_attach_file_fk foreign key(aca_promo_no) references aca_promo_post(aca_promo_no) on delete cascade
)
create sequence aca_promo_attach_file_seq start with 1 nocache

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
	sug_post_filepath varchar2(100) not null,
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
delete academy
select * from academy
create sequence academy_seq start with 1 nocache

insert into academy(aca_no,aca_name,aca_addr,aca_tel,usr_id) 
values(academy_seq.nextval,'코스타1','판교','0312558779','java0');

select*from academy;

/*학원 Q&A 및 시퀀스*/
drop table aca_qna
delete aca_qna
create table aca_qna(
	qna_no number primary key,
	qna_title varchar2(100) not null,
	qna_content clob not null,
	qna_regdate date not null,
	usr_id varchar2(100) not null,
	constraint aca_qna_sfk foreign key(usr_id) references users(usr_id) on delete cascade
)
select r.qna_rep_no,
		r.qna_rep_regdate, r.qna_rep_content, u.usr_id,
		u.nickname
		from
		aca_qna_reply r,users u where r.usr_id=u.usr_id and qna_no='7'

select count(*)
		from curriculum where aca_no='1'
select * from aca_qna
alter table aca_qna drop column aca_no
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

/* Q&A 파일첨부 및 시퀀스 */
create table aca_qna_attach_file(
	qna_att_no number primary key,
	qna_filepath varchar2(100) not null,
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
	qna_rep_filepath varchar2(100) not null,
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
SELECT c.cur_no,c.cur_name,c.limit_mem,c.cur_content,c.cur_lecturer,c.cur_textbook,c.aca_no FROM(
		SELECT row_number() over(order by cur_no desc) as rnum,cur_no,cur_name,limit_mem,cur_content,cur_lecturer,cur_textbook,aca_no
		FROM curriculum
		) c,academy a where c.aca_no=a.aca_no and rnum between '1' and '4'
		order by cur_no desc

				SELECT c.cur_no,c.cur_name,c.limit_mem,c.cur_content,c.cur_lecturer,c.cur_textbook,c.aca_no,a.aca_name FROM(
		SELECT row_number() over(order by cur_no desc) as rnum,cur_no,cur_name,limit_mem,cur_content,cur_lecturer,cur_textbook,aca_no
		FROM curriculum
		) c,academy a where c.aca_no=a.aca_no and a.aca_no='1' and rnum  between '1' and '4'
		order by c.cur_no desc
		
delete from curriculum where cur_no='2';

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
		

/*학원후기 게시판 테이블 및 시퀀스*/
create table aca_review_post(
	aca_rev_no number primary key,
	cur_no number not null,
	aca_rev_title varchar2(100) not null,
	aca_rev_content varchar2(100) not null,
	aca_rev_regdate date not null,
	aca_rev_hits number default 0,
	usr_id varchar2(100) not null,
	constraint aca_review_post_ffk foreign key(cur_no) references curriculum(cur_no) on delete cascade,
	constraint aca_review_post_sfk foreign key(usr_id) references users(usr_id) on delete cascade
)

	select * from aca_review_post
	
select * from( 
    select * from aca_review_post
    order by DBMS_RANDOM.RANDOM 
) where rownum < 6 and cur_no=11;


alter table aca_review_post modify(aca_rev_hits number default 0)
insert into aca_review_post(aca_rev_no,cur_no,aca_rev_title,aca_rev_content,aca_rev_regdate,usr_id) 
values(aca_review_post_seq.nextval,8,'코스타좋아요','코스타개조음',sysdate,'java1')

alter table aca_review_post drop column aca_rev_content
alter table aca_review_post add(aca_rev_content clob)


insert into aca_review_post(aca_rev_no,cur_no,aca_rev_title,aca_rev_content,aca_rev_regdate,usr_id) 
values(aca_review_post_seq.nextval,11,'코스타좋아요1','코스타개조음',sysdate,'java1')
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
create sequence aca_review_post_seq start with 1 nocache

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
/*해쉬태그 테이블*/
create table hashtag(
	hashtag_no number primary key,
	aca_rev_no number not null,
	hashtag_name varchar2(100) not null,
	constraint hashtag_fk foreign key(aca_rev_no) references aca_review_post(aca_rev_no) on delete cascade
)
drop table hashtag
create sequence hashtag_seq start with 1 nocache

/*학원후기 파일첨부 및 시퀀스*/
drop table aca_rev_attach_file
create table aca_review_attach_file(
	aca_rev_att_no number primary key,
	aca_rev_no number not null,
	aca_rev_filepath varchar2(100) not null,
	constraint aca_review_attach_file_fk foreign key(aca_rev_no) references aca_review_post(aca_rev_no) on delete cascade
)
drop sequence aca_rev_attach_file_seq
create sequence aca_review_attach_file_seq start with 1 nocache

/*학원후기 댓글 테이블 및 시퀀스*/
drop table aca_rev_reply
create table aca_review_reply(
	aca_rev_rep_no number primary key,
	review_rep_regdate date not null,
	review_rep_content clob not null,
	aca_rev_no number not null,
	usr_id varchar2(100) not null,
	constraint aca_review_reply_ffk foreign key(aca_rev_no) references aca_review_post(aca_rev_no) on delete cascade,
	constraint aca_review_reply_sfk foreign key(usr_id) references users(usr_id) on delete cascade
)
drop sequence aca_rev_reply_seq
create sequence aca_review_reply_seq start with 1 nocache

/*학원후기 파일첨부 및 시퀀스*/
drop table aca_review_reply_attach_file
create table aca_review_reply_attach_file(
	aca_rev_rep_att_no number primary key,
	aca_rev_rep_filepath varchar2(100) not null,
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
<<<<<<< HEAD
		
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
=======

select r.aca_rev_no,r.aca_rev_title,r.aca_rev_content,r.aca_rev_regdate,r.aca_rev_hits,c.cur_no,u.usr_id,
(select usr_name from users where usr_id = r.usr_id) as 

select r.aca_rev_no,r.aca_rev_title,r.aca_rev_content,r.aca_rev_regdate,r.aca_rev_hits,c.cur_no,u.usr_id,
(select usr_name from users where usr_id=r.usr_id) as usr_name from 
(select aca_rev_no,aca_rev_title,aca_rev_content,to_char(aca_rev_regdate,'YYYY-MM-DD') as aca_rev_regdate,aca_rev_hits,cur_no,usr_id,
row_number() over(order by aca_rev_no desc) as rnum from aca_review_post) r , users u , curriculum c 
where r.usr_id = u.usr_id and rnum between 1 and 5
order by r.aca_rev_no desc		


select p.aca_promo_no,p.aca_promo_title,p.aca_promo_regdate,p.aca_promo_hits,u.usr_id,
(select usr_name from users where usr_id=p.usr_id) as usr_name from
(select aca_promo_no,row_number() over(order by aca_promo_no desc) as rnum,aca_promo_title,to_char(aca_promo_regdate,'YYYY-MM-DD') as aca_promo_regdate,
aca_promo_hits,usr_id from aca_promo_post) p , users u
where p.usr_id = u.usr_id and rnum between 1 and 5
order by p.aca_promo_no desc

select * from curriculum
select cur_no,cur_name from curriculum where aca_no = 3


select r.aca_rev_no,r.aca_rev_title,r.aca_rev_content,r.aca_rev_regdate,r.aca_rev_hits,u.usr_id,
		(select usr_name from users where usr_id=r.usr_id) as usr_name from aca_review_post r,users u
		where r.usr_id = u.usr_id and 
		r.aca_rev_no = 5
		
select r.aca_rev_no,r.aca_rev_title,r.aca_rev_content,r.aca_rev_regdate,r.aca_rev_hits,u.usr_id,
		(select usr_name from users where usr_id=r.usr_id) as usr_name from 
		(select aca_rev_no,aca_rev_title,aca_rev_content,to_char(aca_rev_regdate,'YYYY-MM-DD') as aca_rev_regdate,aca_rev_hits,usr_id,
		row_number() over(order by aca_rev_no desc) as rnum from aca_review_post) r , users u
		where r.usr_id = u.usr_id and rnum between 1 and 5
		order by r.aca_rev_no desc
		
select * from academy
select * from curriculum where aca_no = '5';
select cur_no,cur_name from curriculum where aca_no = '3';

select * from aca_review_post

select * from hashtag where aca_rev_no = 14
select r.aca_rev_no,r.aca_rev_title,r.aca_rev_content,r.aca_rev_regdate,r.aca_rev_hits,u.usr_id,
		(select usr_name from users where usr_id=r.usr_id) as usr_name,r.cur_no,(select cur_name from curriculum where cur_no = r.cur_no) as cur_name
		from aca_review_post r,users u
		where r.usr_id = u.usr_id and 
		r.aca_rev_no = '11'
		
select * from ACA_CUR_SATISFACTION
select * from hashtag
select hashtag_name from hashtag where aca_rev_no = '14'



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
>>>>>>> branch 'master' of https://github.com/MinseongJJang/Kosta_FinalProject_Team2.git
