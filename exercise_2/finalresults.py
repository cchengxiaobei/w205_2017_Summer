import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

if len(sys.argv) < 2:
   cur.execute("SELECT word, count from tweetwordcount")	
   records = cur.fetchall()
   print (records)
   conn.commit()
   conn.close()

else:
   word = sys.argv[1] 
  #print word
   cur.execute("SELECT word, count from tweetwordcount WHERE word=%s", (word,))
   count = cur.fetchone()
   if count:
   	print "Total number of occurrences of", word, "is:",count[1]
   else:
   	print "Total number of occurrences of", word, "is:",0
   conn.commit()
   conn.close()
