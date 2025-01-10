
#정규화
-- 카테고리 정규화
insert into category_tb /*insert select로 필터링된 값 삽입가능*/
select
	distinct /*distinct 중복제거*/
    0, /*0을 넣으면 자동으로 auto increment가 된다*/
	카테고리
from
	books;


-- author(저자), pulisher(출판사) 정규화하기
insert into author_tb
select
	distinct
	0,
	저자명
from
	books;
    
insert into publisher_tb
select
	distinct
	0,
	출판사
from
	books;
    


select
	도서명,
    저자명,
    isbn,
    표지url
from
	books
group by /*중복 뭉쳐서 검색*/
	도서명,
    저자명,
    isbn,
    표지url;








#join
-- a와 b의 곱으로 테이블 생성
select
	*
from
	books
    left outer join category_tb on category_name = 카테고리;
    /*books의 카테고리와 같은 값의 카테고리 테이블의 카테코리 네임을 왼쪽가장자리로 books에 붙인다*/
    

select
	*
from
	books b /*book as b 테이블명 뒤의 알리어스는 생략 가능하다*/
    left outer join category_tb ct on ct.category_name = b.카테고리 /*출저는 항상 적는것을 권장*/
    left outer join author_tb `at` on `at`.author_name = b.저자명
    left outer join publisher_tb pt on pt.publisher_name = b.출판사;
    

update
	books b
    left outer join category_tb ct on ct.category_name = b.카테고리
    left outer join author_tb `at` on `at`.author_name = b.저자명
    left outer join publisher_tb pt on pt.publisher_name = b.출판사
set
	카테고리 = ct.category_id,
    저자명 = `at`.author_id,
    출판사 = pt.publisher_id;





insert into data2_tb
values
	(default, '111'),
	(default, '222'),
	(default, '333'),
	(default, '444'),
	(default, '555');

select
	*
from
	data2_tb;
    


insert into data1_tb
values
	(default, 'aaa', 1),
	(default, 'bbb', 1),
	(default, 'ccc', 2),
	(default, 'ddd', 3),
	(default, 'eee', 4),
	(default, 'fff', 5),
	(default, 'ggg', 5);


insert into data1_tb
values
	(default, 'hhh', 6),
	(default, 'iii', 7);



/*키값으로 조인하는것을 권장*/
select
	*
from
	data1_tb
    left outer join data2_tb on data2_tb.data2_id = data1_tb.data2_id; 
    /* inner join은 조건이 맞는 항목만 출력
       left outer join은 왼쪽 항목은 전부 출력 후 붙이기*/
    


/*데이터베이스 업데이스,수정,삭제 시 항상 백업해두기. 백업한거 건드릴때는 수정부분만 건드리기*/
update
	data1_tb
set
	data2_id = 10
where
	data1_id in(5, 7);
    
    
    
    
    



#group by
/*집계에 주로 사용된다. 중복된 값을 하나로 뭉친다*/

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
where
	bt.category_id between 10 and 100;
	




   
select
    bt.publisher_id,
    pt.publisher_name,
    count(bt.publisher_id) as book_count
    #sum(bt.book_id) as book_count
    #min(bt.book_id) as book_count
from
	book_tb bt
    left outer join publisher_tb pt on pt.publisher_id = bt.publisher_id
group by
	bt.publisher_id,
    pt.publisher_name;


select
    bt.publisher_id,
    pt.publisher_name,
    count(bt.book_id) as book_count
from
	book_tb bt
    left outer join publisher_tb pt on pt.publisher_id = bt.publisher_id
group by
	bt.publisher_id,
    pt.publisher_name
having  /*where은 group 이전에, having은 group 이후에 조건을 건다*/
	book_count > 10
order by
	bt.publisher_id
limit 0, 10;
/*limit 시작인덱스, 갯수*/


/* 연산순서 :: 테이블 생성(from) - where - group - having - select - order - limit */
/* 알리아스as는 코드의 구성일뿐여서 컴파일로 처리되는거지, 연산 순서와 상관없다. */




select
	book_id,
    book_name,
    isbn,
    author_id,
    publisher_id,
    category_id,
    book_img_url
from
	(select
		row_number() over(partition by category_id order by book_id) as num,
        bt.*
	from
		book_tb bt) books
where
	num < 6