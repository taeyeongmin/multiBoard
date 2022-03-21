
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


--Post(게시물) 테이블 생성
create table post (
    post_no number
    ,id varchar2(30)
    ,board_code varchar2(20)
    ,reg_date date default sysdate 
    ,heart_count number default 0 not null
    ,title varchar2(30) not null
    ,content varchar2(2000) not null
    
    ,constraint pk_post_post_no primary key(post_no)
    ,constraint fk_post_id foreign key(id) references member(id)
    ,constraint fk_post_board_code foreign key(board_code) references board(board_code)
    
);

-- post_no seq 생성
create sequence seq_post_post_no;




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


select 
    * 
from
    (select
        row_number() over(order by enroll_date desc) rnum, m.*
    from 
        member m ) m
    where 
        rnum between 1 and 5;


select * from board;



--==========================================
-- 슈퍼 관리자 데이터 추가
--==========================================

insert into authentication values('sd','sAdmin');
insert into authentication values('ad','sAdmin');


