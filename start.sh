#!/bin/bash

echo "Starting DevOps Project..."

# Start Jenkins
docker start jenkins

# Wait for Kubernetes
sleep 5

# Start port forwarding
kubectl port-forward service/devops-service 3000:3000 &
kubectl port-forward deployment/prometheus 9090:9090 &
kubectl port-forward deployment/grafana 3001:3000 &

echo "All services started!"

echo "App: http://localhost:3000"
echo "Prometheus: http://localhost:9090"
echo "Grafana: http://localhost:3001"
