SELECT day_series::DATE AS missing_date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS day_series
LEFT JOIN person_visits
ON day_series = person_visits.visit_date AND (person_visits.person_id = 1 OR person_visits.person_id = 2)
WHERE person_visits.person_id IS NULL
ORDER BY day_series ASC;