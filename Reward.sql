CREATE OR REPLACE FUNCTION Calculate_Reward (
	p_monthly_salary VARCHAR2, 
	p_bonus_percent VARCHAR2
) RETURN NUMBER IS 
	v_monthly_salary NUMBER;
    v_bonus_percent NUMBER;
	v_bonus NUMBER;
	v_result NUMBER;
BEGIN
	BEGIN
        v_monthly_salary := TO_NUMBER(p_monthly_salary);
    	v_bonus_percent := TO_NUMBER(p_bonus_percent);
--    EXCEPTION
--        WHEN VALUE_ERROR THEN
--            RETURN -1;
    END;
	IF p_monthly_salary <= 0 OR p_bonus_percent < 0 THEN
		RAISE_APPLICATION_ERROR(-20001, 'Некорректные входные данные');
	END IF;
	
	v_bonus := p_bonus_percent / 100;
	
	v_result := (1 + v_bonus) * 12 * p_monthly_salary;
	
	RETURN v_result;
	
EXCEPTION 
	WHEN OTHERS THEN 
		RETURN -1;
END;


SELECT Calculate_Reward ('2000', '5') FROM dual;
