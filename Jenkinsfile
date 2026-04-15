pipeline {
    agent any

    stages {

        stage('Clone Code') {
            steps {
                git 'https://github.com/vishanthkannan/devops_project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-app .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'docker tag devops-app vishanthkannan/devops-app'
                sh 'echo Vish@1801 | docker login -u vishanthkannan --password-stdin'
                sh 'docker push vishanthkannan/devops-app'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl rollout restart deployment devops-app'
            }
        }
    }
}