/*
Let's refresh the data in our Materialized View mv_dmitriy_visits_and_eats 
from Exercise #06. Before this action, please create another Dmitriy visit 
that satisfies the SQL clause of the Materialized View except pizzeria, 
which we can see in a result from Exercise #06.
After adding a new visit, please update a data state for mv_dmitriy_visits_and_eats.

Denied syntax pattern:
Don’t use direct numbers for identifiers of Primary Key, person and pizzeria
*/

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
    (
      SELECT MAX(id) + 1
      FROM person_visits
    ),
    (
      SELECT id
      FROM person
      WHERE name = 'Dmitriy'
    ),
    (
      SELECT pizzeria.id
      FROM pizzeria
        JOIN menu ON menu.pizzeria_id = pizzeria.id
      WHERE name != 'Papa Johns'
        AND price < 800
      ORDER BY RANDOM()
      LIMIT 1
    ), '2022-01-08'
  );
  
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;