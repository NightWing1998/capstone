pipeline {
    agent any;
    stages {
        stage('Installation'){
            steps {
                sh 'make setup'
            }
        }
        stage('Lint'){
            steps {
                sh 'make lint'
            }
        }
        stage('Build'){
            steps {
                sh 'make build'
            }
        }
    }
}