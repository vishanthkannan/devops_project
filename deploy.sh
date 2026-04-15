#!/bin/bash

echo "Deploying to Kubernetes..."

docker run --rm \
  -v ~/.kube:/root/.kube \
  -v $(pwd):/app \
  bitnami/kubectl:latest \
  kubectl apply -f /app/deployment.yaml

docker run --rm \
  -v ~/.kube:/root/.kube \
  -v $(pwd):/app \
  bitnami/kubectl:latest \
  kubectl apply -f /app/service.yaml