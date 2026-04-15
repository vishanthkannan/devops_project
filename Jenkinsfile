pipeline {
    agent any

    stages {

        stage('Clean Workspace') {
            steps {
                deleteDir()
            }
        }

        stage('Clone Code') {
            steps {
                sh 'git clone https://github.com/vishanthkannan/devops_project.git .'
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
                sh './deploy.sh'
            }
        }
    }
}