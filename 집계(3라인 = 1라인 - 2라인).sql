/* 1번 라인에서 2번 라인을 빼는 방법 */

select LINE, sum(SAL) TOT
      , sum(decode(MM,'01',SAL)) w01
      , sum(decode(MM,'02',SAL)) w02
      , sum(decode(MM,'03',SAL)) w03
      , sum(decode(MM,'04',SAL)) w04
      , sum(decode(MM,'05',SAL)) w05
      , sum(decode(MM,'06',SAL)) w06
      , sum(decode(MM,'07',SAL)) w07
      , sum(decode(MM,'08',SAL)) w08
      , sum(decode(MM,'09',SAL)) w09
      , sum(decode(MM,'10',SAL)) w10
      , sum(decode(MM,'11',SAL)) w11
      , sum(decode(MM,'12',SAL)) w12
from (
        select /*+ OPT_PARAM('_gby_hash_aggregation_enabled' 'false') */
                y.NO LINE, MM, sum(SAL * decode(y.NO*LINE,6,-1,1)) SAL
        from 
            (
                select 1 LINE, to_char(hire_date,'MM') MM, sum(salary) SAL  
                from emp where to_char(hire_date,'YYYY') = '2006' 
                group by to_char(hire_date,'MM')
                union all
                select 2 LINE, to_char(hire_date,'MM') MM, sum(salary) SAL  
                from emp where to_char(hire_date,'YYYY') = '2007' 
                group by to_char(hire_date,'MM')
            ) x, 
            (select level NO from dual connect by level <= 3) y
        where y.NO in (LINE,3)
        group by y.NO, MM
    )
group by LINE    