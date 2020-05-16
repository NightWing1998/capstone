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


            sh  "kubectl create secret generic regcred --from-file=.dockerconfigjson=/var/lib/jenkins/.docker/config.json --type=kubernetes.io/dockerconfigjson"
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
        sh './run_kubernetes.sh'
      }
    }

  }
  environment {
    registry = '913924799393.dkr.ecr.us-east-1.amazonaws.com/capstone_blue'
    ACCOUNT_ID = '913924799393'
    CLUSTER_NAME = 'capstone'
  }
}