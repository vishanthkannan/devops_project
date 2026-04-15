#!/bin/bash

echo "Deploying to Kubernetes..."

docker run --rm \
  -v /var/jenkins_home/workspace/devops-final:/app \
  -v /root/.kube:/root/.kube \
  bitnami/kubectl:latest \
  apply -f /app/deployment.yaml

docker run --rm \
  -v /var/jenkins_home/workspace/devops-final:/app \
  -v /root/.kube:/root/.kube \
  bitnami/kubectl:latest \
  apply -f /app/service.yaml