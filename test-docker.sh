#!/bin/bash

# Test script for Docker PDF processor

echo "Building Docker image..."
docker build --platform linux/amd64 -t pdf-outline-extractor .

echo "Testing with sample data..."
docker run --rm \
  -v $(pwd)/input:/app/input:ro \
  -v $(pwd)/output:/app/output \
  --network none \
  pdf-outline-extractor
  -v $(pwd)/output:/app/output \
  --network none \
  pdf-processor

echo "Checking output files..."
ls -la output/

echo "Test complete!"
