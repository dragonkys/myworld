--��ü �μ��� ��� �� �޿�����, �� �޿��� ���� �μ��� �μ� �̸�, �� �޿��� ǥ���ϴ� ������ �ۼ�
WITH
 -- 1�ܰ� ���� : ��� �μ��� �� �޿��� ����� ���� ����� ���� : dept_costs
 dept_costs AS(
        SELECT d.department_name dname, SUM(e.salary) AS dept_total
        FROM employees e, departments d
        WHERE e.department_id = d.department_id
        GROUP BY d.department_name),
 -- 2�ܰ� ���� : ��ü �μ��� ��� �� �޿��� ����� ���� ����� ����: avg_cost
 avg_cost AS(
        SELECT AVG(dept_total) AS dept_avg
        FROM dept_costs)
-- ���� ����( �������) : 1�ܰ迡�� ����� �� �޿��� 2�ܰ迡�� ����� ��� �ѱ޿��� ����
SELECT *
FROM dept_costs
WHERE dept_total > 
        (SELECT dept_avg FROM avg_cost)
ORDER BY dname;

