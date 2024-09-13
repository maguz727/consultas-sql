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
    CASE ce.`isAuthorized`
        WHEN 1 THEN 'AUTORIZADO' 
        WHEN 0 THEN 'DESAUTORIZADO'
        ELSE '' 
    END AS 'AUTORIZACIÓN DEL EMPLEADO',
    CASE e.gender
        WHEN 'M' THEN 'MASCULINO'
        WHEN 'F' THEN 'FEMENINO'
        WHEN 'P' THEN 'PENDIENTE'  
        ELSE  ''
    END AS 'GÉNERO'
FROM wg_customers AS c
    JOIN wg_customer_employee AS ce 
        ON c.id = ce.customer_id
    JOIN wg_employee AS e 
        ON ce.employee_id = e.id
    LEFT JOIN (
        SELECT sp.item, sp.`value`
        FROM system_parameters AS sp
        WHERE sp.`group` = 'tipocliente'
    ) tp ON tp.`value` COLLATE utf8_general_ci = c.type
ORDER BY e.`fullName` ASC