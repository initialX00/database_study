/*조회 키워드 select*/
select /*후실행*/
	course_id,
    instructor_id
from /*선실행*/
	course_registering_information_tb;


select 
	* 
from 
	course_registering_information_tb
where /*조건문 where*/
	day = '월'
    or day = '금';
    

select
	*
from
	course_registering_information_tb
where
	instructor_id = (select /*서브커리는 괄호를 친다*/
						instructor_id
					 from
						instructor_tb
					 where
						instructor_name = '박교수');
/*정규화로 원하는 정보를 접근하기 힘들기때문에
다른 테이블의 값을 들고와서 대입한다.*/





/*서브커리는 출력값 하나만 가능하다*/
select
	course_registering_information_id,
    course_id as courseId, /*알리아스as로 다른이름으로 취급할 수 있다.*/
    instructor_id,
    (select
		instructor_name
	 from 
		instructor_tb 
	 where 
		instructor_tb.instructor_id = course_registering_information_tb.instructor_id) as instructor_name 
        /*=의 앞쪽은 서브커리, 뒤에꺼는 메인커리를 나타내지만 가시성을 위해 파일명을 붙여준다.*/
from
	course_registering_information_tb;
    
    
    

/*course_registering_tb에서 student_tb있는
백진우가 신청한 교과목의 이름을 출력*/
select
	(select
		(select
			course_name
		from
			course_tb as ct
		where
			ct.course_id = crit.course_id)
	from
		course_registering_information_tb as crit
	where
		crit.course_registering_information_id = crt.course_registering_information_id) as course_name
from
	course_registering_tb as crt
where
	student_id = (select
					student_id
				from
					student_tb
				where
					student_name = '백진우');





/*백진우가 신청한 교과목의 이름과 교수를 출력*/
/*입력 실수있으니까 직접 고쳐보기*/
select
	(select
		(select
			course_name
		from
			course_tb
		where
			course_tb.course_id = course_registering_information_tb.course_id)
	from
		course_registering_information_tb
	where
		course_registering_information_tb.course_registering_information_id = course_registering_tb.course_registering_information_id) as course_name,
	(select
		(select
			instructor_name
		from
			instructor_tb
		where
			instructor_tb.instructor_id = course_registering_information_tb.instructor_id)
	from
		course_registering_information_tb
	where
		course_registering_information_tb.course_registering_information_id = course_registering_tb.course_registering_information_id) as instructor_name
from
	course_registering_tb
where
	student_id = (select student_id from student_tb where student_name = '백진우');




/*운영체제를 듣고있는 학생을 뽑으시오*/
/*서브커리값이 복수이므로 불가능한 상황이다.*/

select
	(select
		student_id
	from
		course_registering_tb as crt
	where
		crt.course_registering_information_tb = crit.course_registering_information_id)
from
	course_registering_information_tb as crit
where
	course_id =
	(select
		course_id
	from
		course_tb
	where
		course_name = '운영체제');





    
    