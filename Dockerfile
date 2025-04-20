FROM python:3.11-slim

WORKDIR /app

# Copy only necessary files
COPY requirements.txt .
COPY manage.py .
COPY myapp/ myapp/

RUN pip install -r requirements.txt

ENV PYTHONUNBUFFERED=1
ENV DJANGO_SETTINGS_MODULE=myapp.settings

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]