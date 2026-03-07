### 문제
- https://school.programmers.co.kr/learn/courses/30/lessons/59042

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
