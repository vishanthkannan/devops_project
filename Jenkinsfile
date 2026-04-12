pipeline {
    agent any

    stages {
        stage('Clone') {
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
                sh 'docker push vishanthkannan/devops-app'
            }
        }
    }
}