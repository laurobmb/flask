FROM python:3.9-slim
RUN useradd -m -u 1001 flaskuser
WORKDIR /app
COPY . /app
RUN chown -R flaskuser:flaskuser /app
USER 1001
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8080
ENV MESSAGE="test"
CMD ["python", "app.py"]
