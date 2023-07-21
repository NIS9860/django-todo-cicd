FROM python:3

WORKDIR /app/lastend

COPY requirements.txt /app/lastend

RUN pip install -r requirements.txt

COPY . /app/frontend

expose 8000

RUN python manage.py migrate

CMD python /app/lastend/manage.py runserver 0.0.0.0:8000
