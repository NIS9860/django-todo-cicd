#!/bin/bash

python /d1/d11/manage.py makemigrations

python /d1/d11/manage.py migrate

python /d1/d11/manage.py runserver 0.0.0.0:8000
