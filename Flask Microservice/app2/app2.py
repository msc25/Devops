from flask import Flask,jsonify
import requests

app = Flask(__name__)
@app.route("/")
def hello():
    try:
        response = requests.get('http://localhost:8008/hello')
        data = response.json()
        return jsonify(message="Hello from app2!", app1_message=data['message'])
    except requests.exceptions.RequestException as e:
        return jsonify(message="Failed to connect to app1", error=str(e))

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8005, debug=True)