
--=====================================
-- 테이블 생성
--=====================================
 -- 회원(member) 테이블 생성
 create table member(
    id varchar2(30),
    name varchar2(15) not null,
    pwd varchar2(30) not null,
    birth_date date not null,
    enroll_date date default sysdate not null,
    del_date date null,
    
    constraint pk_member_id primary key(id)
 );
 
 -- 권한(authentication)  테이블 생성
 create table authentication(
    authority char(2),
    id varchar2(30),
    
    constraint pk_authentication_authority primary key(authority),
    constraint fk_authentication_id foreign key(id) references member(id)
 );
    
-- Board 테이블 생성    
CREATE TABLE  board (
	 board_code 	varchar2(20)	NOT NULL,
	 id 	varchar2(30)	NOT NULL,
	 board_type 	char(1)	NOT NULL,
	 board_name 	varchar2(30)	NULL,
	 pagebar_count 	number	NULL,
	 post_count 	number	 default 10 NULL,
	 comment_yn 	char(1)	 default 'Y' NULL,	
	 attach_yn 	char(1) default 'N'	NULL,	
	 file_count 	number	NULL,
     
     constraint pk_board_board_code primary key(board_code),
     constraint fk_board_id foreign key(id) references member(id),
     constraint ch_board_comment_yn check(comment_yn in('Y','N')),
     constraint ch_board_attach_yn check(attach_yn in('Y','N')),
     constraint ch_board_board_type check(board_type in('F','L'))
);




--=====================================================

select
    id
from
    member
where
    id='xodud';

select * from board;

insert into board
values(
    'travel',
    'xodud',
    'L',
    '여행',
    5,
    10,
    'Y',
    'N',
    0
);
