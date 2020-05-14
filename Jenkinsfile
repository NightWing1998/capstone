pipeline {
    agent any
    environment {
        registry = '332154536608.dkr.ecr.us-east-1.amazonaws.com/capstone'
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
                    script{
                        def login = ecrLogin();
                        sh "${login}"
                    }
                }
            }
        }
        stage('Building & Publishing Docker image'){
            steps {
                sh "docker build -t ${registry} ."
                sh "docker push ${registry}:latest"
            }
        }
    }
}