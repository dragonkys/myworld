-- 만약에 start with last_name = 'King'의 manager_id가 null이 아니라 다른 사원이 지정된 경우 nocycle옵션을 주지 않으면 오류발생함
    SELECT last_name                                Employee,
           CONNECT_BY_ISCYCLE                       Cycle,
           LEVEL,
           SYS_CONNECT_BY_PATH (last_name, '/')     Path
      FROM employees
     WHERE LEVEL <= 3 AND department_id = 80
START WITH last_name = 'King'
CONNECT BY NOCYCLE PRIOR employee_id = manager_id AND LEVEL <= 4
  ORDER BY Employee, Cycle, LEVEL, Path;
  
  