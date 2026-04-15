pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-app .'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([string(credentialsId: 'docker-token', variable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u vishanthkannan --password-stdin'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'docker tag devops-app vishanthkannan/devops-app'
                sh 'docker push vishanthkannan/devops-app'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'bash deploy.sh'
            }
        }
    }
}