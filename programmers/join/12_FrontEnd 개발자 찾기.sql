select distinct d.id, d.email, d.first_name, d.last_name
from developers as d
join skillcodes as s
on d.skill_code & s.code > 0
where s.category = 'Front End'
order by d.id