## Delete Global

- [`clientes_delete_ausentismos.sql`](./clientes_delete_ausentismos.sql) : Esta consulta elimina todos los registros relacionados con el ausentismo


### Descripción clientes_delete_ausentismos.sql:

- **Eliminaciones:** Esta consulta elimina todos los registros relacionados con el ausentismo en las tablas `wg_customer_absenteeism_disability` y sus tablas dependientes.
- **Filtro:** Usa un `WHERE` que limita la eliminación solo a los empleados que pertenecen a un cliente específico (en este caso, el cliente con `customer_id = 5`).