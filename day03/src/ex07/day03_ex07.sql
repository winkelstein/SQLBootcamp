WITH Dominos_id AS (
    SELECT id FROM pizzeria
    WHERE pizzeria.name = 'Dominos'
)
INSERT INTO menu (id, pizzeria_id, pizza_name, price)
SELECT 19, id, 'Greek pizza', 800
FROM Dominos_id;