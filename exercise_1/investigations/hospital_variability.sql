select hospital_name, 
variance(score_adjust) as variability 
from my_care 
group by hospital_name 
order by variability desc 
limit 10;
