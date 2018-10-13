-- connect_by_root 사용시 상위매니저의 모두를 보여준다.(실제 레코드 건수보다 많아짐)
    SELECT last_name                                "Employee",
           CONNECT_BY_ROOT last_name                "Manager",
           LEVEL - 1                                "Pathlen",
           SYS_CONNECT_BY_PATH (last_name, '/')     "Path"
      FROM employees
     WHERE LEVEL > 1 AND department_id = 50
CONNECT BY PRIOR employee_id = manager_id
  ORDER BY "Employee",
           "Manager",
           "Pathlen",
           "Path";