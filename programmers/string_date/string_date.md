### 문제
- https://school.programmers.co.kr/learn/courses/30/lessons/157342
- https://school.programmers.co.kr/learn/courses/30/lessons/59046
- https://school.programmers.co.kr/learn/courses/30/lessons/59409

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
- 문자열 → ' ' (작은 따옴표) 사용
  - 큰 따옴표도 MySQL에서 문자열을 감싸는 데 사용할 수 있지만, 일반적으로 SQL 표준에서는 작은 따옴표를 사용하여 문자열을 감싸는 것이 권장됩니다.
- 테이블명, 컬럼명 같은 식별자를 감쌀 때 → ` ` (백틱) 사용
  - 예약어와 충돌할 때
  - 컬럼 이름에 특수문자 / 공백
  - 대소문자 유지

### like vs in
- https://school.programmers.co.kr/learn/courses/30/lessons/59409
- LIKE : 패턴 매칭
- IN : 정확한 값 비교