Write-Host "[*] Building Docker image..."
docker build -t flask-storage-app .

Write-Host "[*] Applying Kubernetes deployment..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

Write-Host "[*] Deployment complete!"
