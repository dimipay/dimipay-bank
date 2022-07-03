from simple_bank_korea.kb import get_transactions
from flask import Flask, request, jsonify, Response
from functools import wraps
from dotenv import load_dotenv
import os
import time

load_dotenv()

app = Flask(__name__)

def apiAuthentication(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        access_token = request.headers.get("Authorization").split(" ")[1]
        if access_token is not None:
            if (access_token != os.getenv("API_KEY")):
                return Response(status=401)
        else:
            return Response(status=401)
        return f(*args, **kwargs)
    return decorated_function

@app.route("/", methods=["GET"])
@apiAuthentication
def getTransactions():

    transaction_list = get_transactions(
        bank_num=os.getenv('ACCOUNT_NUM'),
        birthday=os.getenv('BUSINESS_NUM'),
        password=os.getenv('ACCOUNT_PIN'),
        days=1
    )
    return jsonify(transaction_list[:5])

if __name__ == "__main__":
    app.run()