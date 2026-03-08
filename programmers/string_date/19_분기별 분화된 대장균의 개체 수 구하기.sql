select
    concat(quarter(DIFFERENTIATION_DATE), 'Q') as QUARTER,
    count(*) as ECOLI_COUNT
from ECOLI_DATA
group by concat(quarter(DIFFERENTIATION_DATE), 'Q')
order by QUARTER;