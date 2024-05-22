SELECT address, 
       ROUND(MAX(age::numeric) - (MIN(age)/MAX(age::numeric)), 2) as formula, 
       ROUND(AVG(age::numeric), 2) as average,
       (ROUND(MAX(age::numeric) - (MIN(age::numeric)/MAX(age::numeric)), 2) > ROUND(AVG(age::numeric), 2)) as comparison
FROM person
GROUP BY address
ORDER BY address;