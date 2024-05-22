SELECT visits.name, coalesce(visits.count, 0) + coalesce(orders.count, 0) as total_count
FROM (
  SELECT pizzeria.name, COUNT(*) AS "count"
  FROM person_visits
  INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
  GROUP BY pizzeria.name
) AS visits
FULL JOIN (
  SELECT pizzeria.name, COUNT(*) AS "count"
  FROM person_order
  INNER JOIN menu on person_order.menu_id = menu.id
  INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
  GROUP BY pizzeria.name
) AS orders ON visits.name = orders.name
ORDER BY total_count DESC, name ASC;