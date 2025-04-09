pipeline {
  agent any

  environment {
    COMPOSE_PROJECT_NAME = "webapi-project"
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'deploy', url: 'https://github.com/kitsanaphon1/api.git'
      }
    }

    stage('Build Image') {
      steps {
        sh 'docker build --network=host -t my-webapi .'
      }
    }

    stage('Deploy with Compose') {
      steps {
        sh 'docker-compose down || true'
        sh 'docker-compose up -d'
      }
    }
  }
}
