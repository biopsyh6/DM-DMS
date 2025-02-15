CREATE OR REPLACE PROCEDURE Insert_Record(p_val NUMBER) IS 
BEGIN 
	INSERT INTO MYTABLE (val) VALUES (p_val);
	COMMIT;
END;

CREATE OR REPLACE PROCEDURE Update_Record(p_id NUMBER, p_val NUMBER) IS 
BEGIN 
	UPDATE MYTABLE SET val = p_val WHERE id = p_id;
	COMMIT;
END;

CREATE OR REPLACE PROCEDURE Delete_Record(p_id NUMBER) IS 
BEGIN 
	DELETE FROM MYTABLE WHERE id = p_id;
	COMMIT;
END;


SELECT * FROM MYTABLE m;

DECLARE
    v_val NUMBER := 7070;
BEGIN
	Insert_Record(v_val);
END;

DECLARE
    v_val NUMBER := 6969;
BEGIN
	Update_Record(2, v_val);
END;

BEGIN
	Delete_Record(10000);
END;

