FROM python:3.8-slim

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

ENV PORT 5000
EXPOSE 5000

CMD ["gunicorn", "-b", "0.0.0.0:$PORT", "model:app"]
