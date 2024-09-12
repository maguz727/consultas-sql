WITH empleados AS (
    SELECT
        REPLACE(FORMAT((SELECT COUNT(*) FROM wg_customer_employee WHERE isActive = 1), 0), ',', '.') AS Activos,
        REPLACE(FORMAT((SELECT COUNT(*) FROM wg_customer_employee WHERE isActive = 0), 0), ',', '.') AS Inactivos,
        REPLACE(FORMAT((SELECT COUNT(*) FROM wg_customer_employee), 0), ',', '.') AS Total
),
empresas AS (
    SELECT
        REPLACE(FORMAT((SELECT COUNT(*) FROM wg_customers WHERE `status` = 1 AND classification <> 'Contratante'), 0), ',', '.') AS Activos,
        REPLACE(FORMAT((SELECT COUNT(*) FROM wg_customers WHERE `status` <> 1 AND classification <> 'Contratante'), 0), ',', '.') AS Inactivos,
        REPLACE(FORMAT((SELECT COUNT(*) FROM wg_customers WHERE classification <> 'Contratante'), 0), ',', '.') AS Total
),
usuarios AS (
    SELECT
        REPLACE(FORMAT((SELECT COUNT(*) FROM users WHERE is_activated = 1), 0), ',', '.') AS Activos,
        REPLACE(FORMAT((SELECT COUNT(*) FROM users WHERE is_activated = 0), 0), ',', '.') AS Inactivos,
        REPLACE(FORMAT((SELECT COUNT(*) FROM users), 0), ',', '.') AS Total
),
documentos AS (
    SELECT
        NULL AS Activos,
        NULL AS Inactivos,
        REPLACE(FORMAT((SELECT COUNT(*) FROM wg_customer_employee_document), 0), ',', '.') AS Total
)
SELECT 'Empleados' AS Descripcion, Activos, Inactivos, Total FROM empleados
UNION ALL
SELECT 'Empresas Contratistas' AS Descripcion, Activos, Inactivos, Total FROM empresas
UNION ALL
SELECT 'Usuarios' AS Descripcion, Activos, Inactivos, Total FROM usuarios
UNION ALL
SELECT
    'Documentos' AS Descripcion,
    Activos,
    Inactivos,
    Total
FROM
    documentos