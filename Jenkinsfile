pipeline {
    agent any;
    stages {
        stage('Installation'){
            steps {
                bash 'make setup'
            }
        }
        stage('Lint'){
            steps {
                bash 'make lint'
            }
        }
        stage('Build'){
            steps {
                bash 'make build'
            }
        }
    }
}