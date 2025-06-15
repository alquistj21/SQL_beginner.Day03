WITH
woman_visited AS (SELECT pizzeria.name AS pizzeria_name
FROM person
JOIN person_visits ON person_visits.person_id = person.id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE person.gender = 'female'
ORDER BY pizzeria_name ASC),

man_visited AS (SELECT pizzeria.name AS pizzeria_name
FROM person
JOIN person_visits ON person_visits.person_id = person.id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE person.gender = 'male'
ORDER BY pizzeria_name ASC),

pizzerias_man AS (SELECT * FROM man_visited EXCEPT ALL SELECT * FROM woman_visited),
pizzerias_woman AS (SELECT * FROM woman_visited EXCEPT ALL SELECT * FROM man_visited)

SELECT * FROM pizzerias_woman
UNION ALL
SELECT * FROM pizzerias_man
ORDER BY pizzeria_name ASC;