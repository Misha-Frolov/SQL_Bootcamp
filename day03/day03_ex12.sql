/*
Please register new orders of all persons for "greek pizza" on February 25, 2022.
Please use “insert-select” pattern

Denied syntax patten:
Don’t use direct numbers for identifiers of Primary Key, and menu.
Don’t use window functions like ROW_NUMBER( ).
Don’t use atomic INSERT statements.
*/

INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT generate_series(
        MAX(person_order.id + 1),
        MAX(person_order.id) + MAX(person.id)
    ) AS id,
    generate_series(1, MAX(person.id)) AS person_id,
    (
        SELECT id
        FROM menu
        WHERE pizza_name = 'greek pizza'
    ) AS menu_id,
    '2022-02-25'::DATE AS order_date
FROM person_order,
    person;