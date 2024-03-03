# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Install the Python dependencies
RUN pip install cmind

# Copy the Python script to the working directory
COPY script.py .

# Run the Python script when the container starts
CMD ["python", "script.py"]