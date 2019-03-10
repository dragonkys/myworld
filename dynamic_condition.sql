/* 다이나믹한 여러 값 조건으로 쿼리하기 */
with aa as 
 ( 
 select '아이유'   as 이름, 4 as 점수 from dual union all 
 select '소녀시대' as 이름, 5 as 점수 from dual union all 
 select '아이유'   as 이름, 5 as 점수 from dual union all 
 select '브아걸'   as 이름, 6 as 점수 from dual union all 
 select '소녀시대' as 이름, 8 as 점수 from dual union all 
 select 'AOA'      as 이름, 4 as 점수 from dual union all 
 select '레드벨벳' as 이름, 5 as 점수 from dual union all 
 select '레인보우' as 이름, 5 as 점수 from dual union all 
 select 'AOA'      as 이름, 5 as 점수 from dual union all 
 select '레드벨벳' as 이름, 3 as 점수 from dual 
) 
select 이름, sum(점수) as 총점 
from aa 
where 이름 in (select regexp_substr('AOA,소녀시대', '[^,]+', 1, lv) 
from (select level as lv from dual connect by level <= regexp_count('AOA,소녀시대',',') + 1) 
) 
group by 이름 

