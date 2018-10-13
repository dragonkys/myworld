-- connect_by_root ���� �����Ŵ����� ��θ� �����ش�.(���� ���ڵ� �Ǽ����� ������)
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