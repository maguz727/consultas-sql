-- Iniciar transacción 
START TRANSACTION;

-- Eliminar los datos 
DELETE cai 
FROM wg_customer_absenteeism_indicator AS cai 
WHERE cai.customer_id = 5;

-- Verificar los datos 
SELECT *
FROM wg_customer_absenteeism_indicator AS cai 
WHERE cai.customer_id = 5;

-- Confirmar eliminación 
-- COMMIT;

-- Deshacer los cambios 
-- ROLLBACK