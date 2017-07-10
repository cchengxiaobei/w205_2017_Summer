select temp1.hospital_name, avg_score, hcahps from
(select hospital_name, avg(hcahps_base_score) as hcahps from my_surveys_response group by hospital_name) as temp2
join (select hospital_name, avg(score) as avg_score from my_care group by hospital_name) as temp1 on temp1.hospital_name = temp2.hospital_name order by avg_score desc limit 10;

select corr(avg_score, hcahps) from
(select hospital_name, avg(hcahps_base_score) as hcahps from my_surveys_response group by hospital_name) as temp2
join (select hospital_name, avg(score) as avg_score from my_care group by hospital_name) as temp1 on temp1.hospital_name = temp2.hospital_name;
