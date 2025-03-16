pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = "benjoyarakal/maven-webapp"
        DOCKER_USERNAME = 'benjoyarakal'  // Docker Hub username
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-credentials',  
                    url: 'https://github.com/benjoyarackal/mvc-agile-process-lab3.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                // Change the command to 'mvn clean install'
                sh 'mvn clean install'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub-password', variable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $DOCKER_HUB_REPO .'
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker push $DOCKER_HUB_REPO'
            }
        }
    }

    post {
        always {
            echo "Pipeline completed. Cleaning up workspace."
            sh 'docker logout'
        }
        failure {
            echo "Pipeline failed. Check logs."
        }
        success {
            echo "Pipeline executed successfully."
        }
    }
}
