MERGE INTO emp c
USING (
select *
from   employees
) e
ON (c.employee_id = e.employee_id)
WHEN MATCHED THEN
	UPDATE SET
 	c.name = e.first_name||' '||e.last_name
WHEN NOT MATCHED THEN
 	INSERT
 	(c.employee_id, c.name, c.EMAIL, c.PHONE_NUMBER, c.HIRE_DATE, c.JOB_ID, c.SALARY, c.COMMISSION_PCT, c.MANAGER_ID, c.DEPARTMENT_ID)
  VALUES (e.employee_id, e.first_name||' '||e.last_name, e.EMAIL, e.PHONE_NUMBER, e.HIRE_DATE, e.JOB_ID, e.SALARY, e.COMMISSION_PCT, e.MANAGER_ID, e.DEPARTMENT_ID)

