/*회원 테이블*/
drop table users;
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
	usr_tel varchar2(100 )not null
)
/*건의 게시물 테이블 및 시퀀스*/
drop table suggestion_post;
create table suggestion_post(
	sug_no number primary key,
	usr_id varchar2(100) not null,
	sug_title varchar2(100) not null,
	sug_content clob not null,
	sug_regdate date not null,
	constraint suggestion_post_fk foreign key(usr_id) references users(usr_id) on delete cascade
)
drop sequence suggestion_post_seq;
create sequence suggestion_post_seq start with 1 nocache

/*권한 테이블*/
drop table authorities;
create table authorities(
	authority varchar2(100) not null,
	usr_id varchar2(100) not null,
	constraint authorities_fk foreign key(usr_id) references users(usr_id) on delete cascade,
	constraint authorites_pk primary key(authority,usr_id)
)

/*학원 관계자 테이블 및 시퀀스*/
drop table academy;
create table academy(
	aca_no number primary key,
	aca_name varchar2(100) not null,
	aca_addr varchar2(100) not null,
	aca_tel varchar2(100) not null,
	usr_id varchar2(100) not null,
	constraint academy_fk foreign key(usr_id) references users(usr_id) on delete cascade
)

drop sequence academy_seq;
create sequence academy_seq start with 1 nocache

/*학원 관계자 테이블*/
drop table aca_users;
create table aca_users(
	usr_id varchar2(100) not null,
	busi_reg_num varchar2(100) not null,
	aca_name varchar2(100) not null,
	constraint aca_users_fk foreign key(usr_id) references users(usr_id) on delete cascade,
	constraint aca_users_pk primary key(usr_id)
)

/*학원 후기 게시물 테이블 및 시퀀스*/
drop table aca_promo_post;
create table aca_promo_post(
	aca_promo_no number primary key,
	usr_id varchar2(100) not null,
	aca_promo_title varchar2(100) not null,
	aca_promo_content clob not null,
	aca_promo_regdate date not null,
	aca_promo_hits number not null,
	constraint aca_promo_post_fk foreign key(usr_id) references aca_users on delete cascade
)

drop sequence aca_promo_post_seq;
create sequence aca_promo_post_seq start with 1 nocache

/*학원 후기 게시물 첨부 테이블 및 시퀀스*/
drop table aca_promo_attach_file;
create table aca_promo_attach_file(
	promo_attach_no number primary key,
	aca_promo_no number not null,
	aca_promo_filepath varchar2(100) not null,
	constraint aca_promo_attach_file_fk foreign key(aca_promo_no) references aca_promo_post(aca_promo_no) on delete cascade
)

drop sequence promo_attach_seq;
create sequence promo_attach_seq start with 1 nocache

/*교육과정 테이블 및 시퀀스*/
drop table curriculum;
create table curriculum(
	cur_no number primary key,
	aca_no number not null,
	cur_name varchar2(100) not null,
	lecturer varchar2(100) not null,
	start_date date not null,
	end_date date not null,
	limit_mem number not null,
	price number not null,
	constraint curriculum_fk foreign key(aca_no) references academy(aca_no) on delete cascade
)
drop sequence cuuriculum_seq;
create sequence curriculum_seq start with 1 nocache

/*교육과정 첨부 테이블 및 시퀀스*/
create table cur_attach_file(
	cur_attach_no number primary key,
	cur_no number not null,
	cur_filepath varchar2(100) not null,
	constraint cur_attach_file_fk foreign key(cur_no) references curriculum(cur_no) on delete cascade
)
drop sequence cur_attach_no_seq;
create sequence cur_attach_no_seq start with 1 nocache

/*학원 후기 게시물 테이블 및 시퀀스*/
drop table aca_review_post;
create table aca_review_post(
	aca_rev_no number primary key,
	cur_no number not null,
	aca_rev_title varchar2(100) not null,
	aca_rev_content clob not null,
	aca_rev_regdate date not null,
	aca_rev_hits number not null,
	usr_id varchar2(100) not null,
	constraint aca_review_post_ffk foreign key(cur_no) references curriculum(cur_no) on delete cascade,
	constraint aca_review__post_sfk foreign key(usr_id) references users(usr_id) on delete cascade
)
drop sequence aca_rev_no_seq;
create sequence aca_rev_no_seq start with 1 nocache

/*학원 후기 게시물 첨부 테이블 및 시퀀스*/
create table aca_rev_attach_file(
	aca_rev_attach_no number primary key,
	aca_rev_no number not null,
	aca_rev_filepath varchar2(100) not null,
	constraint aca_rev_attach_file_fk foreign key(aca_rev_no) references aca_review_post(aca_rev_no) on delete cascade
)

drop sequence aca_rev_attach_no_seq;
create sequence aca_rev_attach_no_seq start with 1 nocache

/*만족도 테이블*/
create table aca_cur_satisfaction(
	aca_rev_no number not null,
	cur_satis varchar2(100) not null,
	amenties_satis varchar2(100) not null,
	lecturer_satis varchar2(100) not null,
	emp_links_satis varchar2(100) not null,
	traffic_satis varchar2(100) not null,
	constraint aca_cur_satisfaction_fk foreign key(aca_rev_no) references aca_review_post(aca_rev_no) on delete cascade
)

/*취업 후기 게시물 테이블*/
drop table emp_review_post;
create table emp_review_post(
	emp_rev_no number primary key,
	usr_id varchar2(100) not null,
	emp_rev_title varchar2(100) not null,
	emp_rev_hits number not null,
	emp_rev_content clob not null,
	emp_rev_regdate date not null,
	cur_no number not null,
	constraint emp_review_post_ffk foreign key(usr_id) references users(usr_id) on delete cascade,
	constraint emp_review_post_sfk foreign key(cur_no) references curriculum(cur_no) on delete cascade
)

drop sequence emp_rev_no_seq;
create sequence emp_rev_no_seq start with 1 nocache

/*취업 후기 게시물 첨부 테이블 및 시퀀스*/
create table emp_review_attach_file(
	emp_rev_attach_no number primary key,
	emp_rev_no number not null,
	emp_rev_filepath varchar2(100) not null,
	constraint emp_review_attach_file_fk foreign key(emp_rev_no) references emp_review_post on delete cascade
)

drop sequence emp_rev_attach_no_seq;
create sequence emp_rev_attach_no_seq start with 1 nocache