INSERT INTO coaches(first_name, last_name, salary, coach_level)
SELECT
first_name,
last_name,
salary = salary * 2 AS salary,
LENGTH(first_name) AS coach_level
FROM players
WHERE age>= 45;
