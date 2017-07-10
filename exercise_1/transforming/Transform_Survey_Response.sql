DROP TABLE my_surveys_response;
CREATE  TABLE my_surveys_response as
SELECT 
provider_number,
hospital_name,
hcahps_base_score,
hcahps_consistency_score
FROM surveys_response;
