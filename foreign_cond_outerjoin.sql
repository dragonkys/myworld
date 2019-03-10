-- �ٸ� ���̺� �ִ� �ʵ�� between join�� �ؾ��ϸ鼭 �ϳ��� row�� ������ ���� ��� 
-- �׷��鼭 outer join���� ���� ���̺��� ��� ���;� ��

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