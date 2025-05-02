# AI Model Communication Platform

This project establishes a communication loop between two AI models—`llama3` and `gemma3:1b`—using the Ollama API. It demonstrates inter-model dialogue, containerization with Docker, and orchestration using Kubernetes.

## Features

- Facilitates a multi-turn conversation between two AI models.
- Utilizes the Ollama API for model interactions.
- Containerized using Docker for consistent deployment.
- Deployed on Kubernetes for scalability and management.
- Logs conversations with timestamps for analysis.

## Prerequisites

- Docker installed on your system.
- Kubernetes cluster set up (e.g., Minikube, Docker Desktop, or a cloud provider).
- Basic understanding of Python and containerization concepts.

## Installation

### Clone the Repository

```bash
git clone https://github.com/Rejoice0420/ai_demo.git
cd ai_demo
```

## Build the Docker Image

```bash
docker build -t ai-model-communication .
```

## Run the Docker Container

```bash
docker run -p 11434:11434 ai-model-communication
```
This command starts the Ollama server, pulls the required models, and initiates the AI conversation.

## Kubernetes Deployment

### Apply Deployment Configuration

```bash
kubectl apply -f drone-ai-deployment.yaml
```

### Apply Service Configuration

```bash
kubectl apply -f drone-ai-service.yaml
```

### Access the Service

```bash
kubectl get services
```
Note the NodePort assigned to drone-ai-service and access the service via http://<NodeIP>:<NodePort>.

## Project Structure

```bash
ai_demo/
├── ai_chat.py                # Main Python script for AI model interaction
├── Dockerfile                # Docker configuration file
├── drone-ai-deployment.yaml  # Kubernetes deployment configuration
├── drone-ai-service.yaml     # Kubernetes service configuration
└── conversation_log.txt      # Log file for AI conversations
```

## Usage
Upon running the container or deploying to Kubernetes, the application initiates a conversation between the two AI models. The dialogue progresses for a predefined number of turns, with each model responding in sequence. All interactions are logged in conversation_log.txt with timestamps.

## Technologies Used

- **Python**: Used for scripting the AI model communication and the main logic of the system.
- **Docker**: Containerization of the application to ensure consistency and portability across different environments.
- **Kubernetes**: Used for orchestration and management of the Docker containers to ensure scalability and efficient resource utilization.
- **Ollama API**: The API that facilitates the interaction between the AI models in the communication loop.
- **llama3 and gemma3:1b AI Models**: The AI models used to simulate conversation in the platform.


## License

This project is licensed under the MIT License.
