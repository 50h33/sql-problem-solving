select o.animal_id, o.animal_type, o.name
from animal_outs as o
join animal_ins as i
on o.animal_id = i.animal_id
where i.sex_upon_intake like "intact%" and (o.sex_upon_outcome like "Neutered Male" or o.sex_upon_outcome like "Spayed Female")
order by o.animal_id;
