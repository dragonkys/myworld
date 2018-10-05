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

-- ALL �϶��� when ���ǿ� �ش��ϴ� ��� ���ڵ尡 insert : ���� ���ڵ� ���� �� �Է�
INSERT ALL
WHEN SALARY >= 1500 THEN
INTO EMP_MK
WHEN DEPARTMENT_ID = 80 THEN
INTO EMP_FI
SELECT * FROM EMP
;

-- FIRST�϶��� ù��° ���ǿ� �ش��ϴ� ���� insert �Ǹ� 2��° ���� ���ʹ� insert���� ���� : ���� ���ڵ� 1�Ǹ� �Է�
INSERT FIRST
WHEN SALARY >= 1500 THEN
INTO EMP_MK
WHEN DEPARTMENT_ID = 80 THEN
INTO EMP_FI
SELECT * FROM EMP
;

