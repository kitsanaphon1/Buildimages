pipeline {
  agent any

  environment {
    COMPOSE_PROJECT_NAME = "webapi"
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
          DOCKER_BUILDKIT=0 docker build --progress=plain -t my-webapi .
          docker-compose down || true
          docker-compose up -d
        '''
      }
    }
  }
}
