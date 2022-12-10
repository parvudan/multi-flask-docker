# start by pulling the python image
FROM python:3.8-alpine
RUN apk add git

# copy the requirements file into the image
COPY ./requirements.txt /app/requirements.txt

# switch working directory
WORKDIR /app

# install the dependencies and packages in the requirements file
RUN pip install -r requirements.txt

ADD https://api.github.com/repos/parvudan/multi-flask/git/refs/heads/v1.0.0 version.json
RUN git clone --branch v1.0.0 https://github.com/parvudan/multi-flask.git v100

ADD https://api.github.com/repos/parvudan/multi-flask/git/refs/heads/v2.0.0 version.json
RUN git clone --branch v2.0.0 https://github.com/parvudan/multi-flask.git v200

COPY my_wrapper_script.sh my_wrapper_script.sh
# copy every content from the local file to the image
COPY . /app

# configure the container to run in an executed manner
CMD ./my_wrapper_script.sh