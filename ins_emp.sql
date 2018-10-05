CREATE OR REPLACE PROCEDURE ins_emp_proc (
  p_emp_name emp.name%TYPE,
  p_department_id departments.department_id%TYPE )
IS 
  vn_employee_id emp.employee_id%TYPE;
  vd_curr_date   DATE := SYSDATE;
  vn_cnt         NUMBER := 0;

  ex_invalid_depid EXCEPTION;         -- 잘못된 부서번호일 경우 예외 선언
BEGIN
  SELECT COUNT(*)
  INTO vn_cnt
  FROM departments
  WHERE department_id = p_department_id;

  IF vn_cnt = 0 THEN
     RAISE ex_invalid_depid;          -- 사용자 정의 예외를 의도적으로 발생시킴
  END IF;

  SELECT MAX(employee_id) + 1
  INTO vn_employee_id
  FROM emp;

  INSERT INTO emp (employee_id, name, hire_date, department_id)
         VALUES (vn_employee_id, p_emp_name, vd_curr_date, p_department_id);

  COMMIT;

  EXCEPTION WHEN ex_invalid_depid THEN   -- 사용자 정의 예외 처리
                 DBMS_OUTPUT.PUT_LINE('해당 부서 번호가 없습니다.');
            WHEN OTHERS THEN 
                 DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;



