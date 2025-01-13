### view ###
/* 가상의 테이블을 제작 */
create view book_view as(
	select
		bt.book_id,
		bt.book_name,
		bt.isbn,
		bt.author_id,
		`at`.author_id as at_author_id,
		`at`.author_name,
		bt.publisher_id,
		pt.publisher_id as pt_publisher_id,
		pt.publisher_name,
		bt.category_id,
		ct.category_id as ct_category_id,
		ct.category_name,
		bt.book_img_url
	from	
		book_tb bt
		left outer join author_tb `at` on `at`.author_id = bt.author_id
		left outer join category_tb ct on ct.category_id = bt.category_id
		left outer join publisher_tb pt on pt.publisher_id = bt.publisher_id
);

select
	*
from
	book_view;








### 트리거 ###
/*a테이블이 b테이블에 종속된다. b의 111데이터가 없다면 a의 aaa와 bbb는 무의미하다.*/
/*트리거란 특정동작이 일어났을때 연쇠적으로 일어나는 동작을 말한다.*/
/*테이블 설정에서 트리거 탭에서 조정한다.*/

insert into data_b_tb
values
	(default, '111'),
    (default, '222'),
    (default, '333');

insert into data_a_tb
values
	(default, 'aaa', 1),
	(default, 'bbb', 1),
	(default, 'ccc', 2),
	(default, 'ddd', 3),
	(default, 'eee', 3);
    

/*트리거 설정으로 인해 b테이블에서 데이터삭제 시 a테이블에서도 테이터삭제가 일어난다.*/    
select
	*
from
	data_b_tb b
    left outer join data_a_tb a on(a.data_b_id = b.data_b_id);

delete
from
	data_b_tb
where
	data_b_value = '111';
    



/*트리거 설정으로 b테이블에서 데이터 생성 시 c테이블에서도 데이터생성이 일어난다.*/
insert into data_b_tb
value
	(default, '555');
    
select
	*
from
	data_c_tb;
    


/*b테이블의 데이터가 삭제되면 d데이블에 백업*/
delete
from
	data_b_tb
where
	data_b_value = '333';

select
	*
from
	data_d_tb;
    
    
    







### transaction ###
/*db의 상태를 변경시키는 작업단위를 말한다.*/

/*commit이란 임시저장데이터를 영구저장하는것*/
select @@autocommit;
set autocommit = 0; 
/*자동 영구저장 해제, commit을 선언하기 전까지는 영구저장되지 않느다*/


insert into data_b_tb
values(default, '777'); /*껏다키면 저장 안되있음*/

select * from data_b_tb;


/*start transaction으로 시작하여 commit(저장), rollback(취소)로 끝난다*/
start transaction;

insert into data_b_tb
values
	(default, '4040');

update
	data_b_tb
set
	data_b_value = '999'
where
	data_b_value = '777';


delete
from
	data_b_tb
where
	data_b_value = '4040';

rollback;

savepoint aa;
rollback to aa; /*세이브포인트 지점까지만 롤백*/

commit;










### SP, 프로시저, stored procedures ###
/*쿼리를 마치 하나의 함수처럼 실행하기위한 집합*/
/*procedure - 우클릭 생성*/
/*p_ :parameter, 입력변수,매개변수 / v_:variable, 내부변수 / r_: return, 출력값 */

/*프로시저 작성 시 항상 예외처리해주기*/


call sp_insert_book('aaa','1234','가오광','테스트출판사','테스트카테고리', 'http://');


call sp_insert_course_regisering_information('정보처리', '김준일', '월', '2025-01-16', '2025-04-26', '개발자과');


call sp_loop_insert_data_b(10);









### functions ###
select @@log_bin_trust_function_creators; /*데이터베이스에서 함수처리하는 객체*/
set global log_bin_trust_function_creators = 1; /*true로 변경*/


select study.add(10, 20);


select
	*
from
	course_registering_information_tb
where
	instructor_id = study.find_instructor_id_by_name('김준일');/*서브커리를 함수화*/
    
    
    
    