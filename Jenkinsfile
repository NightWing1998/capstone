pipeline {
  agent any
  stages {
    stage('Lint') {
      steps {
        sh 'make lint'
      }
    }

    stage('Login to registry') {
      steps {
        withAWS(profile: 'default') {
          script {
            def login = ecrLogin();
            sh "${login}"
          }

        }

      }
    }

    stage('Building & Publishing Docker image') {
      steps {
        sh "docker build -t ${registry} ."
        sh "docker push ${registry}:latest"
      }
    }

    stage('Deploying to pod') {
      steps {
        sh '''sh \'\'\'
                    kubectl apply -f ./green-controller.json

                    kubectl describe service

                    kubectl apply -f ./blue-green-lb.json
                \'\'\''''
      }
    }

  }
  environment {
    registry = '913924799393.dkr.ecr.us-east-1.amazonaws.com/capstone_blue'
    ACCOUNT_ID = '913924799393'
    CLUSTER_NAME = 'capstone'
  }
}