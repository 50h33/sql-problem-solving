select h.HISTORY_ID,
    round((datediff(h.END_DATE, h.START_DATE) + 1) * c.DAILY_FEE * (100 - IFNULL(p.DISCOUNT_RATE, 0)) / 100) as FEE
from CAR_RENTAL_COMPANY_RENTAL_HISTORY as h
join CAR_RENTAL_COMPANY_CAR as c on h.CAR_ID = c.CAR_ID
left join CAR_RENTAL_COMPANY_DISCOUNT_PLAN as p on c.CAR_TYPE = p.CAR_TYPE and
    p.DURATION_TYPE =  case 
                            when datediff(h.END_DATE, h.START_DATE) + 1 >= 90 then '90일 이상'
                            when datediff(h.END_DATE, h.START_DATE) + 1 >= 30 then '30일 이상'
                            when datediff(h.END_DATE, h.START_DATE) + 1 >= 7 then '7일 이상'
                        end
where c.CAR_TYPE = '트럭'
group by h.HISTORY_ID
order by FEE desc, h.HISTORY_ID desc