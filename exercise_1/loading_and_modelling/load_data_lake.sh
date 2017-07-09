#!/bin/bash

# save my current directory
MY_CWD=$(pwd)

# creating staging directories
mkdir ~/staging
mkdir ~/staging/exercise_1

# change to staging directory
cd ~/staging/exercise_1

# get file from data.medicare.gov
MY_URL="https://data.medicare.gov/views/bg9k-emty/files/0a9879e0-3312-4719-a1db-39fd114890f1?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget "$MY_URL" -O medicare_data.zip

# unzip the medicare data
unzip medicare_data.zip

# remove first line of files and rename

OLD_FILE0="Hospital General Information.csv"
NEW_FILE0="hospitals.csv"

tail -n+2 "$OLD_FILE0" >$NEW_FILE0

OLD_FILE1="Timely and Effective Care - Hospital.csv"
NEW_FILE1="effective_care.csv"

tail -n+2 "$OLD_FILE1" >$NEW_FILE1

OLD_FILE2="Readmissions and Deaths - Hospital.csv"
NEW_FILE2="readmissions.csv"

tail -n+2 "$OLD_FILE2" >$NEW_FILE2

OLD_FILE3="Measure Dates.csv"
NEW_FILE3="Measures.csv"

tail -n+2 "$OLD_FILE3" >$NEW_FILE3

OLD_FILE4="hvbp_hcahps_11_10_2016.csv"
NEW_FILE4="surveys_responses.csv"

tail -n+2 "$OLD_FILE4" >$NEW_FILE4

# create our hfs directory

hdfs dfs -mkdir /user/w205/hospital_compare
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/Measures
hdfs dfs -mkdir /user/w205/hospital_compare/surveys_responses

# copy the files to hdfs

hdfs dfs -put $NEW_FILE0 /user/w205/hospital_compare/hospitals
hdfs dfs -put $NEW_FILE1 /user/w205/hospital_compare/effective_care
hdfs dfs -put $NEW_FILE2 /user/w205/hospital_compare/readmissions
hdfs dfs -put $NEW_FILE3 /user/w205/hospital_compare/Measures
hdfs dfs -put $NEW_FILE4 /user/w205/hospital_compare/surveys_responses

# change directory back to the original

cd $MY_CWD

#clean exit

exit
