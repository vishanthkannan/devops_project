#!/bin/bash

echo "Deploying to Kubernetes..."

# Copy files to temporary folder
cp deployment.yaml /tmp/deployment.yaml
cp service.yaml /tmp/service.yaml

# Run kubectl container with copied files
docker run --rm \
  -v /tmp:/app \
  -v /root/.kube:/root/.kube \
  bitnami/kubectl:latest \
  apply -f /app/deployment.yaml

docker run --rm \
  -v /tmp:/app \
  -v /root/.kube:/root/.kube \
  bitnami/kubectl:latest \
  apply -f /app/service.yaml