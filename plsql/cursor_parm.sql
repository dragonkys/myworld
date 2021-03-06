-- cursor에 파라메터를 받는 경우의 사용법
-- PLSQL내부에 선언시에 procedure를 두는 경우 사용법

DECLARE
	CURSOR c (job VARCHAR2, max_sal NUMBER) IS
		SELECT last_name, first_name, (salary - max_sal) overpayment
		FROM employees
		WHERE job_id = job
		AND salary > max_sal
		ORDER BY salary;

	PROCEDURE print_overpaid IS
		last_name_ employees.last_name%TYPE;
		first_name_ employees.first_name%TYPE;
		overpayment_ employees.salary%TYPE;
	BEGIN
		LOOP
			FETCH c INTO last_name_, first_name_, overpayment_;
			EXIT WHEN c%NOTFOUND;
			DBMS_OUTPUT.PUT_LINE(last_name_ || ', ' || first_name_ ||
			' (by ' || overpayment_ || ')');
		END LOOP;
	END print_overpaid;

BEGIN
	DBMS_OUTPUT.PUT_LINE('----------------------');
	DBMS_OUTPUT.PUT_LINE('Overpaid Stock Clerks:');
	DBMS_OUTPUT.PUT_LINE('----------------------');

	OPEN c('ST_CLERK', 5000);
	
	print_overpaid;
	CLOSE c;

	DBMS_OUTPUT.PUT_LINE('-------------------------------');
	DBMS_OUTPUT.PUT_LINE('Overpaid Sales Representatives:');
	DBMS_OUTPUT.PUT_LINE('-------------------------------');
	OPEN c('SA_REP', 10000);
	print_overpaid;
	CLOSE c;
END;
/