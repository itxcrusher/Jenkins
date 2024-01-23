from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return '<br><center><h1>Flask Application using Jenkins pipeline!</h1></center>'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)