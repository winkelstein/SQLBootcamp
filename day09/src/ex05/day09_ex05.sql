DROP FUNCTION IF EXISTS fnc_persons_female;
DROP FUNCTION IF EXISTS fnc_persons_male;

CREATE OR REPLACE FUNCTION fnc_persons(IN pgender varchar DEFAULT 'female')
RETURNS TABLE (id BIGINT, 
               name VARCHAR, 
               age INTEGER, 
               gender VARCHAR, 
               address VARCHAR) AS $$
        (SELECT person.id, person.name, person.age, person.gender, person.address
        FROM person
        WHERE person.gender = pgender);
$$ LANGUAGE sql;

SELECT * FROM fnc_persons(pgender := 'male');

SELECT * FROM fnc_persons();