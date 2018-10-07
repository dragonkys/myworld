-- 시작일자가 최신인 레코드들만 1건씩 가져오는 쿼리문
select *
from job_history
where employee_id||start_date in
(
select employee_id|| max(start_date)
from   job_history
group by employee_id
)