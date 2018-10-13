-- table의 인덱스를 varchar2로 선언했을 때의 사용법
DECLARE
	-- Associative array indexed by string:
	TYPE population IS TABLE OF NUMBER -- Associative array type
	INDEX BY VARCHAR2(64); -- indexed by string
	city_population population; -- Associative array variable
	i VARCHAR2(64); -- Scalar variable
BEGIN
	-- Add elements (key-value pairs) to associative array:
	city_population('Smallville') := 2000;
	city_population('Midland') := 750000;
	city_population('Megalopolis') := 1000000;
	-- Change value associated with key 'Smallville':
	city_population('Smallville') := 2001;
	-- Print associative array:
	i := city_population.FIRST; -- Get first element of array

	WHILE i IS NOT NULL LOOP
		DBMS_Output.PUT_LINE
		('Population of ' || i || ' is ' || city_population(i));
		i := city_population.NEXT(i); -- Get next element of array
	END LOOP;
END;
/
