### 문제
* https://leetcode.com/problems/delete-duplicate-emails/

### 조건에 맞는 행을 삭제하는 방법
* https://leetcode.com/problems/delete-duplicate-emails/

```sql
delete p1
from Person as p1
join Person as p2
on p1.email = p2.email
and p1.id > p2.id;
```

* delete 문에서 join을 활용하여 조건에 맞는 행을 삭제할 수 있습니다.
* 위 예시에서는 Person 테이블을 p1과 p2로 조인하여, 이메일이 같은 행 중에서 id가 더 큰 행을 삭제하는 쿼리를 작성하였습니다.
* 이렇게 하면 중복된 이메일을 가진 행 중에서 하나만 남기고 나머지를 삭제할 수 있습니다.