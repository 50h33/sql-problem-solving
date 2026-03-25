### 문제
- https://school.programmers.co.kr/learn/courses/30/lessons/276036

### 비트 연산 결과 > 0
- https://school.programmers.co.kr/learn/courses/30/lessons/276036

```sql
SKILL_CODE & (select sum(CODE) from SKILLCODES where CATEGORY = 'Front End') > 0
```
- 비트 연산 결과가 딱 1이 되지 않을 수 있기 때문에, 0보다 큰지로 체크하는 것이 좋습니다.

### 서브쿼리가 1개 이상 반환하지 않도록 sum을 활용하자
- https://school.programmers.co.kr/learn/courses/30/lessons/276036

```sql
SKILL_CODE & (select sum(CODE) from SKILLCODES where CATEGORY = 'Front End') > 0
```

- SKILLCODES 테이블에서 CATEGORY가 'Front End'인 행이 여러 개일 수 있기 때문에, sum 함수를 사용하여 하나의 값으로 만들어주는 것이 좋습니다. 이렇게 하면 서브쿼리가 1개 이상의 값을 반환하는 문제를 방지할 수 있습니다.

### from 절에 select 서브 쿼리를 활용할 때
- https://school.programmers.co.kr/learn/courses/30/lessons/276036

```sql
select GRADE, ID, EMAIL
from (select
        case
            when SKILL_CODE & (select sum(CODE) from SKILLCODES where CATEGORY = 'Front End') > 0
                and SKILL_CODE & (select CODE from SKILLCODES where NAME = 'Python') > 0 then 'A'
            when SKILL_CODE & (select CODE from SKILLCODES where NAME = 'C#') > 0 then 'B'
            when SKILL_CODE & (select sum(CODE) from SKILLCODES where CATEGORY = 'Front End') > 0 then 'C'
        end as GRADE,
        ID, EMAIL
    from DEVELOPERS) as d
where GRADE is not null
order by GRADE, ID
```

- sql은 내부적으로 FROM → WHERE → SELECT → ORDER BY 순으로 진행된다.
- `where GRADE is not null` 이라고 쓰려면 from 절에 select 서브 쿼리를 활용하여 GRADE 컬럼을 만들어야 한다. 그렇지 않으면 외부 쿼리에서 GRADE 컬럼을 인식할 수 없기 때문에 SQL 문법 오류가 발생한다.
- from 절에 select 서브 쿼리를 활용할 때, 서브 쿼리에서 필요한 컬럼들을 모두 선택하여 외부 쿼리에서 사용할 수 있도록 해야 합니다. 이렇게 하면 외부 쿼리에서 GRADE, ID, EMAIL 등의 컬럼을 사용할 수 있습니다. 또한, 서브 쿼리에서 GRADE를 계산하여 외부 쿼리에서 필터링할 수 있도록 하는 것이 좋습니다.
- from 절에 select 서브 쿼리를 작성한 후에 꼭 별칭을 붙여야 한다. 그렇지 않으면 SQL 문법 오류가 발생한다. 예시에서는 as d로 별칭을 붙였다.