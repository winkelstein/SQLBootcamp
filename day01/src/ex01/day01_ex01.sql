(SELECT person.name as object_name FROM person ORDER BY person.name ASC)
UNION ALL
(SELECT menu.pizza_name as object_name FROM menu ORDER BY menu.pizza_name ASC)