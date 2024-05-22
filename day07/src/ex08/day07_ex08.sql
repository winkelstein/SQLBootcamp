SELECT person.address, pizzeria.name, COUNT(person_order.id)
FROM person_order
INNER JOIN menu ON person_order.menu_id = menu.id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
INNER JOIN person ON person.id = person_order.person_id
GROUP BY person.address, pizzeria.name
ORDER BY address, name;