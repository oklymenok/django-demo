# Use a lightweight official Python image as the base
FROM python:3.13.7-slim

# Set environment variables to optimize Python performance and logging
# PYTHONDONTWRITEBYTECODE=1: Prevents Python from writing .pyc files (saves space)
# PYTHONUNBUFFERED=1: Ensures stdout/stderr are unbuffered (logs appear immediately)
#ENV PYTHONDONTWRITEBYTECODE=1
#ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Copy the dependency file and install Python packages
# This step is crucial for Docker caching: if requirements.txt doesn't change,
# this layer (and all subsequent layers) won't need to be rebuilt.
COPY requirements.txt /app/
COPY quote /app/quote
COPY demo /app/demo
COPY urls.py /app/
COPY manage.py /app/
RUN pip install --no-cache-dir -r /app/requirements.txt

# Expose the port that Django's built-in server runs on
EXPOSE 8000

# Run the Django development server as the main process.
# We bind it to 0.0.0.0 so it's accessible outside the container.
# NOTE: This command is for DEVELOPMENT ONLY. For production, you should use
# a dedicated WSGI server like Gunicorn or uWSGI.
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

