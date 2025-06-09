# Use an official Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY app/ ./app/

# Create the upload folder
RUN mkdir -p /app/uploads

# Expose the port
EXPOSE 5000

# Run the app
CMD ["python", "app/script.py"]
