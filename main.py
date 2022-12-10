from flask import Flask, Response
import requests
import os

app = Flask(__name__)

PORT_MAIN = int(os.environ.get('PORT_MAIN'))
PORT_V100 = int(os.environ.get('PORT_V100'))
PORT_V200 = int(os.environ.get('PORT_V200'))


@app.route('/')
def home():
    return "app_steer is running"


@app.route('/api/<version>')
def api_redirect(version):
    if version == "v1.0.0":
        return requests.get(f"http://localhost:{PORT_V100}/api/v1.0.0").text

    elif version == "v2.0.0":
        return requests.get(f"http://localhost:{PORT_V200}/api/v2.0.0").text

    else:
        return Response(f"Unknown api version {version}", status=400)


if __name__ == "__main__":
    app.logger.info(f"Running on port {PORT_MAIN}")
    app.run(debug=True, host='0.0.0.0', port=PORT_MAIN)

