# Use a base image with Python
FROM python:3.13-slim

# Set the working directory
WORKDIR /app

# Install system dependencies (for development purposes)
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements.txt into the container
COPY ./app/requirements.txt /app/

# Install the required dependencies (including dev dependencies)
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files into the container (for live-reloading)
COPY ./app/* /app/

# Expose the port that FastAPI will run on
EXPOSE 8000

# Command to run FastAPI with live-reloading enabled for development
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
