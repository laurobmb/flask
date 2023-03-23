#FROM python:3.10-slim
FROM registry.access.redhat.com/ubi8/python-38
LABEL maintainer="Lauro Gomes <laurobmb@gmail.com>"
USER 0
WORKDIR /app
COPY ["app.py", "requirements.txt", "."]
RUN chown -R 1001:0 ./
USER 1001
RUN python -m pip install -r requirements.txt 
EXPOSE 8080
CMD python app.py
