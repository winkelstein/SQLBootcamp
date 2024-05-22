SELECT person_order.order_date, (SELECT CONCAT(person_.name, ' (age:', person_.age, ')')) AS person_information FROM person_order
NATURAL JOIN (SELECT person.id AS person_id, person.name, person.age FROM person) AS person_
ORDER BY order_date, name ASC