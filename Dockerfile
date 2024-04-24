# Use the official Python image as a base
FROM python:3.10

# Set environment variables to optimize Python environment
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt .

# Upgrade pip and install dependencies
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

# Copy the application code into the container
COPY . .

# Add execute permission to the entry script
RUN chmod +x /app/django.sh

# Expose port 8000 for the Django application
EXPOSE 8000

# Set the entry point for the container
ENTRYPOINT ["/app/django.sh"]

# Default command to run the Django application
CMD ["/opt/venv/bin/python", "app.py"]
