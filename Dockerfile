# Use the official Python image as a base
FROM python:3.10

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY requirements.txt .

# Create a virtual environment and activate it
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

COPY . .
RUN chmod +x /app/django.sh



EXPOSE 8000

ENTRYPOINT ["/app/django.sh"]

# Run the Flask application
CMD ["/opt/venv/bin/python", "app.py"]
