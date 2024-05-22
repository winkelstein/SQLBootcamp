(SELECT pizzeria.name AS pizzeria_name FROM menu
    INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    INNER JOIN person_order ON person_order.menu_id = menu.id
    JOIN person on person_order.person_id = person.id
    WHERE gender = 'female'
EXCEPT
    SELECT pizzeria.name AS pizzeria_name FROM menu
    INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    INNER JOIN person_order ON person_order.menu_id = menu.id
    JOIN person on person_order.person_id = person.id
    WHERE gender = 'male'
)
UNION
(SELECT pizzeria.name AS pizzeria_name FROM menu
    INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    INNER JOIN person_order ON person_order.menu_id = menu.id
    JOIN person on person_order.person_id = person.id
    WHERE gender = 'male'
EXCEPT
    SELECT pizzeria.name AS pizzeria_name FROM menu
    INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    INNER JOIN person_order ON person_order.menu_id = menu.id
    JOIN person on person_order.person_id = person.id
    WHERE gender = 'female'
)
ORDER BY pizzeria_name;