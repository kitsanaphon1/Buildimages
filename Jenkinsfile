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

    stage('Build & Deploy') {
      steps {
        sh '''
          docker-compose down || true
          docker-compose up -d --build
        '''
      }
    }
  }
}
