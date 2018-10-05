select employee_id
from   emp
minus
select a.employee_id
from   emp a, employees b
where  a.employee_id = b.employee_id;


select a.employee_id, b.employee_id
from   emp a, employees b
where  a.employee_id = b.employee_id(+)
and    b.employee_id is null;

select a.employee_id, b.employee_id
from   emp a left outer join employees b
on     a.employee_id = b.employee_id
where    b.employee_id is null;
