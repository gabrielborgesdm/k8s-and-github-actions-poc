# K8S-AND-GITHUB-ACTIONS-POC
This repository was dedicated to creating a Proof of Concept (POC) for Kubernetes deployment strategies using Minikube and GitHub Actions.

The main goal was to push changes to a local Minikube cluster using GitHub Actions on a self-hosted runner.

## Table of Contents
- [Usage](#usage)
- [Prerequisites](#prerequisites)
- [Installation](#installation)

## Usage

Since the main goal was to test the GitHub Actions working alongside a Kubernetes cluster, there's not much to say about the Nest app itself. The main thing to consider is that after any pushes to the main branch, the changes will be reflected on the Minikube cluster.

## Prerequisites

Before you begin, ensure you have the following prerequisites installed and set up on your host machine:

- **Docker and Docker Compose:** Necessary for containerization and orchestration.
- **Docker Hub Account:** Create an account and log in to Docker Hub on your host machine.
- **kubectl:** Kubernetes command-line tool.
- **Minikube:** Local Kubernetes cluster for development and testing.
- **Self-hosted GitHub Runner:** Set up a self-hosted runner for GitHub Actions workflows.

## Installation
Once everything in the prerequisites is set up, all you need to do is make changes and commit them to the main branch. However, there are a few useful instructions that you can run manually if needed:

### Get the application url
After you commit the code or manually trigger the workflow dispatch, you might want to access and test your application. In order to do that, it is possible to get the service url inside of the minikube cluster.

To access a NodePort type service on minikube, enter the command bellow, it creates a tunnel to the cluster and exposes the service
```bash
minikube service nest-k8s-app --url
```

### Build and push dockerfile to dockerhub manually

Start by building the dockerfile:
```docker build -t your-dockerhub-username/your-image-name:tag .```

Push your Docker image to Docker Hub: Log in to Docker Hub using the docker login command, then push your image:
```bash
docker login
docker push your-dockerhub-username/your-image-name:tag
```

Change the `deployment.yml` image to match your image
```yaml
 spec:
      containers:
      - name: your-container
        image: your-dockerhub-username/your-image-name:tag
```

If you want to apply it locally to minikube, run the following command to run the deployment:
```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

### Makefile Commands for Managing the Application with Docker Compose

 ```make start```: This command starts the Docker containers defined in the docker-compose.yml file.

 ```make rebuild```: This command rebuilds and starts the Docker containers defined in the docker-compose.yml file. It's useful when changes have been made to the Dockerfile or dependencies.

 ```make prune```: This command stops and removes all containers defined in the docker-compose.yml file. It also removes any associated volumes and orphaned containers.