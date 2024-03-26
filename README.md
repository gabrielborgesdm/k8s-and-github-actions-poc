# K8S-AND-GITHUB-ACTIONS-POC

1. Build and push dockerfile to dockerhub


## Build and push dockerfile to dockerhub

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
```
