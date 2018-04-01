FROM continuumio/miniconda3

RUN apt-get update -y -qq && apt-get install -y libpq-dev g++ bash

COPY requirements.txt .

RUN pip install -r requirements.txt

ENV APP_SETTINGS config.ProductionConfig
ENV DATABASE_URL postgresql://postgres:mypass@postgres/postgres
ENV FLASK_APP=app.py

WORKDIR /app

EXPOSE 5000
CMD ["bash", "./up.sh"]
