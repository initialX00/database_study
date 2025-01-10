insert into instructor_tb (instructor_id, instructor_name) 
values 
	(default, '김교수'), /*복사 단축키 ctrl + d*/
    (default, '박교수'),
    (default, '이교수');

/*실행 단축키 ctrl + enter*/    
/*커서를 놔둔 insert만 실행된다*/
    
insert into course_tb /*자료형 순서 맞게 적는다면 컬럼명은 생략가능하다*/
values
	(default, '데이트베이스론'), /*default의 값은 auto increment 덕에 pk의 넘버는 순번대로 자동으로 설정된다*/
	(default, '알고리즘'), /*잘 못 입력하여 특정 순서가 오류가 날 경우 auto crement는 해당 오류번호를 건너뛰고 입력한다*/
	(default, '운영체재'), /*수정하고 싶을땐 truncate table로 초기화하거나 해당 테이블 옵션에서 increment 순번을 정할 수 있다*/
	(default, '자료구조');


insert into course_registering_information_tb
values
	(default, 1, 2, '월', '2025-01-07', '2025-06-06', 2),
	(default, 1, 2, '목', '2025-01-07', '2025-06-06', 2),
	(default, 1, 3, '화', '2025-01-07', '2025-06-06', 2),
	(default, 1, 3, '수', '2025-01-07', '2025-06-06', 2),
	(default, 2, 1, '월', '2025-03-07', '2025-08-06', 1),
	(default, 2, 1, '수', '2025-03-07', '2025-08-06', 1),
	(default, 3, 1, '화', '2025-02-07', '2025-07-06', 1),
	(default, 3, 1, '금', '2025-02-07', '2025-07-06', 1),
	(default, 4, 3, '수', '2025-03-07', '2025-08-06', 2),
	(default, 4, 3, '금', '2025-03-07', '2025-08-06', 2);
    
    
insert into major_tb
values
	(default, '컴퓨터공학과'),
    (default, '소프트웨어공학과');
    
    


insert into student_tb
value
	(default, '최석현', 3, '남', '1'),
	(default, '백진우', 4, '남', '1'),
	(default, '박소율', 3, '여', '2'),
	(default, '정현영', 4, '여', '1');
    
    
insert into course_registering_tb
values 
	(default, 1, 1),
	(default, 1, 2),
	(default, 1, 3),
	(default, 1, 4),
	(default, 2, 2),
	(default, 2, 4),
	(default, 3, 1),
	(default, 3, 3),
	(default, 4, 1),
	(default, 4, 2),
	(default, 4, 3),
	(default, 5, 1),
	(default, 5, 2),
	(default, 6, 1),
	(default, 6, 2),
	(default, 6, 3);
    