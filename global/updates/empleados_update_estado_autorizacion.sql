UPDATE wg_customer_employee AS ce
    JOIN wg_customers AS c 
        ON ce.customer_id = c.id
SET ce.isActive = 0, ce.isAuthorized = 0
WHERE c.status = 0 AND (ce.isAuthorized = 1 OR ce.isActive = 1);