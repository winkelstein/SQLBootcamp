SELECT m1.pizza_name, pizzeria_m1.name AS pizzeria_name1, pizzeria_m2.name AS pizzeria_name2, m1.price
FROM menu AS m1
INNER JOIN menu AS m2 ON m1.price = m2.price
INNER JOIN pizzeria AS pizzeria_m1 ON m1.pizzeria_id = pizzeria_m1.id
INNER JOIN pizzeria AS pizzeria_m2 ON m2.pizzeria_id = pizzeria_m2.id
WHERE m1.pizza_name = m2.pizza_name AND m1.id > m2.id
ORDER BY m1.pizza_name;