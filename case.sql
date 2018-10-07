select department_id,
	case
	when department_id >= 90 then 'A' 
	when department_id >= 80 then 'B' 
	when department_id >= 70 then 'C' 
	when department_id >= 60 then 'D' 
	else 'F' end val 
from employees;

