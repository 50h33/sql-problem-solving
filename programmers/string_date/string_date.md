### 문제
- https://school.programmers.co.kr/learn/courses/30/lessons/157342

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