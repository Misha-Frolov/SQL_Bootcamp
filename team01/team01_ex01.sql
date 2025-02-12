SELECT COALESCE(u.name, 'not defined') AS name,
  COALESCE(u.lastname, 'not defined') AS lastname,
  cur.name AS currency_name,
  bal.money * COALESCE(
    (
      SELECT rate_to_usd
      FROM currency c
      WHERE bal.currency_id = c.id
        AND c.updated < bal.updated
      ORDER BY c.updated DESC
      LIMIT 1
    ), (
      SELECT rate_to_usd
      FROM currency c
      WHERE bal.currency_id = c.id
        AND c.updated > bal.updated
      ORDER BY c.updated
      LIMIT 1
    )
  ) AS currency_in_usd
FROM balance bal
  LEFT JOIN "user" u ON bal.user_id = u.id
  JOIN currency cur ON bal.currency_id = cur.id
WHERE cur.updated = (
    SELECT MAX(updated)
    FROM currency
    WHERE id = bal.currency_id
  )
ORDER BY name DESC,
  lastname,
  currency_name;