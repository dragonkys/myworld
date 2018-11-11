select max(employee_id) from employees;

select /*+ index_desc ( a EMP_EMP_ID_PK) */ 
      employee_id 
from  employees a 
where employee_id < 9999999
and rownum = 1;
