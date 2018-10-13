--전체 부서의 평균 총 급여보다, 총 급여가 많은 부서의 부서 이름, 총 급여를 표시하는 쿼리를 작성
WITH
 -- 1단계 쿼리 : 모든 부서의 총 급여를 계산한 다음 결과를 저장 : dept_costs
 dept_costs AS(
        SELECT d.department_name dname, SUM(e.salary) AS dept_total
        FROM employees e, departments d
        WHERE e.department_id = d.department_id
        GROUP BY d.department_name),
 -- 2단계 쿼리 : 전체 부서의 평균 총 급여를 계산한 다음 결과를 저장: avg_cost
 avg_cost AS(
        SELECT AVG(dept_total) AS dept_avg
        FROM dept_costs)
-- 메인 쿼리( 성능향상) : 1단계에서 계산한 총 급여를 2단계에서 계산한 평균 총급여와 비교함
SELECT *
FROM dept_costs
WHERE dept_total > 
        (SELECT dept_avg FROM avg_cost)
ORDER BY dname;

