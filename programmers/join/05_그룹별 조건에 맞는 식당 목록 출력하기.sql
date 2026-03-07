select m.member_name, r.review_text, date_format(r.review_date, "%Y-%m-%d")
from rest_review as r
join member_profile as m
on r.member_id = m.member_id
where r.member_id = (
    select member_id
    from rest_review
    group by member_id
    order by count(*) desc
    limit 1
)
order by r.review_date, r.review_text;