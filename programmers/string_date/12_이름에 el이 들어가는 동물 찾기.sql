select ANIMAL_ID, NAME
from ANIMAL_INS
where NAME like '%el%' && ANIMAL_TYPE = 'Dog'
order by NAME