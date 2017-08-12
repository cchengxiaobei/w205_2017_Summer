import tweepy

consumer_key = "8s7EjZ9nF5v3iPTPAHeA8ee7q";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "n98dQKzrxiEWM0NGe3oLndH3crSlvmwJ761iR37dRtWvKKtK36";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "885283187349372930-4D8hizVG8lXmBNUOuMIcIjHgEGdFOHe";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "Y9BqiU1mULFyA29ROw6VxOjvdON29O9NHqeMxYyRAkbEc";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



