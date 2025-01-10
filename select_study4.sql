# row_number(), rank()에서의 partition by
/* 연산순서 :: 테이블 생성(from) - where - group - having - select - order - limit */

select /*order로 정렬된거 안에서 다시 partition으로 정렬 후 기준의 갯수만큼 순번을 매김*/
	row_number() over(partition by category_id order by author_id),
    book_tb.*
from
	book_tb
where
	book_name like '%가%';
    
    
    
#흐름제어
# CASE, IF, IFNULL, NULLIF
select
	case
		when 5 > 5 then '5보다 큽니다'
        when 5 > 4 then '4보다 큽니다'
        when 5 > 3 then '3보다 큽니다'
        else '5보다 작습니다'
	end;
    /*when으로 참거짓 판별 후 then else에서 값 출력.
	  조건이 여러개일경우 권장*/
      
select
    if(10 > 5, '5보다 큽니다', '5보다 작습니다');
    /*if(판별식, 참값, 거짓값)
      조건이 하나일 경우 권장, 삼항연산자처럼 사용*/
      
select
	*,
    if(trim(isbn) = '', 'O', 'X') as OandX, /*trim은 문자열 맨앞뒤의 띄어쓰기 등의 공백을 제거함, 제거할 문자를 설정할 수 있다*/
	case
		when category_id < 100 then '0 ~ 99'
		when category_id < 200 then '100 ~ 199'
		when category_id < 300 then '200 ~ 299'
        else '300 ~'
	end as csope
from
	book_tb;
    



update
	book_tb
set
	category_id = null
where
	category_id between 40 and 49;
    
    
select
	*,
    ifnull(category_id, 40) as ifnull, /*null인것에 값을 대입한다*/
    nullif(category_id, 37) as nullif /*동일한 값을 null로 만든다*/
from
	book_tb;
    

update
	book_tb
set
    category_id = case when category_id % 3 = 0 then 3000 /*뒤에께 덮어씌워지지 않고 앞에꺼 우선 적용*/
					   when category_id % 2 = 0 then 2000
				  end; /*else에 적은 값이 없기에 나머지 값들은 null로 전환*/


#is
/*null을 다룰때는 =보다는 is를 권장*/
select
	*
from
	book_tb
where
	category_id is not null;
    

update
	book_tb
set
	category_id = 4000  #=ifnull(category_id, 4000);
where
	category_id is null;


select
	*
from
	book_tb;
    



#view 테이블
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
    


# with 공통 데이블 표현식 (common table expression, cte)
/*람다식처럼 1회성으로 사용하는 서브커리 제공*/
set @searchData = '불'; /*변수 생성 set @변수명 = 값;*/
/*set을 실행해줘야 적용이됨*/

with publisher_count_cte as (
	select
		publisher_id,
        count(publisher_id) as publisher_count 
	from
		book_tb
	group by
		publisher_id
),
author_count_cte as (
	select
		author_id,
        count(author_id) as author_count 
	from
		book_tb
	group by
		author_id
)

select
	*
from
	book_tb bt
    left outer join	publisher_count_cte pcc on(pcc.publisher_id = bt.publisher_id)
    left outer join author_count_cte acc on(acc.author_id = bt.author_id)
where
	bt.book_name like concat('%', @searchData, '%');
    /*concat함수 전달받은 문자열을 모두 결합한다*/
    
    

select
 lpad('123', 5, 0);
 
select
	day(now()),
    month('2025-01-10'),
    day(now()),
    hour(now()),
    minute(now()),
    second(now());

select
	date_format(now(), '%Y년 %m월 %d일');


delete /*delete는 조건이 필요하다. 아니면 전체삭제되므로 주의*/
from
	book_tb
where
	book_id = 1;
