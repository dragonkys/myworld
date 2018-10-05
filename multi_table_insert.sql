insert all
when department_id = 20 then -- marketing
into emp_mk
when department_id = 100 then -- finance
into emp_fi
else
into emp_else
select *
from emp
;

-- ALL 일때는 when 조건에 해당하는 모든 레코드가 insert : 같은 레코드 여러 건 입력
INSERT ALL
WHEN SALARY >= 1500 THEN
INTO EMP_MK
WHEN DEPARTMENT_ID = 80 THEN
INTO EMP_FI
SELECT * FROM EMP
;

-- FIRST일때는 첫번째 조건에 해당하는 것이 insert 되면 2번째 조건 부터는 insert되지 않음 : 같은 레코드 1건만 입력
INSERT FIRST
WHEN SALARY >= 1500 THEN
INTO EMP_MK
WHEN DEPARTMENT_ID = 80 THEN
INTO EMP_FI
SELECT * FROM EMP
;

