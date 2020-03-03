from flask import Flask, request

from twilio.rest import Client

app = Flask(__name__)

# put your own credentials here
ACCOUNT_SID = 'your_account_sid'
AUTH_TOKEN = 'your_auth_token'

client = Client(ACCOUNT_SID, AUTH_TOKEN)

@app.route('/sms', methods=['POST'])
def send_sms():
    message = client.messages.create(
        to=request.form['To'],
        from_='twilio_number', 
        body=request.form['Body'],
    )

    return message.sid



if __name__ == '__main__':
        app.run()


./ngrok http 5000  -subdomain=needyapp
