FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install base tools and Python
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    wget \
    gnupg \
    curl \
    software-properties-common \
    python3 \
    python3-pip \
    python3-venv \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install Python packages (override PEP 668)
RUN pip3 install --break-system-packages requests

# Create app directory and copy files
WORKDIR /app
COPY . /app

# Install Ollama
ARG DOWNLOAD_URL="https://ollama.com/install.sh"
RUN wget $DOWNLOAD_URL -O install1.sh && \
    chmod +x install1.sh && \
    ./install1.sh

# Start Ollama server, preload models, and run your script
CMD OLLAMA_HOST=0.0.0.0 ollama serve & \
    sleep 10 && \
    ollama pull llama3 && \
    ollama pull gemma3:1b && \
    python3 ai_chat.py
