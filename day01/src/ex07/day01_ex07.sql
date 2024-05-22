SELECT person_order.order_date, (SELECT CONCAT(person.name, ' (age:', person.age, ')')) AS person_information FROM person_order
JOIN person ON person.id = person_order.person_id
ORDER BY order_date, person_information ASC