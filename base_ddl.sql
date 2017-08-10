DROP TABLE amazonecho;
CREATE EXTERNAL TABLE amazonecho (
twitterID string,
text string,
retweet_count int,
favorite_count int,
created_at string,
location string,
source string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/final/amazon';

DROP TABLE googlehome;
CREATE EXTERNAL TABLE googlehome (
twitterID string,
text string,
retweet_count int,
favorite_count int,
created_at string,
location string,
source string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/final/google';
