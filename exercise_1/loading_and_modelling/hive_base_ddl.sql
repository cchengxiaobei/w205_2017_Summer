DROP TABLE hospital;
CREATE EXTERNAL TABLE hospital (ProviderID STRING,
Hosp_Name  STRING,
Address  STRING,
City STRING,
State STRING,
Zip STRING,
County_Name STRING,
Phone_Number STRING,
Hosp_type STRING,
Hosp_ownership  STRING,
Emergency_Service STRING )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospital';
