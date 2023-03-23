#FROM python:3.10-slim
#FROM registry.access.redhat.com/ubi8/python-38
#LABEL maintainer="Lauro Gomes <laurobmb@gmail.com>"
#USER 0
#WORKDIR /app
#COPY . .
#RUN chown -R 1001:0 ./
#USER 1001
#RUN python -m pip install -r requirements.txt 
#EXPOSE 8080
#CMD python app.py


FROM alpine:latest
RUN apk add --no-cache py3-pip \
    && pip3 install --upgrade pip

WORKDIR /app
COPY . /app

RUN pip3 --no-cache-dir install -r requirements.txt

EXPOSE 8080

ENTRYPOINT ["python3"]
CMD ["app.py"]