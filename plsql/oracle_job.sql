-- https://docs.oracle.com/cd/B28359_01/appdev.111/b28419/d_job.htm#BABHCBFD  참조
-- 오라클 job등록
begin
    dbms_job.submit(
    :jobid,             -- jobid는 내부적으로 할당됨
    'test1;',           -- 마지막에 ; 추가해야함, procedure 등록
    sysdate+1/1440,     -- date타입 1분후에 처음 실행 next_date
    'sysdate+10/1440'); -- 문자타입, case문도 사용가능, 10분 간격으로 실행 interval
    commit;
end;
/

-- 오라클 job삭제 파라메터는 user_jobs에서 보이는 job번호
exec dbms_job.remove(6);

-- 오라클 job에 등록되어 있는 것을 지금 바로 수동으로 수행
exec dbms_job.run(6);