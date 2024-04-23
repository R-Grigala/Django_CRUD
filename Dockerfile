# Use the official Python image as a base
FROM python:3.10

# Set environment variables
ENV PYTHONUNBUFFERED 1


# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Create a virtual environment and activate it
RUN python -m venv /opt/venv
RUN /opt/venv/bin/pip install --upgrade pip
RUN /opt/venv/bin/pip install -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["/app/django.sh"]

# Run the Flask application
CMD ["/opt/venv/bin/python", "app.py"]
