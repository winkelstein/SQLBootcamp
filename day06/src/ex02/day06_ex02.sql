SELECT p.name, m.pizza_name, m.price, 
       (m.price - (m.price * pd.discount/100) ) AS discount_price, 
       p2.name AS pizzeria_name
FROM person_order 
INNER JOIN menu AS m ON m.id = person_order.menu_id
INNER JOIN person AS p ON p.id = person_order.person_id
INNER JOIN person_discounts AS pd ON p.id = pd.person_id AND pd.pizzeria_id = m.pizzeria_id
INNER JOIN pizzeria AS p2 ON m.pizzeria_id = p2.id
ORDER BY 1,2;