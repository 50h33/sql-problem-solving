select o.ANIMAL_ID, o.NAME
from ANIMAL_OUTS as o
left join ANIMAL_INS as i
on o.ANIMAL_ID = i.ANIMAL_ID
order by datediff(o.DATETIME, i.DATETIME) desc
limit 2