/*
Please record new visits to Domino's restaurant by Denis and Irina 
on February 24, 2022.

Denied syntax pattern:
Don’t use direct numbers for identifiers of Primary Key and pizzeria
*/

INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES (
        (
            SELECT MAX(id) + 1
            FROM person_visits
        ),
        (
            SELECT id
            FROM person
            WHERE name = 'Denis'
        ),
        (
            SELECT id
            FROM pizzeria
            WHERE name = 'Dominos'
        ),
        '2022-02-24'
    );
    
INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES (
        (
            SELECT MAX(id) + 1
            FROM person_visits
        ),
        (
            SELECT id
            FROM person
            WHERE name = 'Irina'
        ),
        (
            SELECT id
            FROM pizzeria
            WHERE name = 'Dominos'
        ),
        '2022-02-24'
    );