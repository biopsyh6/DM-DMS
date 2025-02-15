CREATE OR REPLACE FUNCTION Generate_Insert_Command(p_id VARCHAR2) RETURN VARCHAR2 IS 
	v_id NUMBER;
	v_val NUMBER;
	v_sql VARCHAR2(500);
BEGIN
	BEGIN
		v_id := TO_NUMBER(p_id);
    EXCEPTION
        WHEN VALUE_ERROR THEN
            RETURN 'Некорректные входные данные';
	END;

	BEGIN
		SELECT val INTO v_val FROM MYTABLE WHERE id = v_id;
	EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Запись с таким ID не найдена';
        WHEN TOO_MANY_ROWS THEN
            RETURN 'Найдено несколько записей с таким ID';
	END;
	
	v_sql := 'INSERT INTO MYTABLE (id, val) VALUES (' || v_id || ', ' || v_val || ');';
	RETURN v_sql;
END Generate_Insert_Command;


SELECT Generate_Insert_Command('12') FROM dual;

SELECT * FROM MYTABLE m;
