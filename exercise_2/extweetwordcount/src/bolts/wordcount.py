from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2


class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

    def process(self, tup):
        word = tup.values[0]

        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount 
        # Table name: Tweetwordcount 
        # you need to create both the database and the table in advance.
        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
#conn.close()        
        #cur = conn.cursor()
        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])
 #       conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        cur = conn.cursor()
        
       # if self.counts[word] > 1: 
        cur.execute("UPDATE tweetwordcount SET count=count+1 WHERE word=%s", (word,))
       # print "number of updated rows", cur.rowcount
        # conn.commit()

        if self.counts[word]==1:
               cur.execute("INSERT INTO tweetwordcount (word,count) VALUES (%s, 1)",(word,))
        #	self.log('new')
        conn.commit() 
         #      cur.execute("UPDATE tweetwordcount SET count=count+1 WHERE word=%s", (word,))
       # print "number of updated rows", cur.rowcount

        #self.emit([word, self.counts[word]])
        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
  	
	conn.close()
