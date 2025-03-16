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
                bat 'mvn clean install'  // Use bat for Windows
            }
        }

        stage('Test') {
            steps {
                bat 'mvn test'  // Use bat for Windows
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub-password', variable: 'DOCKER_PASSWORD')]) {
                    bat 'echo %DOCKER_PASSWORD% | docker login -u %DOCKER_USERNAME% --password-stdin'  // Use bat for Windows
                }
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t %DOCKER_HUB_REPO% .'  // Use bat for Windows
            }
        }

        stage('Docker Push') {
            steps {
                bat 'docker push %DOCKER_HUB_REPO%'  // Use bat for Windows
            }
        }
    }

    post {
        always {
            echo "Pipeline completed. Cleaning up workspace."
            bat 'docker logout'  // Use bat for Windows
        }
        failure {
            echo "Pipeline failed. Check logs."
        }
        success {
            echo "Pipeline executed successfully."
        }
    }
}
