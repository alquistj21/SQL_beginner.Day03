INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT generate_series (MAX(person_order.id + 1), MAX(person_order.id) + MAX(person.id)) AS id,
generate_series (1, MAX(person.id)) AS person_id,
(SELECT menu.id FROM menu WHERE pizza_name = 'greek pizza'),
CAST('2022-02-25' AS DATE) AS order_date
FROM person ASC, person_order ASC;