SELECT lpad(' ',(level-1)*3)||last_name name,
                  last_name,
                  employee_id,
                  department_id,
                  manager_id,
                  level,
                  connect_by_isleaf                        isleaf, -- 하위에 더 없으면 1, 있으면 0
                  sys_connect_by_path (last_name, '/')     path
             FROM employees
       START WITH employee_id = 100
       CONNECT BY PRIOR employee_id = manager_id
ORDER SIBLINGS BY department_id,last_name;
