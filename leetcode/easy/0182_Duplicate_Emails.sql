select email as Email
from Person as a
group by email
having count(*) >= 2;