
-- 마지막 decode는 100이상인 경우 A로 처리하기 위한 decode
select department_id,
decode(floor(department_id/10), 10, 'A', 9, 'A', 8, 'B', 7, 'C', 6, 'D', decode(sign((floor(department_id/10)) - 10),1,'A','F')) val
from employees
