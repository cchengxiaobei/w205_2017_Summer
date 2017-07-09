DROP TABLE my_hospital;
CREATE  TABLE my_hospital as
SELECT 
provider_id ,
hospital_name  ,
address  ,
city ,
state ,
zip_code ,
county_name,
hospital_type,
emergency_services,
cast(hospital_overall_rating as decimal(1,0)) rating
FROM hospital
where hospital_overall_rating not like 'Not%'
;
