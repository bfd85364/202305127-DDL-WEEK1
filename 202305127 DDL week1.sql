-- =========== 사원정보 관련 테이블들기반 쿼리문 작성 ===========

-- HR(인사관리) 데이터베이스 스키마 기반 테이블간 관계 파악
-- 지역–국가–위치–부서–직원–직무–이력 관계의 계층 구조
-- region-countries-locations-departments-employees-jobs-job_history

select * from employees;
select * from jobs;
select * from departments


-- 샘플 문제) 사원 정보(Employees) 테이블에서 사원번호, 이름, 급여, 업무, 입사일, 상사의 사원번호를 출력하시오. 
-- 이때 이름은 성과 이름을 연결하여 Name이라는 별칭으로 출력하시오 (107행).

SELECT employee_id, concat(last_name, " ", first_name) AS NAME, salary, hire_date, manager_id FROM employees;

    
-- 문제 1) 
-- 사원 정보(Employees) 테이블에서 사원의 성과 이름은 Name, 업무는 Job, 급여는 Salary (여기서 급여는 월급여), 
-- 연봉에 $100 보너스를 추가하여 계산한 값은 Increased Ann_Salary, 급여에 $100
-- 보너스를 추가하여 계산한 연봉은 “Increased Salary”라는 별칭으로 출력하시오(107행).
SELECT employee_id, concat(last_name, " ", first_name) AS NAME, 
(salary*12) + 100 as Increased_Ann_Salary, (salary + 100)*12 AS Increased_Salary from employees;

-- 문제 2)
-- 사원 정보(Employees) 테이블에서 모든 사원의 이름(last_name)과 연봉을 “이름: 1 Year
-- Salary = $연봉” 형식으로 출력하고, 1 Year Salary라는 별칭을 붙여 출력하시오(107행).
SELECT concat(last_name, ": 1year Salary= ", salary*12) AS "1year salary" FROM Employees;

-- 문제 3-1
-- 부서별로 담당하는 업무를 한 번씩만 출력하시오(부서-업무 조합을 중복 없이 출력, 부서이름과 업무이름을 조회할 필요는 없음)(20행).

SELECT DISTINCT department_id, job_id from employees;

-- 문제 3-2 
-- 부서이름과 업무이름으로 동일 내용 출력하시오.

#(19)행 
SELECT DISTINCT DEP.department_name, JB.job_title 
FROM departments DEP JOIN employees EMP 
ON DEP.department_id = EMP.department_id
JOIN jobs JB ON JB.job_id = EMP.job_id;

SELECT * FROM employees WHERE department_id IS NULL;
-- 문제 3-3 
-- 모든 부서에 대해서 부서이름과과 업무이름을 보고 싶습니다. 쿼리를 작성하세요. (직원이 없는 부서도 출력하고자 하는 상황) == NULL도 포함시키겠다 
SELECT DEP.department_name, JOB.job_title 
FROM departments DEP LEFT JOIN employees EMP 
ON DEP.department_id = EMP.department_id
LEFT JOIN jobs JOB ON JOB.job_id = EMP.job_id;

-- 문제 4
-- HR 부서에서 예산 편성 문제로 급여 정보 보고서를 작성하려고 한다. 사원 정보
-- (Employees) 테이블에서 급여가 $7,000 ~$10,000 범위 이외인 사람의 성과 이름(Name
-- 으로 별칭) 및 급여를 급여가 작은 순서로 출력하시오(75행).

SELECT * FROM EMPLOYEES;
SELECT * FROM JOB_HISTORY;

SELECT concat(last_name, " ", first_name, "의 급여: ") AS name, salary
FROM employees
WHERE salary<7000 or salary>1000;  



-- 문제 5
-- 사원의 성(last_name) 중에 ‘e’ 및 ‘o’ 글자가 포함된 사원을 출력하시오. 이때 컬럼이름은
-- ‘e AND o Name’이라고 출력하시오(10행).

SELECT last_name AS 'E 및 O' FROM employees 
WHERE last_name LIKE "%e%" AND last_name LIKE "%o%";
 

-- 문제 6
-- 현재 날짜 타입을 날짜 함수를 통해 확인하고, 1995년 5월 20일부터 1996년 5월 20일 사이에 고용된 사원들의 
-- 성과 이름(Name으로 별칭), 사원 번호, 고용 일자를 출력하시오. 단, 입사일이 빠른 순으로 정렬하시오(8행).
SELECT sysdate();
SELECT concat(last_name, " ", first_name) AS name, employee_id, hire_date
from employees
where hire_date between "1995-05-20" and "1996-05-20"
Order BY hire_date;


-- 문제 7
-- HR 부서에서는 급여(salary)와 수당율(commission_pct)에 대한 지출 보고서를 작성하려고 한다. 
-- 수당을 받는 모든 사원의 성과 이름(Name으로 별칭), 급여, 업무, 수당율을 출력하시오. 이때 급여가 큰 순서대로 정렬하되, 급여가 같으면 수당율이 큰 순서대로 정렬하시오(35행).



-- 문제 8
-- 이번 분기에 60번 IT 부서에서는 신규 프로그램을 개발하고 보급하여 회사에 공헌하였다. 
-- 이에 해당 부서의 사원 급여를 12.3% 인상하기로 하였다. 60번 IT 부서 사원의 급여를 12.3% 인상하여 정수만(반올림) 표시하는 보고서를 작성하시오. 
-- 출력 형식은 사번, 이름과 성(Name으로 별칭), 급여, 인상된 급여(Increased Salary로 별칭) 순으로 출력한다(5행).



-- 문제 9
-- 성이 ‘s’로 끝나는 각 사원의 이름과 업무를 아래의 예와 같이 출력하고자 한다. 
-- 예) Sigal Tobias is a PU_CLERK
-- 출력시 성과 이름은 첫 글자가 대문자, 업무는 모두 대문자로 출력하고 컬럼명은 Employee JOBs.로 표시하시오(18행).



-- 문제 10
-- 모든 사원의 연봉을 표시하는 보고서를 작성하려고 한다. 보고서에 사원의 성과 이름(Name으로 별칭), 급여, 수당 여부에 따른 연봉을 포함하여 출력하시오.
-- 수당 여부는 수당이 있으면 “Salary + Commission”, 수당이 없으면 “Salary only”라고 표시하고, 별칭은 적절히 붙인다. 
-- 또한 출력 시 연봉이 높은 순으로 정렬한다(107행).



