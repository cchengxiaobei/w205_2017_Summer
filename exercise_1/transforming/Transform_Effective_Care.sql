DROP TABLE my_care;
CREATE  TABLE my_care as
SELECT 
provider_id,
hospital_name,
condition,
measure_id,
score,
sample,
footnote,
measure_start_date,
measure_end_date,
case   
when score='Low (0 - 19,999 patients annually)' then 1
when score='Medium (20,000 - 39,999 patients annually)' then 333
when score='High (40,000 - 59,999 patients annually)' then 666
when score='Very High (60,000+ patients annually)' then 999
ELSE cast(score as float) END score_adjust
from effective_care
where score not like 'Not%';
