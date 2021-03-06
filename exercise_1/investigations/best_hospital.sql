select hospital_name, 
        max(score_adjust) as score_max, 
        sum(score_adjust) as aggregate_score, 
        avg(score_adjust) as avg_score, 
        variance(score_adjust) as variability  
from my_care 
group by hospital_name 
order by score_max 
desc limit 10;
