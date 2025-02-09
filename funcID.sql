CREATE OR REPLACE FUNCTION Generate_Insert_Command(p_id NUMBER) RETURN VARCHAR2 IS 
	v_val NUMBER;
	v_sql VARCHAR2(500);
BEGIN
	SELECT val INTO v_val FROM MYTABLE WHERE id = p_id;
	v_sql := 'INSERT INTO MYTABLE (id, val) VALUES (' || p_id || ', ' || v_val || ');';
	RETURN v_sql;
END Generate_Insert_Command;
