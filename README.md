# multi-flask-docker

# run locally
docker image build -t api_steer .
docker run -p 5000:5000 -e PORT_MAIN=5000 -d api_steer

# push to docker hub
docker tag api_steer parvudan/multi-flask
docker push parvudan/multi-flask
