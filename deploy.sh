#!/bin/bash

echo "Deploying to Kubernetes..."

echo "Workspace path is: $WORKSPACE"
ls -l $WORKSPACE   # debug (very important)

docker run --rm \
  -v $WORKSPACE:/app \
  -v /root/.kube:/root/.kube \
  bitnami/kubectl:latest \
  apply -f /app/deployment.yaml

docker run --rm \
  -v $WORKSPACE:/app \
  -v /root/.kube:/root/.kube \
  bitnami/kubectl:latest \
  apply -f /app/service.yaml