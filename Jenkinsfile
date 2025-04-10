pipeline {
    agent any

    environment {
        IMAGE_NAME = 'sooyaa02/testbuildimages'  // เปลี่ยนเป็นชื่อ Docker Hub ของคุณ
        TAG = 'latest'
    }

    stages {
        stage('Clone source code') {
            steps {
                git branch: 'deploy', url: 'https://github.com/kitsanaphon1/Buildimages.git'
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:${TAG}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-creds', url: '']) {
                    script {
                        docker.image("${IMAGE_NAME}:${TAG}").push()
                    }
                }
            }
        }
    }
}
