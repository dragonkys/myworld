-- 현재 연도, 이전연도, 이후연도에 입사한 사원수를 동시에 추출하는 쿼리
-- LAG와 LEAD 함수의 세번째 파라미터인 DEFAULT 값을 0으로 명시하여 , 이 두 함수의
-- 반환값이 NULL인 것에 대해 0을 반환

SELECT TO_CHAR(HIRE_DATE, 'YYYY') 입사년도, COUNT(*) 사원수, 
      LAG(COUNT(*),1,0) OVER (ORDER BY TO_CHAR(HIRE_DATE, 'YYYY')) 이전연도사원수,
      LEAD(COUNT(*),1,0) OVER (ORDER BY TO_CHAR(HIRE_DATE, 'YYYY')) 이후연도사원수
  FROM EMPLOYEES
 GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
 ORDER BY TO_CHAR(HIRE_DATE, 'YYYY')
 ;