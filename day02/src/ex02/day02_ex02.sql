SELECT COALESCE(p.name, '-'), v.visit_date, COALESCE(pi.name, '-') AS pizzeria_name
FROM (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS v
FULL JOIN pizzeria AS pi ON v.pizzeria_id = pi.id
FULL JOIN person AS p ON v.person_id = p.id
ORDER BY 1, 2, 3;