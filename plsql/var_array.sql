-- 문자의 배열을 선언하고 사용하는 방법
DECLARE
	TYPE Foursome IS VARRAY(4) OF VARCHAR2(15);
	team Foursome := Foursome(); -- initialize to empty
	PROCEDURE print_team (heading VARCHAR2)
	IS
	BEGIN
		DBMS_OUTPUT.PUT_LINE(heading);
		IF team.COUNT = 0 THEN
			DBMS_OUTPUT.PUT_LINE('Empty');
		ELSE
			FOR i IN team.first..team.last LOOP
				DBMS_OUTPUT.PUT_LINE(i || '.' || team(i));
			END LOOP;
		END IF;
		DBMS_OUTPUT.PUT_LINE('---');
	END;
BEGIN
	print_team('Team:');
	team := Foursome('John', 'Mary', 'Alberto', 'Juanita');
	print_team('Team2:');
END;
