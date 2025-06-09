Write-Host "[*] Deleting Kubernetes resources..."
kubectl delete -f k8s/service.yaml
kubectl delete -f k8s/deployment.yaml

Write-Host "[*] Cleanup complete!"
