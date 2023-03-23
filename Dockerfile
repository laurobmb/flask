FROM python:3.10-slim
LABEL maintainer="Lauro Gomes <laurobmb@gmail.com>"
WORKDIR /app
COPY . .
RUN python -m pip install -r requirements.txt 
EXPOSE 8080
CMD [ "python", "app.py" ]
