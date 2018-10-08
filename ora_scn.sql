-- 오라클 row sequence number(?)로 예상되며, timestemp로 변경하면 생성일자가 된다.
select ora_rowscn,to_char(SCN_TO_TIMESTAMP(ORA_ROWSCN),'YYYYMMDD') r_cre_date, employee_id,name
from emp
order by employee_id
