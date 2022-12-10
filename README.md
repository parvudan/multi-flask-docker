# multi-flask-docker
A steering flask app sends requests to two other flask apps running in the same container
The two supporting flask apps are versions of the same script, which are pulled from github dynamically

## run locally
```bash
docker image build -t api_steer .
docker run -p 5000:5000 -e PORT_MAIN=5000 -d api_steer
```

## push to docker hub
```bash
docker tag api_steer parvudan/multi-flask
docker push parvudan/multi-flask
```
