#!/bin/bash

echo "Deploying to Kubernetes..."

kubectl rollout restart deployment devops-app
