pipeline {
    agent any
    environment {
        registry = 332154536608.dkr.ecr.us-east-1.amazonaws.com/capstone_dev
    }
    stages {
        stage('Lint'){
            steps {
                sh 'make lint'
            }
        }
        stage('Login to registry'){
            steps {
                withAWS(profile: 'default'){
                    def login = ecrLogin();
                    sh "${login}"
                }
            }
        }
        stage('Building & Publishing Docker image'){
            steps {
                docker build -t 332154536608.dkr.ecr.us-east-1.amazonaws.com/capstone_dev .
                docker push 332154536608.dkr.ecr.us-east-1.amazonaws.com/capstone_dev:latest
            }
        }
    }
}