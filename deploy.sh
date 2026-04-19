#!/bin/bash

echo "Deploying to Kubernetes..."

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl rollout restart deployment devops-app