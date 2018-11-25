with test as(
select 'A' a1, 10 a2 from dual
union all
select 'B' a1, 20 a2 from dual
union all
select 'C' a1, 10 a2 from dual
union all
select 'D' a1, 30 a2 from dual
)
select a1, sum(a2) a2, sum(a3) a3
from (
    select /*+ OPT_PARAM('_gby_hash_aggregation_enabled' 'false') */ 
        a3 a1,null a2, sum(decode(a3||gubun,'A1',a2,'B2',a2,'C3',a2,'D4',a2)) a3
    from (
        select a1, a2, decode(gubun,1,a1,2,replace(a1,'A','B'),3,replace(replace(a1,'B','A'),'A','C'),4,replace(replace(replace(a1,'C','B'),'B','A'),'A','D')) a3, gubun  
        from (
            select a1, a2, gubun 
            from test,(select level gubun from dual connect by level < 5)
            )
        )
    group by a3
    union all
    select a1, a2 , null a3 
    from test  
)
group by a1
;



