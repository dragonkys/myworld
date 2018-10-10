create or replace procedure hr.test1
is
emp_rec emp%rowtype;
t_email emp.email%type;            

c1 SYS_REFCURSOR;

BEGIN
	open c1 for
		select * from emp;
	loop
		fetch c1 into emp_rec;
		dbms_output.put_line(emp_rec.name);
		exit when c1%notfound;   
		
		begin
			select email into t_email
			from   emp_fi
			where  employee_id = emp_rec.employee_id;
			
			update emp_fi
			set		name = emp_rec.name||'2',
					email = emp_rec.email,
					phone_number = emp_rec.phone_number,
					hire_date = emp_rec.hire_date,
					job_id = emp_rec.job_id,
					salary = emp_rec.salary,
					commission_pct = emp_rec.commission_pct,
					manager_id = emp_rec.manager_id,
					department_id = emp_rec.department_id
			where  employee_id = emp_rec.employee_id;
			
		exception
			when no_data_found then
				insert into emp_fi
				(EMPLOYEE_ID, NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
				values
				(emp_rec.EMPLOYEE_ID, emp_rec.NAME, emp_rec.EMAIL, emp_rec.PHONE_NUMBER, emp_rec.HIRE_DATE, emp_rec.JOB_ID, 
				emp_rec.SALARY, emp_rec.COMMISSION_PCT, emp_rec.MANAGER_ID, emp_rec.DEPARTMENT_ID);
		end;
	end loop;
	close c1;

END;
/
