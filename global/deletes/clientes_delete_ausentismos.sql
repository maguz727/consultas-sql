-- Inicia la transacción
START TRANSACTION;

-- Elimina los registros relacionados con el ausentismo 
DELETE cad, cadd, cadr, cadic, caddc, cadap, cadapa, cadapr
FROM wg_customer_absenteeism_disability AS cad 
	LEFT JOIN wg_customer_absenteeism_disability_document AS cadd 
		ON cad.id = cadd.customer_disability_id
	LEFT JOIN wg_customer_absenteeism_disability_report_al AS cadr
		ON cad.id = cadr.customer_disability_id
	LEFT JOIN wg_customer_absenteeism_disability_indirect_cost AS cadic
		ON cad.id = cadic.customer_disability_id
	LEFT JOIN wg_customer_absenteeism_disability_day_charged AS caddc
		ON cad.id = caddc.customer_disability_id
	LEFT JOIN wg_customer_absenteeism_disability_action_plan AS cadap
		ON cad.id = cadap.customer_disability_id
	LEFT JOIN wg_customer_absenteeism_disability_action_plan_alert AS cadapa
		ON cadap.id = cadapa.action_plan_id
	LEFT JOIN wg_customer_absenteeism_disability_action_plan_resp AS cadapr
		ON cadap.id = cadapr.action_plan_id
WHERE cad.customer_employee_id IN (
	SELECT ce.id
	FROM wg_customer_employee AS ce
	WHERE ce.customer_id = 5
);
	
-- Verifica los datos
SELECT *
FROM wg_customer_absenteeism_disability AS cad
WHERE cad.customer_employee_id IN (
    SELECT ce.id 
    FROM wg_customer_employee AS ce
    WHERE ce.customer_id = 5
);

-- Confirmar eliminación
-- COMMIT;

-- Deshacer los cambios
-- ROLLBACK;