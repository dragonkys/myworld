-- row_number�Լ��� �̿��Ͽ� job_history ���̺��� �ڷ� �� �ֽ��ڷḦ 1�� ������ �ͼ� outer join�� ��
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
