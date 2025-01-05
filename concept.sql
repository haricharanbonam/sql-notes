--LIMIT IN SQL--
--TO LIMIT USED TO RESTRICT THE ROWS
SELECT name 
FROM occupations
ORDER BY name
LIMIT 3;

--IT CAN GIVE FIRST 3
SELECT name
FROM occupations
WHERE occupation = 'Actor'
ORDER BY name
LIMIT 3;
--with aggregation
SELECT occupation, COUNT(*) AS occupation_count
FROM occupations
GROUP BY occupation
ORDER BY occupation_count DESC
LIMIT 2;
--just added at the end




--OFFSET IN SQL
--SPECIFIES WHERE THE RES SHOULD START FROM SKIPPING SOME ROWA
SELECT name 
FROM occupations
ORDER BY name
LIMIT 3 OFFSET 2;
--SKIPS FIRST 2 AND GIVES NEXT 3
