
-- ������ decode�� 100�̻��� ��� A�� ó���ϱ� ���� decode
select department_id,
decode(floor(department_id/10), 10, 'A', 9, 'A', 8, 'B', 7, 'C', 6, 'D', decode(sign((floor(department_id/10)) - 10),1,'A','F')) val
from employees
