DROP TABLE my_readmission;
CREATE  TABLE my_readmission as
SELECT
provider_id,
measure_id,
compared_to_national,
denominator,
cast(score as float) as score,
cast(lower_estimate as float) as lower_estimate,
cast(lower_estimate as float) as higher_estimate,
footnote,
measure_start_date,
measure_end_date
from readmission
where score not like 'Not%'  AND lower_estimate not like 'Not%'  AND higher_estimate not like 'Not%';
