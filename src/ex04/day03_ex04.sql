WITH
woman_visited AS (SELECT pizzeria.name AS pizzeria_name
FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id                  
WHERE person.gender = 'female'
ORDER BY pizzeria_name ASC),

man_visited AS (SELECT pizzeria.name AS pizzeria_name
FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE person.gender = 'male'
ORDER BY pizzeria_name ASC),

pizzerias_man AS (SELECT * FROM man_visited EXCEPT SELECT * FROM woman_visited),
pizzerias_woman AS (SELECT * FROM woman_visited EXCEPT SELECT * FROM man_visited)

SELECT * FROM pizzerias_woman
UNION ALL
SELECT * FROM pizzerias_man
ORDER BY pizzeria_name ASC;