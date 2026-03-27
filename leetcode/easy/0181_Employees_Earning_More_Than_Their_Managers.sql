select name as Employee
from Employee as e
where salary > (select salary from Employee where id = e.managerId)