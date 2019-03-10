-- 다른 테이블에 있는 필드와 between join을 해야하면서 하나의 row만 가지고 오는 경우 
-- 그러면서 outer join으로 메인 테이블은 모두 나와야 함

select a.employee_id, a.first_name, a.last_name, a.job_id, a.salary, b.min_salary, b.max_salary
from  employees a 
     ,(
        select a.employee_id, a.first_name, a.last_name, a.job_id, a.salary, b.min_salary, b.max_salary
               , row_number() over(partition by  a.employee_id, b.job_id order by b.base_dt) r_num
        from employees a
             , job_his b
        where a.job_id = b.job_id
        and   a.salary between b.min_salary and b.max_salary
      ) b
where a.employee_id = b.employee_id(+) 
and   r_num(+) = 1
order by a.employee_id