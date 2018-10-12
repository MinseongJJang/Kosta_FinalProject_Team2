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

insert into users(usr_id, usr_pass, usr_name, usr_addr, nickname, birthday, usr_regdate, usr_email, usr_tel) 
values('java', '1', 'name', 'gg', 'nick', 'birth', '2018-10-12', 'email', 'tel')

insert into 

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
create table notice(
	notice_no number primary key,
	notice_title varchar2(100) not null,
	notice_content clob not null,
	notice_regdate date not null,
	usr_id varchar2(100) not null,
	constraint notice_fk foreign key(usr_id) references users(usr_id) on delete cascade
)
create sequence notice_seq start with 1 nocache

/* 공지사항파일첨부 및 시퀀스*/
create table notice_attach_file(
	notice_att_no number primary key,
	notice_filepath varchar2(100) not null,
	notice_no number not null,
	constraint notice_attach_file_fk foreign key(notice_no) references notice(notice_no) on delete cascade
)
create sequence notice_attach_file_seq start with 1 nocache

/*권한 테이블*/
create table authorities(
	authority varchar2(100) not null,
	usr_id varchar2(100) not null,
	constraint authorities_fk foreign key(usr_id) references users(usr_id) on delete cascade,
	constraint authorities_pk primary key(usr_id)
)
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

insert into faq(faq_no,faq_title,faq_content,faq_regdate,usr_id)
values(faq_seq.nextval,'제목','내용',sysdate,'java')
insert into faq(faq_no,faq_title,faq_content,faq_regdate,usr_id)
values(faq_seq.nextval,'제목2','내용2',sysdate,'java')
insert into faq(faq_no,faq_title,faq_content,faq_regdate,usr_id)
values(faq_seq.nextval,'제목3','내용3',sysdate,'java')
insert into faq(faq_no,faq_title,faq_content,faq_regdate,usr_id)
values(faq_seq.nextval,'제목4','내용4',sysdate,'java')
insert into faq(faq_no,faq_title,faq_content,faq_regdate,usr_id)
values(faq_seq.nextval,'제목5','내용5',sysdate,'java')
insert into faq(faq_no,faq_title,faq_content,faq_regdate,usr_id)
values(faq_seq.nextval,'제목6','내용6',sysdate,'java')
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
create sequence academy_seq start with 1 nocache

/*학원 Q&A 및 시퀀스*/
create table aca_qna(
	qna_no number primary key,
	qna_title varchar2(100) not null,
	qna_content clob not null,
	qna_regdate date not null,
	aca_no number not null,
	usr_id varchar2(100) not null,
	constraint aca_qna_ffk foreign key(aca_no) references academy(aca_no) on delete cascade,
	constraint aca_qna_sfk foreign key(usr_id) references users(usr_id) on delete cascade
)
create sequence aca_qna_seq start with 1 nocache

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
create sequence curriculum_seq start with 1 nocache

/*학원후기 게시판 테이블 및 시퀀스*/
create table aca_review_post(
	aca_rev_no number primary key,
	cur_no number not null,
	aca_rev_title varchar2(100) not null,
	aca_rev_content varchar2(100) not null,
	aca_rev_regdate date not null,
	aca_rev_hits number not null,
	usr_id varchar2(100) not null,
	constraint aca_review_post_ffk foreign key(cur_no) references curriculum(cur_no) on delete cascade,
	constraint aca_review_post_sfk foreign key(usr_id) references users(usr_id) on delete cascade
)
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
	aca_rev_no number not null,
	hashtag_name varchar2(100) not null,
	constraint hashtag_fk foreign key(aca_rev_no) references aca_review_post(aca_rev_no) on delete cascade,
	constraint hashtag_pk primary key(aca_rev_no,hashtag_name)
)

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

