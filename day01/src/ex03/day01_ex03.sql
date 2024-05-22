(SELECT person_order.order_date AS action_data, person_id FROM person_order)
INTERSECT
(SELECT person_visits.visit_date AS action_data, person_id FROM person_visits)
ORDER BY action_data, person_id DESC