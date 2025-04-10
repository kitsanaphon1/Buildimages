pipeline {
    agent any

    environment {
        IMAGE_NAME = 'sooyaa02/testbuildimages'
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
                // เพิ่ม --network=host เพื่อให้ container ใช้ network เดียวกับ host
                sh "docker build --network=host -t ${IMAGE_NAME}:${TAG} ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh "docker push ${IMAGE_NAME}:${TAG}"
            }
        }
    }
}
