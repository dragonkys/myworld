-- rank�� �μ����� �ִ� ���
select department_id,last_name,salary,
rank() over(partition by department_id order by salary desc) rank    
from   employees
;

