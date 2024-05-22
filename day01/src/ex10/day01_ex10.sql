SELECT person.name AS person_name, menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
JOIN person ON person.id = person_order.person_id
ORDER BY person_name ASC, pizza_name ASC, pizzeria_name ASC;