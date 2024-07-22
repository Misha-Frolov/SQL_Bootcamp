/*
Find the names of people who live at the same address. 
Make sure the result is sorted by 1st person's name, 
2nd person's name, and shared address.
*/

SELECT p1.name AS person_name1,
       p2.name AS person_name2,
       p1.address AS common_address
FROM person p1
JOIN person p2 ON p1.address = p2.address
AND p1.id > p2.id
ORDER BY 1, 2, 3;