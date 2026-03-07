select p.product_code, p.price * sum(o.sales_amount) as sales
from offline_sale as o
join product as p on p.product_id = o.product_id
group by o.product_id
order by sales desc, p.product_code;