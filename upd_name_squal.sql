-- 동일한 id의 이름을 업데이트하는 쿼리문

update emp e
set name =
(select first_name||' '||last_name
 from employees ey
 where ey.employee_id = e.employee_id)
where e.employee_id in
(select employee_id
 from   employees)
;
