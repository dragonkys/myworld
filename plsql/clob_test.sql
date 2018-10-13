create or replace procedure sp_test_clob (p_cur_day varchar2)
is
	t_lob	clob := null;
	amt 	number := 0;
	buf		varchar2(32767) := '';
	pos		number;
	cnt		number := 0;
	t_cur_day	varchar2(8) := '';

begin

	if p_cur_day is null or trim(p_cur_day) = '' then
		select to_char(sysdate,'YYYYMMDD') into t_cur_day from dual;
	else
		t_cur_day := p_cur_day;
	end if;
	
	dbms_lob.createtemporary(t_lob,true);
	dbms_lob.open(t_lob, dbms_lob.lob_readwrite);
	
	buf := 'update emp_fi set hire_date = to_date('''||t_cur_day;
	amt := length(buf);
	pos := 1;
	dbms_lob.write(t_lob, amt, pos, buf);
	
	buf := ''',''YYYYMMDD'') where employee_id = 100 ';
	amt := length(buf);
	dbms_lob.writeappend(t_lob, amt, buf);
	dbms_output.put_line('current length of clob is : '|| dbms_lob.getlength(t_lob));
	
	dbms_lob.close(t_lob);
	
	dbms_output.put_line('final     clob is : '||t_lob);
	dbms_output.put_line('length of clob is : '||length(t_lob));
	
	begin
		execute immediate t_lob;
		cnt := sql%rowcount;
		
		commit;
	end;
	dbms_output.put_line('final effected rows : '||cnt);
end;
/
