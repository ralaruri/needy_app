# needy_app
An iOS app that texts your significant other & blinks an LED on their desk until they give you attention! A fun weekend project 

# Goal: My wife asked me to build her an app that would get her my attetion when I am deep into work on my desk. 


### Tools & Language:
* Python
* Swift
* Ngrok
* Raspbery Pi
* Twilio
* Adobe Illustrator (I design all my logos/uis! I am not a designer but its fun to create them too!)

### Design:
* A web server is hosted on my raspberry pi using a Flask Python Server
* Which then uses ngrok to have a static url in order to send the post/request messages to the server
* Which triggers the twilio API to send a text from my Python Server from the interaction with the iPhone App
* The python server also holds code to that sends a signal to the raspberry pi to bink an LED light I hacked on as a proof of concept.

* The only way to turn off the LED light now is to go in terminal and stop the server not ideal but it works.


## Framework: 

![Framework](Map3.png)

## App Design: 

![App Design](Map3.png)

