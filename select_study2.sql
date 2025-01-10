/* 한줄주석은 :: #, --띄어쓰기
   여러줄 주석은 /별별/  */
   
#select
select /*select 행조회, where 열조회 형태의 2차원 배열이다*/
	*
from
	student_tb; /*select의 결과 또한 테이블이다*/





# where조건
select
	*
from
	student_tb
where
	student_year >= 3 or student_year <= 4;
    #student_year in (3, 4);      3이나 4를 포함하고 있는지
    #student_year between 3 and 4;    3에서 4사이
    
    


    
#union
/*유니온을 통해 두개의 행을 이을 수 있다. 단, 컬럼의 갯수가 같아야한다
  union은 중복을 제거하고, union all은 중복제거없이 그대로 이어붙인다*/
select 
	10 as num1,
    20 as num2,
    '이름' as name
--  ,40 as num
union all
select
	10 as num,
    20 as num2,
    '이름' as name;


/*데이터타입도 같아야하지만 문자열로 숫자를 나타낼 수 있으므로 크게 상관없다*/
select
	1 as id,
    '월' as day
union all
select
	2 as id,
    '화' as day
union all
select
	3 as id,
    '수' as day;

select
	student_name
from
	student_tb
union
select
	instructor_name
from
	instructor_tb;




#order by
/*order by는 정렬을 의미한다*/
select
	*
from
	student_tb
order by 
	student_name; /*오름차순은 asc이고 생략가능하다*/
    #student_name desc; /*desc를 기입하면 내림차순 정렬이된다*/

select
	*
from
	student_tb
order by
	student_year desc,
	student_name; /*학년 정렬 후 그 안에서 이름 정렬*/





#순번 매기기
#row_number
select
	row_number() over(order by student_name) as num, 
	student_name
from
	student_tb;



select
	row_number() over(order by `name`) as `index`, /*인덱스는 키워드라서 문자로 쓸거면 '' 또는 ``로 입력해줘야한다*/
    name
from
	(select
		student_name as `name` /*union의 이름은 최상단의 테이블에 따른다*/
	from
		student_tb
	union
	select
		instructor_name
	from
		instructor_tb) as name_tb; /*시스템 내부에서 데이터 참조를 위해 이름을 붙여줘야한다*/
	/* union된 결과 값은 실제 테이블이 아니므로 이를 참조할려면 반드시 이름을 지정해야된다.
       따라서 select에 직접 사용할 수가 없고, from에 사용하되 반드시 명칭을 붙여줘야한다.
       이외에도 서브커리에서 처리된 처리된 값을 외부에서 사용하기 위해서는 명칭을 붙여줘야한다*/



-- 과목명 학과명 합쳐서 내림차순으로 번호매기기, course_tb, major_tb
select
	row_number() over(order by `id` desc) as num,
    name_tb.*
from
	(select
		course_id as `id`,
		course_name as `name`
    from
		course_tb
	union
    select
		major_id,
		major_name
	from
		major_tb) as name_tb;
        
   
   

#rank
/*rank 중복된 석차 후 건너뜀(11335)
  dense_rank 중복된 석차 후 이어붙임(112345)*/
select
	dense_rank() over(order by `id`) as num,
    name_tb.*
from
	(select
		course_id as `id`,
		course_name as `name`
    from
		course_tb
	union
    select
		major_id,
		major_name
	from
		major_tb) as name_tb;





#where 와일드 카드(like)
select
	*
 from
	instructor_tb
where
	instructor_name like '%교%';
	/* %은 아무거나 붙여도 상관없다는 뜻으로. %교는 ~교, 교%는 교~, %교%는 ~교~를 의미한다.
       _는 아무 글자 하나가 온다는 뜻으로, _교는 ㅇ교, 교_는 교ㅇ, _교_는 ㅇ교ㅇ을 의미한다.*/
    
        



    
    