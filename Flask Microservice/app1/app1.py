from flask import Flask,jsonify
app = Flask(__name__)
@app.route("/hello")
def helloworld():
    return jsonify(message="Hello World from app1!")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8008, debug=True)