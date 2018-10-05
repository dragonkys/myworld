CREATE OR REPLACE PROCEDURE ins_emp_proc (
  p_emp_name emp.name%TYPE,
  p_department_id departments.department_id%TYPE )
IS 
  vn_employee_id emp.employee_id%TYPE;
  vd_curr_date   DATE := SYSDATE;
  vn_cnt         NUMBER := 0;

  ex_invalid_depid EXCEPTION;         -- �߸��� �μ���ȣ�� ��� ���� ����
BEGIN
  SELECT COUNT(*)
  INTO vn_cnt
  FROM departments
  WHERE department_id = p_department_id;

  IF vn_cnt = 0 THEN
     RAISE ex_invalid_depid;          -- ����� ���� ���ܸ� �ǵ������� �߻���Ŵ
  END IF;

  SELECT MAX(employee_id) + 1
  INTO vn_employee_id
  FROM emp;

  INSERT INTO emp (employee_id, name, hire_date, department_id)
         VALUES (vn_employee_id, p_emp_name, vd_curr_date, p_department_id);

  COMMIT;

  EXCEPTION WHEN ex_invalid_depid THEN   -- ����� ���� ���� ó��
                 DBMS_OUTPUT.PUT_LINE('�ش� �μ� ��ȣ�� �����ϴ�.');
            WHEN OTHERS THEN 
                 DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;



