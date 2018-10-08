-- nvl2는 3항연사자처럼 처음 조건이 NULL이 아니면 다음을 수행하고 NULL이면 그 다음을 수행
select
employee_id, name, salary, commission_pct,
nvl2(commission_pct, 10*(salary*(100+commission_pct)), 10*salary) sal
from emp
