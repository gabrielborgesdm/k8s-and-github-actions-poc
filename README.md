# K8S-AND-GITHUB-ACTIONS-POC

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
kubectl apply -f k8s/service.yaml
```

## Access the service created on minikube
If you want to access a NodePort type service on minikube, enter the command bellow, it creates a tunnel to the cluster and exposes the service
```bash
minikube service nest-k8s-app --url
```