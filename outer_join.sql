-- row_number함수를 이용하여 job_history 테이블의 자료 중 최신자료를 1건 가지고 와서 outer join을 함
select a.employee_id, a.last_name, a.job_id , h.department_id, d.department_name	 
from  employees a, departments d,
(
select employee_id,job_id,department_id
 from ( 
    select employee_id, job_id, department_id, 
            row_number() over(partition by employee_id order by start_date desc) r_num 
    from job_history 
    ) 
where r_num = 1
) h
where a.employee_id = h.employee_id(+)
and h.department_id = d.department_id(+) 
order by a.employee_id
