-- �������ڰ� �ֽ��� ���ڵ�鸸 1�Ǿ� �������� ������
select *
from job_history
where employee_id||start_date in
(
select employee_id|| max(start_date)
from   job_history
group by employee_id
)