# PDF Outline Extractor

A Docker-based application that extracts hierarchical outlines from PDF documents using pure PyMuPDF analysis. No machine learning dependencies required.

## Features

- **Generic PDF Processing**: Works with any PDF document without file-specific patterns
- **Font-Based Analysis**: Uses font size distribution to determine heading hierarchy  
- **Hierarchical Output**: Generates H1-H4 heading levels with page references
- **Docker Ready**: Containerized for consistent cross-platform execution
- **High Performance**: Processes 50-page PDFs in under 10 seconds
- **Offline Operation**: No external dependencies or internet required

## Quick Start

### Prerequisites
- Docker installed on your system
- PDF files to process

### Setup and Run

1. **Clone or download** this project to your local machine

2. **Place PDF files** in the `input/` directory:
   ```bash
   mkdir -p input
   # Copy your PDF files to the input directory
   ```

3. **Build the Docker image**:
   ```bash
   docker build -t pdf-outline-extractor .
   ```

4. **Run the container**:

   **Linux/Mac (Bash)**:
   ```bash
   docker run --rm -v "$(pwd)/input:/app/input" -v "$(pwd)/output:/app/output" pdf-outline-extractor
   ```

   **Windows (PowerShell)**:
   ```powershell
   docker run --rm -v "${PWD}/input:/app/input" -v "${PWD}/output:/app/output" pdf-outline-extractor
   ```

   **Windows (Command Prompt)**:
   ```cmd
   docker run --rm -v "%cd%\input:/app/input" -v "%cd%\output:/app/output" pdf-outline-extractor
   ```

5. **Check results** in the `output/` directory - JSON files will be created for each processed PDF.

## Output Format

Each PDF generates a JSON file with this structure:

```json
{
  "title": "Document Title",
  "outline": [
    {
      "text": "Introduction", 
      "level": "H1",
      "page": 1
    },
    {
      "text": "Background Information",
      "level": "H2", 
      "page": 2
    }
  ]
}
```

## Docker Commands Reference

### Build Image
```bash
docker build -t pdf-outline-extractor .
```

### Run Container (Basic)

**Linux/Mac (Bash)**:
```bash
docker run --rm -v "$(pwd)/input:/app/input" -v "$(pwd)/output:/app/output" pdf-outline-extractor
```

**Windows (PowerShell)**:
```powershell
docker run --rm -v "${PWD}/input:/app/input" -v "${PWD}/output:/app/output" pdf-outline-extractor
```

**Windows (Command Prompt)**:
```cmd
docker run --rm -v "%cd%\input:/app/input" -v "%cd%\output:/app/output" pdf-outline-extractor
```

### Run with Custom Paths
```bash
docker run --rm \
  -v "/path/to/your/pdfs:/app/input" \
  -v "/path/to/save/results:/app/output" \
  pdf-outline-extractor
```

### Run in Background

**Linux/Mac (Bash)**:
```bash
docker run -d --name pdf-processor \
  -v "$(pwd)/input:/app/input" \
  -v "$(pwd)/output:/app/output" \
  pdf-outline-extractor
```

**Windows (PowerShell)**:
```powershell
docker run -d --name pdf-processor -v "${PWD}/input:/app/input" -v "${PWD}/output:/app/output" pdf-outline-extractor
```

**Windows (Command Prompt)**:
```cmd
docker run -d --name pdf-processor -v "%cd%\input:/app/input" -v "%cd%\output:/app/output" pdf-outline-extractor
```

### Check Container Logs
```bash
docker logs pdf-processor
```

### Stop Background Container
```bash
docker stop pdf-processor
docker rm pdf-processor
```

## Local Development

For testing without Docker:

1. **Install Python dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

2. **Run locally**:
   ```bash
   python main.py
   ```

## Performance Specifications

- **Processing Speed**: < 10 seconds for 50-page documents
- **Memory Usage**: < 16GB RAM
- **CPU Optimization**: Utilizes up to 8 cores
- **Platform**: Linux/AMD64 architecture
- **Dependencies**: Only PyMuPDF and NumPy

## Validation Checklist

✅ **Functionality**: Extracts hierarchical outlines from PDFs  
✅ **Performance**: Processes documents within time/memory limits  
✅ **Genericity**: Works with various PDF types without hardcoded patterns  
✅ **Docker**: Runs consistently in containerized environment  
✅ **Offline**: No internet connectivity required  
✅ **Output**: Generates valid JSON with title and hierarchical outline  

## Architecture

- **main.py**: Core PDF processing logic
- **Dockerfile**: Multi-stage build for Linux/AMD64
- **requirements.txt**: Minimal Python dependencies
- **input/**: Directory for source PDF files
- **output/**: Directory for generated JSON results

## Troubleshooting

### No PDFs Found
Ensure PDF files are placed in the `input/` directory before running.

### Permission Issues  
Make sure Docker has access to your local directories:
```bash
chmod 755 input output
```

### Memory Issues
For very large PDFs, increase Docker memory limit:

**Linux/Mac (Bash)**:
```bash
docker run --memory=16g --rm -v "$(pwd)/input:/app/input" -v "$(pwd)/output:/app/output" pdf-outline-extractor
```

**Windows (Command Prompt)**:
```cmd
docker run --memory=16g --rm -v "%cd%\input:/app/input" -v "%cd%\output:/app/output" pdf-outline-extractor
```

### Platform Issues
Force Linux/AMD64 platform:
```bash
docker build --platform linux/amd64 -t pdf-outline-extractor .
```