FROM python:3

WORKDIR /app/frontend

COPY requirements.txt /app/frontend

RUN pip install -r requirements.txt

COPY . /app/frontend

expose 8000

RUN python manage.py migrate

CMD python /app/frontend/manage.py runserver 0.0.0.0:8000
