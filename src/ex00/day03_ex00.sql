SELECT DISTINCT pizza_name, price, name AS pizzeria_name, visit_date
FROM pizzeria
INNER JOIN menu ON menu.pizzeria_id = pizzeria.id
INNER JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
WHERE person_id = (SELECT id FROM person WHERE name = 'Kate') AND price BETWEEN 800 AND 1000
ORDER BY pizza_name ASC, price ASC, pizzeria_name ASC;