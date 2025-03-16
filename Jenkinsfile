pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = "benjoyarakal/maven-webapp"
        DOCKER_USERNAME = 'benjoyarakal'  // Your Docker Hub username
        DOCKER_PASSWORD = 'Ben@11082003'  // Your Docker Hub password
    }

    stages {
        stage('Checkout') {
            steps {
                // Use GitHub token credential from Jenkins
                git branch: 'main',
                    credentialsId: 'github-credentials',  // The ID of the GitHub token you just created
                    url: 'https://github.com/benjoyarackal/mvc-agile-process-lab3.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Login') {
            steps {
                // Docker login using the provided credentials
                sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
            }
        }

        stage('Docker Build') {
            steps {
                // Docker build command to create an image
                sh 'docker build -t $DOCKER_HUB_REPO .'
            }
        }

        stage('Docker Push') {
            steps {
                // Docker push command to upload the image to Docker Hub
                sh 'docker push $DOCKER_HUB_REPO'
            }
        }
    }
}
