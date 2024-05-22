INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES ((SELECT MAX(id)+1 FROM person_order),
        (SELECT person.id FROM person WHERE name = 'Denis'),
        (SELECT menu.id FROM menu WHERE pizza_name = 'Sicilian pizza'),
        '2022-02-04');

INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES ((SELECT MAX(id)+1 FROM person_order),
        (SELECT person.id FROM person WHERE name = 'Irina'),
        (SELECT menu.id FROM menu WHERE pizza_name = 'Sicilian pizza'),
        '2022-02-04');