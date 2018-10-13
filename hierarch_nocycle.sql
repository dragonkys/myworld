-- ���࿡ start with last_name = 'King'�� manager_id�� null�� �ƴ϶� �ٸ� ����� ������ ��� nocycle�ɼ��� ���� ������ �����߻���
    SELECT last_name                                Employee,
           CONNECT_BY_ISCYCLE                       Cycle,
           LEVEL,
           SYS_CONNECT_BY_PATH (last_name, '/')     Path
      FROM employees
     WHERE LEVEL <= 3 AND department_id = 80
START WITH last_name = 'King'
CONNECT BY NOCYCLE PRIOR employee_id = manager_id AND LEVEL <= 4
  ORDER BY Employee, Cycle, LEVEL, Path;
  
  