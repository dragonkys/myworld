-- ����Ŭ row sequence number(?)�� ����Ǹ�, timestemp�� �����ϸ� �������ڰ� �ȴ�.
select ora_rowscn,to_char(SCN_TO_TIMESTAMP(ORA_ROWSCN),'YYYYMMDD') r_cre_date, employee_id,name
from emp
order by employee_id
