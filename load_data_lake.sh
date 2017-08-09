#!/bin/bash

# save my current directory
MY_CWD=$(pwd)

# remove first line of files and rename

OLD_FILE0="amazonecho.csv"
NEW_FILE0=amazon_echo.csv

tail -n+2 "$OLD_FILE0" >$NEW_FILE0

OLD_FILE1="googlehome.csv"
NEW_FILE1=google_home.csv

tail -n+2 "$OLD_FILE1" >$NEW_FILE1
# create our hfs directory

hdfs dfs -mkdir /user/w205/final
hdfs dfs -mkdir /user/w205/final/amazon
hdfs dfs -mkdir /user/w205/final/google

# copy the files to hdfs

hdfs dfs -put $NEW_FILE0 /user/w205/final/amazon
hdfs dfs -put $NEW_FILE1 /user/w205/final/google

# change directory back to the original

cd $MY_CWD

#clean exit


exit
