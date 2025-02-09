CREATE OR REPLACE FUNCTION Calculate_Reward (
	p_monthly_salary NUMBER, 
	p_bonus_percent INTEGER
) RETURN NUMBER IS 
	v_bonus NUMBER;
	v_result NUMBER;
BEGIN
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
