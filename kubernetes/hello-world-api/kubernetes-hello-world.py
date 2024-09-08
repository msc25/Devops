from flask import Flask,jsonify
app = Flask(__name__)

@app.route("/")
def upandrunning():
    return jsonify(message="Healty:true")

@app.route("/hello")
def helloworld():
    return jsonify(message="Hello World")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8008, debug=True)