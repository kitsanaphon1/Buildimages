pipeline {
    agent any

    environment {
        VERSION = "${BUILD_NUMBER}"
        IMAGE_NAME = "sooyaa02/testbuildimages"
    }

    stages {
        stage('Clone source code') {
            steps {
                git branch: 'deploy', url: 'https://github.com/kitsanaphon1/Buildimages.git'
            }
        }

        stage('Build Docker image') {
            steps {
                sh "docker build --network=host -t ${IMAGE_NAME}:latest ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: '12345',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh "docker push ${IMAGE_NAME}:latest"
            }
        }
    }
}
