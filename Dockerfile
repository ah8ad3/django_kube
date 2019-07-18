FROM python:3.6-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Uncomment this when https://github.com/pypa/pipenv/issues/2924 is resolved:
#RUN pip install -r req.txt
#RUN pip install pipenv
#COPY Pipfile /app/
#RUN pipenv install --skip-lock --system --dev

COPY . /app/

RUN pip install -r req.txt

RUN ./manage.py makemigrations 
RUN ./manage.py migrate

CMD python manage.py runserver 0.0.0.0:8000
