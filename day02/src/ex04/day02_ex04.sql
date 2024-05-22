SELECT pizza.pizza_name, pizzeria.name AS pizzeria_name, pizza.price
FROM (SELECT * FROM menu WHERE pizza_name='mushroom pizza' OR pizza_name='pepperoni pizza') AS pizza
LEFT JOIN pizzeria ON pizza.pizzeria_id = pizzeria.id
WHERE pizza.pizza_name IS NOT NULL
ORDER BY pizza.pizza_name, pizzeria_name ASC;