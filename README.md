Welcome!
This app was made with love by Laura Nadolski and Leann Kim. We are currently (as of June 21, 2018) web development students at the Flatiron School in the big apple.

Description:
Surge Watcher is an app for all you cheap-ass people out there (us included) who want to avoid surge pricing on Lyft. It takes your target ride origin and destination, and gives you a price estimate, along with data about whether or not surge pricing is in effect. You can continue to "ping" (AKA check your ride's rate) to your heart's desire, each time getting a newly updated rate quote. Then, when it's cheap enough for you, you can request the Lyft on your real phone and go on your merry way. Yay!

Some notes:
-Currently, this app only works with "Lyft" standard ride service (e.g. not Lyft Line, not Lyft Lux, not Lyft Plus).
-The ride estimate dollar amounts as displayed in this app are for the maximum price estimates for the ride.
-Sometimes, the Google API this app uses (through the Geocoder Ruby gem) gets overloaded with queries. This will STDOUT an error message, however, ignore this and the program should continue to run as planned thereafter.

Install instructions:
1. Start by creating an account at https://www.lyft.com/developers. You'll need one to get some keys from Lyft's website, with which you'll gain access to Lyft's API.
2. Follow the instructions in the "Managing and Refreshing Lyft API Tokens" section below to get your API all set up.
3. Run the program and enjoy!


Managing and Refreshing Lyft API Tokens:

The Lyft API tokens are only valid for 24 hours, thus if it's been over 24 hours since last refreshing them, you'll have to do so in order to run this app.

(For reference, update the below each time a new client secret is refreshed.)
Our (current) Client ID: A2ihIeNpyuac
Our (current) Client Secret: yT_YZ44OYUPjIU1ksorgLjRb36I4iVeT
Our (current) token: "kcJbbCCZLgd9djD7ZOHz0B7U5g27zQtnkPxh4rQV1w9BCawM/ETrq2uzxug/2v95cVPLLOzEktP6WLx4gd/BGj1PuDRSXI1aB0XmqGxvBleqiKySAZljZ4w="

STEPS
1. Run below code in terminal with existing client ID and *refreshed* client secret (client secret must be refreshed on the Lyft developer's website for this to work):
  curl -X POST -H "Content-Type: application/json" \
       --user "<client_id>:<client_secret>" \
       -d '{"grant_type": "client_credentials", "scope": "public"}' \
       'https://api.lyft.com/oauth/token'
2. The above step will return a token. Retrieve the token and implement it below:
curl --include -X GET -H 'Authorization: bearer <access_token>' \
     'https://api.lyft.com/v1/cost?start_lat=37.7763&start_lng=-122.3918&end_lat=37.7972&end_lng=-122.4533'

3. Now you should be good to use the URL portion of the above in your program (for the next 24 hours at least)!

For reference:
https://developer.lyft.com/v1/reference#availability-ride-estimates
https://developer.lyft.com/docs/authentication#section-client-credentials-2-legged-flow-for-public-endpoints
