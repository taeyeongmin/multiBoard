
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
    
    constraint pk_authentication_authority primary key(authority,id),
    constraint fk_authentication_id foreign key(id) references member(id)
 );
    

-- Board 테이블 생성    
CREATE TABLE  board (
	 board_code 	varchar2(20)	not NULL,
	 id 	varchar2(30)	not null,
     board_name 	varchar2(30)	not null unique,
	 board_type 	char(1)	 default 'l'not null,
     board_yn char(1) default 'y' not null,
     attach_yn 	char(1) default 'n'	null,	
     attach_count 	number default 3 null,
	 pagebar_count 	number default 5 not null,
	 post_count 	number	 default 10 null,
	 comment_yn 	char(1)	 default 'y' null,	
	
     
     constraint pk_board_board_code primary key(board_code),
     constraint fk_board_id foreign key(id) references member(id),
     constraint ch_board_board_yn check(board_yn in('Y','N')),
     constraint ch_board_comment_yn check(comment_yn in('Y','N')),
     constraint ch_board_attach_yn check(attach_yn in('Y','N')),
     constraint ch_board_board_type check(board_type in('F','L'))
);

-- board seq 생성
create sequence seq_board_code;



--=====================================================

select * from member;

select * from board;


select
    m.id
    ,name
    ,birth_date
    ,enroll_date
    ,del_date
    ,authority
from 
    member m left join
    authentication a on m.id = a.id
where
    m.id='sAdmin'





select * from board;



--==========================================
-- 슈퍼 관리자 데이터 추가
--==========================================

insert into authentication values('sd','sAdmin');
insert into authentication values('ad','sAdmin');


