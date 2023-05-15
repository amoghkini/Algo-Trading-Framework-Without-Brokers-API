FROM python:3.8

# set current env
ENV HOME /app
WORKDIR /app
COPY . /app

# set app config option
ENV FLASK_DEBUG=0

# set argument vars in docker-run command
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_DEFAULT_REGION
ARG DB_HOST
ARG DB_PORT
ARG DB_USER
ARG DB_PASSWORD
ARG DB_SCHEMA

ENV AWS_ACCESS_KEY_ID $AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY $AWS_SECRET_ACCESS_KEY
ENV AWS_DEFAULT_REGION $AWS_DEFAULT_REGION
ENV DB_HOST $DB_HOST
ENV DB_PORT $DB_PORT
ENV DB_USER $DB_USER
ENV DB_PASSWORD $DB_PASSWORD
ENV DB_SCHEMA $DB_SCHEMA

RUN pip3 install --no-cache-dir -r requirements.txt

WORKDIR /app/src

#CMD ["gunicorn", "-b", "0.0.0.0:5000", "main:app", "--workers=5"]
CMD ["python3", "main.py"]