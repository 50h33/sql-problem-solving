### 문제
- https://school.programmers.co.kr/learn/courses/30/lessons/59042
- https://school.programmers.co.kr/learn/courses/30/lessons/131124
- https://school.programmers.co.kr/learn/courses/30/lessons/276035

### 한 테이블에만 있는 데이터 찾기
- https://school.programmers.co.kr/learn/courses/30/lessons/59042

```sql
from animal_outs as o
left join animal_ins as i
on o.animal_id = i.animal_id
where i.animal_id is null
```

- 위 쿼리는 `animal_outs` 테이블과 `animal_ins` 테이블을 왼쪽 조인하여 `animal_outs` 테이블에만 존재하는 `animal_id`를 찾는 쿼리입니다.
- `i.animal_id is null` 조건을 사용하여 `animal_ins` 테이블에 해당 `animal_id`가 없는 경우를 필터링합니다.

**left join vs right join vs join**

| JOIN 종류    | 기준 테이블 | 없는 값 |
| ---------- | ------ | ---- |
| INNER JOIN | 둘 다 존재 | 제외   |
| LEFT JOIN  | 왼쪽     | NULL |
| RIGHT JOIN | 오른쪽    | NULL |

### 리뷰를 가장 많이 작성한 회원 필터링
- https://school.programmers.co.kr/learn/courses/30/lessons/131124

```sql
where r.member_id = (
    select member_id
    from rest_review
    group by member_id
    order by count(*) desc
    limit 1
)
```

### join의 on 절에서 비트 연산자 사용
- https://school.programmers.co.kr/learn/courses/30/lessons/276035

```sql
select distinct d.id, d.email, d.first_name, d.last_name
from developers as d
join skillcodes as s
on d.skill_code & s.code > 0
where s.category = 'Front End'
order by d.id
```

- 위 쿼리는 `developers` 테이블과 `skillcodes` 테이블을 조인할 때, `skill_code`와 `code`의 비트 연산 결과가 0보다 큰 경우에만 조인하는 조건을 사용한다.
- 이는 개발자의 스킬 코드와 스킬 코드 테이블의 코드가 겹치는 부분이 있는 경우를 찾는 데 사용된다.

**주의할 점**
- 어떤 한 명이 'Front End' 스킬을 여러 개 가지고 있을 수 있기 때문에 `distinct` 키워드를 사용하여 중복된 개발자 정보를 제거해야 한다.

### distinct 키워드, round 함수, subquery 활용
- https://school.programmers.co.kr/learn/courses/30/lessons/131534

```sql
select
    year(o.sales_date) as year,
    month(o.sales_date) as month,
    count(distinct o.user_id) as purchased_users,
    round(
        count(distinct o.user_id) / 
        (
            select count(*)
            from user_info
            where year(joined) = 2021
        ),
        1
        ) as purchased_ratio
```