FROM python:3.11-alpine

WORKDIR /app

# Install necessary system dependencies
RUN apk update && apk add --no-cache \
    curl \
    && rm -rf /var/cache/apk/*

# Copy requirements first to leverage Docker cache
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY valyu-mcp.py .

# Command to run the application
CMD ["python", "valyu-mcp.py"]
