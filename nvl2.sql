-- nvl2�� 3�׿�����ó�� ó�� ������ NULL�� �ƴϸ� ������ �����ϰ� NULL�̸� �� ������ ����
select
employee_id, name, salary, commission_pct,
nvl2(commission_pct, 10*(salary*(100+commission_pct)), 10*salary) sal
from emp
