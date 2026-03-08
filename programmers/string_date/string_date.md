### 문제
- https://school.programmers.co.kr/learn/courses/30/lessons/157342
- https://school.programmers.co.kr/learn/courses/30/lessons/59046
- https://school.programmers.co.kr/learn/courses/30/lessons/59409
- https://school.programmers.co.kr/learn/courses/30/lessons/131529
- https://school.programmers.co.kr/learn/courses/30/lessons/284530
- https://school.programmers.co.kr/learn/courses/30/lessons/299308
- https://school.programmers.co.kr/learn/courses/30/lessons/131113

### datediff(END_DATE, START_DATE)
- https://school.programmers.co.kr/learn/courses/30/lessons/157342
- 날짜1과 날짜2의 차이를 일 단위로 반환하는 함수입니다. 날짜는 "YYYY.MM.DD" 형식의 문자열로 주어집니다.

### 평균 대여 기간이 7일 이상이어야 할 때
- https://school.programmers.co.kr/learn/courses/30/lessons/157342
- `avg(datediff(END_DATE, START_DATE) + 1) >= 7` 와 같이 `+ 1`을 추가하여 대여 기간을 계산해야 합니다. 이는 대여 시작일과 종료일 모두를 포함하기 때문입니다.

### 자동차 ID 별로 평균 대여 기간에 대해서 필터링해야 할 때
- https://school.programmers.co.kr/learn/courses/30/lessons/157342

```sql
group by CAR_ID
having avg(datediff(END_DATE, START_DATE) + 1) >= 7
```

- where이 아니라 having 절을 사용하여 그룹화된 결과에 대한 조건을 지정해야 합니다.

### 문자열은 ''로 감싸야 한다.
- https://school.programmers.co.kr/learn/courses/30/lessons/59046

```sql
where name in ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty')
```

- 문자열을 비교할 때는 작은따옴표('')로 감싸야 합니다. 큰따옴표("")는 일반적으로 식별자(예: 테이블 이름, 컬럼 이름)를 감쌀 때 사용됩니다.

### 작은 따옴표 vs 큰 따옴표 vs 백틱
- https://school.programmers.co.kr/learn/courses/30/lessons/59046
- https://school.programmers.co.kr/learn/courses/30/lessons/284530
- 문자열 → ' ' (작은 따옴표) 사용
  - 큰 따옴표도 MySQL에서 문자열을 감싸는 데 사용할 수 있지만, 일반적으로 SQL 표준에서는 작은 따옴표를 사용하여 문자열을 감싸는 것이 권장됩니다.
- 테이블명, 컬럼명 같은 식별자를 감쌀 때 → ` ` (백틱) 사용
  - 예약어와 충돌할 때
  - 컬럼 이름에 특수문자 / . / 공백 → 예) `PM2.5`
  - 대소문자 유지

### like vs in
- https://school.programmers.co.kr/learn/courses/30/lessons/59409
- LIKE : 패턴 매칭
- IN : 정확한 값 비교

### SUBSTRING(문자열, 시작위치, 길이)
- https://school.programmers.co.kr/learn/courses/30/lessons/131529
  
```sql
substring(PRODUCT_CODE, 1, 2)
```

### & vs && vs AND
- https://school.programmers.co.kr/learn/courses/30/lessons/284530

| 연산자   | 의미     | 사용 목적 |
| ----- | ------ | ----- |
| `&`   | 비트 AND | 비트마스크 |
| `&&`  | 논리 AND | 조건식   |
| `AND` | 논리 AND | 조건식   |

- `&`는 비트 연산자로, 두 숫자의 각 비트를 비교하여 둘 다 1인 경우에만 1을 반환합니다. 주로 비트마스크 연산에 사용됩니다.
- `&&`와 `AND`는 모두 논리 연산자로, 조건식에서 사용됩니다. MySQL에서는 `AND`가 더 일반적으로 사용되며, `&&`도 동일한 기능을 수행하지만 가독성 측면에서 `AND`를 사용하는 것이 권장됩니다.

### QUARTER(날짜)
- https://school.programmers.co.kr/learn/courses/30/lessons/299308
- `QUARTER()` 함수는 주어진 날짜가 속한 분기를 반환합니다. 반환값은 1, 2, 3, 4 중 하나입니다.

### only full group by
- https://school.programmers.co.kr/learn/courses/30/lessons/299308
- MySQL에서 `ONLY_FULL_GROUP_BY` 모드는 `GROUP BY` 절에서 명시적으로 그룹화된 열만 선택할 수 있도록 강제하는 SQL 모드입니다. 이 모드가 활성화되어 있으면, `GROUP BY` 절에 포함되지 않은 열을 `SELECT` 절에서 사용할 때 오류가 발생합니다. 따라서, `GROUP BY` 절에 모든 선택된 열을 포함하거나 집계 함수를 사용하여야 합니다.

```sql
select concat(quarter(DIFFERENTIATION_DATE), 'Q') as QUARTER
from ECOLI_DATA
group by concat(quarter(DIFFERENTIATION_DATE), 'Q')
```

- 위와 같이 `GROUP BY` 절에 `concat(quarter(DIFFERENTIATION_DATE), 'Q')`를 포함하여 그룹화된 열을 명시적으로 지정해야 합니다.

```sql
select concat(quarter(DIFFERENTIATION_DATE), 'Q') as QUARTER
from ECOLI_DATA
group by quarter(DIFFERENTIATION_DATE)
```

- 위와 같이 `GROUP BY` 절에 `quarter(DIFFERENTIATION_DATE)`만을 포함하는 경우 오류가 발생할 수 있습니다. 따라서, `GROUP BY` 절에 `concat(quarter(DIFFERENTIATION_DATE), 'Q')`를 포함하여 그룹화된 열을 명시적으로 지정해야 합니다.

### case when then else end
- https://school.programmers.co.kr/learn/courses/30/lessons/131113
- when 절을 여러 번 사용하여 여러 조건을 처리할 수 있습니다.

```sql
case
    when OUT_DATE <= '2022-05-01' then '출고완료'
    when OUT_DATE is null then '출고미정'
    else '출고대기'
end as 출고여부
```

### 주어진 날짜가 '년-월-일' 형태이고, 출력 형태도 '년-월-일' 형태로 유지해야 할 때
- https://school.programmers.co.kr/learn/courses/30/lessons/131113

```sql
date_format(OUT_DATE, '%Y-%m-%d') as OUT_DATE
```

- `DATE_FORMAT()` 함수를 사용하여 날짜를 원하는 형식으로 출력할 수 있습니다. 위 예시에서는 '년-월-일' 형태로 출력하도록 지정하였습니다.
- `DATE_FORMAT()` 함수를 사용하지 않으면 '시:분:초'가 포함된 형태로 출력될 수 있습니다.