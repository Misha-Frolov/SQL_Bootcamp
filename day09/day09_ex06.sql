CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
        pperson VARCHAR DEFAULT 'Dmitriy',
        pprice NUMERIC DEFAULT 500,
        pdate DATE DEFAULT '2022-01-08'
    ) RETURNS TABLE (pizzeria_name VARCHAR) AS $$ BEGIN RETURN QUERY
SELECT p.name AS pizzeria_name
FROM person_visits pv
    JOIN pizzeria p ON pv.pizzeria_id = p.id
    JOIN person pe ON pv.person_id = pe.id
    JOIN menu m ON m.pizzeria_id = p.id
WHERE pe.name = pperson
    AND m.price < pprice
    AND visit_date = pdate
GROUP BY p.name;
END;
$$ LANGUAGE plpgsql;