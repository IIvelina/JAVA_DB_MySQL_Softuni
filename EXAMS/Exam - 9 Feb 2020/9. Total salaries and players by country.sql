SELECT c.name AS name, COUNT(p.id) AS total_count_of_players,
SUM(p.salary) AS total_sum_of_salaries
FROM players AS p
RIGHT JOIN teams AS te ON p.team_id = te.id
 JOIN stadiums AS st ON te.stadium_id = st.id
 JOIN towns AS t ON st.town_id = t.id
RIGHT JOIN countries AS c ON t.country_id = c.id
GROUP BY name
ORDER BY total_count_of_players DESC, name;