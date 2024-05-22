WITH Dominos_id AS (
    SELECT id FROM pizzeria
    WHERE pizzeria.name = 'Dominos'
)
INSERT INTO menu (id, pizzeria_id, pizza_name, price)
SELECT (SELECT MAX(menu.id)+1 from menu), id, 'Sicilian pizza', 900
FROM Dominos_id;