SELECT menu.pizza_name AS pizza_name, menu.price, pizzeria.name AS pizzeria_name, person_visits.visit_date
FROM person_visits
LEFT JOIN menu ON person_visits.pizzeria_id = menu.pizzeria_id
LEFT JOIN person ON person_visits.person_id = person.id
LEFT JOIN pizzeria on person_visits.pizzeria_id = pizzeria.id
WHERE person.name = 'Kate' AND price >= 800 AND price <= 1000
ORDER BY pizza_name, price, pizzeria_name;