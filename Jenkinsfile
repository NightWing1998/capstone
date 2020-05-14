pipeline {
    agent any;
    stages {
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