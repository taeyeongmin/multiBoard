
select
    *
from
    member;
    
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
