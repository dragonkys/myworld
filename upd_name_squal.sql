-- ������ id�� �̸��� ������Ʈ�ϴ� ������

update emp e
set name =
(select first_name||' '||last_name
 from employees ey
 where ey.employee_id = e.employee_id)
where e.employee_id in
(select employee_id
 from   employees)
;
