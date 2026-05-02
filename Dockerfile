# Dockerfile
FROM python:3.12-slim

WORKDIR /app

# install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy project
COPY . .

# collect static
RUN python manage.py collectstatic --noinput

# run app
CMD ["gunicorn", "Calories_cal.wsgi:application", "--bind", "0.0.0.0:8000"]
