@echo off

echo Building Docker image...
docker build --platform linux/amd64 -t pdf-outline-extractor .

echo Testing with sample data...
docker run --rm -v %cd%/input:/app/input:ro -v %cd%/output:/app/output --network none pdf-outline-extractor

echo Checking output files...
dir output\

echo Test complete!
pause
