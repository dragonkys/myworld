
-- update에 returning을 사용하면 변경된 값을 가지고 올 수 있음, delete에도 사용가능
DECLARE
TYPE EmpRec IS RECORD (
last_name employees.last_name%TYPE,
salary employees.salary%TYPE
);
emp_info EmpRec;
old_salary employees.salary%TYPE;
BEGIN
	SELECT salary INTO old_salary
	FROM employees
	WHERE employee_id = 100;

	UPDATE employees
	SET salary = salary * 1.1
	WHERE employee_id = 100
	RETURNING last_name, salary INTO emp_info;

	DBMS_OUTPUT.PUT_LINE (
		'Salary of ' || emp_info.last_name || ' raised from ' ||
		old_salary || ' to ' || emp_info.salary
	);
	
END;
/
