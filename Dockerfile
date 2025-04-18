FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHON_VERSION=3.8 

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    wget \
    gnupg \
    curl \
    software-properties-common \
    python${PYTHON_VERSION} \
    python3-pip \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

# Install Python packages (requests is needed for your script)
RUN pip3 install --upgrade pip && pip3 install requests

# Install Ollama
ARG DOWNLOAD_URL="https://ollama.com/install.sh"
RUN wget $DOWNLOAD_URL -O install1.sh && \
    chmod +x install1.sh && \
    ./install1.sh

# Expose Ollama port
EXPOSE 11434

# Start Ollama and your Python script
CMD OLLAMA_HOST=0.0.0.0 ollama serve & sleep 10 && python3 ai_chat.py
