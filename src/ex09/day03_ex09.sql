INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT (SELECT MAX(id) + 1 FROM person_visits), (SELECT id FROM person WHERE name = 'Denis'), (SELECT id FROM pizzeria WHERE name = 'Dominos'), '2022-02-24'
WHERE NOT EXISTS (
    SELECT 1
    FROM person_visits
    WHERE person_id = (SELECT id FROM person WHERE name = 'Denis')
    AND pizzeria_id = (SELECT id FROM pizzeria WHERE name = 'Dominos')
    AND visit_date = '2022-02-24'
);

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT (SELECT MAX(id) + 1 FROM person_visits), (SELECT id FROM person WHERE name = 'Irina'), (SELECT id FROM pizzeria WHERE name = 'Dominos'), '2022-02-24'
WHERE NOT EXISTS (
    SELECT 1
    FROM person_visits
    WHERE person_id = (SELECT id FROM person WHERE name = 'Irina')
    AND pizzeria_id = (SELECT id FROM pizzeria WHERE name = 'Dominos')
    AND visit_date = '2022-02-24'
);