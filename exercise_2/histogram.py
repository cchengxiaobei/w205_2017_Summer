import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

if len(sys.argv) != 3:
   	print "argument is missing"
   	conn.close()
   	exit(0)
else: 
  	k1 = sys.argv[1]
  	k2 = sys.argv[2]
  	cur.execute("SELECT * from tweetwordcount WHERE count between %s AND %s order by count", (k1, k2))
 	records = cur.fetchall()
  	print (records)
   	conn.commit()
   	conn.close()
