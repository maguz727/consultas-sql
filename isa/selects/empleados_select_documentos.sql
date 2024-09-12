SELECT 
	UPPER(tp.item) AS 'TIPO DE CLIENTE',
	UPPER(c.classification) AS 'CLASIFICACIÓN',
	UPPER(c.businessName) AS 'NOMBRE DEL CLIENTE', 
	c.documentNumber AS 'NIT',
    CASE c.`status`
		WHEN 1 THEN 'ACTIVO'
		WHEN 0 THEN 'INACTIVO'
		WHEN -1 THEN 'RETIRADO'
		ELSE ''
	END AS 'ESTADO DEL CLIENTE',
	TRIM(REGEXP_REPLACE(e.fullName, '[ ]+', ' ')) AS 'NOMBRE DEL EMPLEADO',
	CASE ce.isActive
		WHEN 1 THEN 'ACTIVO'
		WHEN 0 THEN 'INACTIVO'
		ELSE ''
	END AS 'ESTADO DEL EMPLEADO',
	UPPER(ced.description) AS 'DESCRIPCIÓN DOCUMENTO',
	CASE ced.`status`
		WHEN 1 THEN 'VIGENTE'
		WHEN 3 THEN 'VENCIDO'
		WHEN 2 THEN 'ANULADO'
		ELSE 'OTRO'
	END AS 'ESTADO DEL DOCUMENTO'
FROM wg_customer_employee_document AS ced
    JOIN wg_customer_employee AS ce 
        ON ced.customer_employee_id = ce.id 
    JOIN wg_employee AS e 
        ON ce.employee_id = e.id
    JOIN wg_customers AS c 
        ON ce.customer_id = c.id
    LEFT JOIN (
        SELECT sp.item, sp.`value`
        FROM system_parameters AS sp
        WHERE sp.`group` = 'tipocliente'
    ) AS tp ON tp.`value` COLLATE utf8_general_ci = c.type
ORDER BY e.fullName ASC