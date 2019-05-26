create sequence seq_board increment by 1 start with 1;

create table tbl_board (
    bno number(10,0),
    title varchar2(200) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate,
    viewcnt int default 0
);

alter table tbl_board add constraint pk_board
primary key (bno);


insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '테스트 제목', '테스트 내용', 'user00');

commit;

select * from tbl_board where bno > 0 order by bno;

delete from tbl_board where bno = 5;


drop table tbl_board;

drop sequence seq_board;
