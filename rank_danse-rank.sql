-- rank, dense_rank 사용법
select last_name,salary,
rank() over(order by salary desc) rank,        -- 동등 순위가 2명있는 경우 ex) 8,8 다음 10 이됨
dense_rank() over(order by salary desc) drank, -- 동등 순위가 2명있는 경우 ex) 8,8 다음 9가 됨
row_number() over(order by salary desc) rowno  -- 순위 무관하고 순서대로
from   employees

-- 값을 알고 있는 경우 몇번째 순위인지 알 수 있다.
select rank(11000) within group(order by salary desc) rank
from   employees
;
