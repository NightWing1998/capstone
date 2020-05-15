pipeline {
    agent any
    environment {
        registry = '332154536608.dkr.ecr.us-east-1.amazonaws.com/capstone'
        ACCOUNT_ID = '332154536608'
        CLUSTER_NAME = 'capstone'
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
                    script {
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
        stage('Set config for kubectl'){
            steps{
                sh "kubectl config use-context arn:aws:eks:us-east-1:${ACCOUNT_ID}:cluster/${CLUSTER_NAME}"
            }
        }
        stage('Deploying to pod'){
            steps{
                sh './run_kubernetes.sh'
            }
        }
    }
}