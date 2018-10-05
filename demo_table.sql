DROP TABLE emp;
CREATE TABLE emp
( 
employee_id NUMBER(6), 
name VARCHAR2(50),
email VARCHAR2(25), 
phone_number VARCHAR2(20), 
hire_date DATE DEFAULT SYSDATE, 
job_id VARCHAR2(10), 
salary NUMBER(8,2), 
commission_pct NUMBER(2,2), 
manager_id NUMBER(6),
department_id NUMBER(4),
constraint emp_pk primary key(employee_id)
);

insert into emp (
EMPLOYEE_ID, NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID
)
select
EMPLOYEE_ID, FIRST_NAME||LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID
from employees
;
