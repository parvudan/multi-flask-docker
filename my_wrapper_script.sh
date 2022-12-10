export PORT_MAIN="${PORT_MAIN:-6001}"
export PORT_V100="${PORT_V100:-6002}"
export PORT_V200="${PORT_V200:-6003}"

# Start the primary process and put it in the background
python main.py &

# Start the helper process
export PORT=$PORT_V100
python v100/app.py &

export PORT=$PORT_V200
python v200/app.py
