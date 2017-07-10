select state, 
avg(rating) as rating 
from my_hospital 
group by state 
order by rating desc 
limit 10; 
