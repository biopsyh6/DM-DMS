DECLARE
	counter NUMBER := 1;
BEGIN
	WHILE counter <= 10000 LOOP
		INSERT INTO MYTABLE m (id, val)
		VALUES (counter, ROUND(DBMS_RANDOM.VALUE(1, 10000)));
		counter := counter + 1;
	END LOOP;
	COMMIT;
END;

