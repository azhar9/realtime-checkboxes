# Use a base image with Python
FROM python:3.13-slim

# Set the working directory
WORKDIR /app

# Copy requirements.txt into the container
COPY ../app/requirements.txt /app/

# Install the required dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files into the container
COPY ../app/* /app/

# Expose the port that FastAPI will run on
EXPOSE 8000

# Start the FastAPI application with Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
