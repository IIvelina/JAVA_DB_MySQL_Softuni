SELECT MAX(sd.speed) AS 'max_speed', t.name AS 'town_name'
FROM players AS p
JOIN skills_data AS sd ON p.skills_data_id = sd.id
RIGHT JOIN teams AS te ON p.team_id = te.id
JOIN stadiums AS st ON te.stadium_id = st.id
JOIN towns AS t ON st.town_id = t.id
WHERE te.name != 'Devify'
GROUP BY t.name
ORDER BY max_speed DESC, town_name;
