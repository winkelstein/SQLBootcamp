INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id)+1 FROM person_visits), 
        (SELECT person.id FROM person WHERE name = 'Denis'),
        (SELECT pizzeria.id FROM pizzeria WHERE name = 'Dominos'),
        '2022-02-04');

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id)+1 FROM person_visits), 
        (SELECT person.id FROM person WHERE name = 'Irina'),
        (SELECT pizzeria.id FROM pizzeria WHERE name = 'Dominos'),
        '2022-02-04');