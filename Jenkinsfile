pipeline {
    agent any

    environment {
        IMAGE_NAME = 'prac05q4'
        APP_PORT = '3000'
        IMAGE_PATH = 'D:/FAMTMCA/SEM2/Devops/practicalno05/prac05q4'  // Set the correct path here
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/AditiAjitSalvi/DO_Practical_5q3.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using the correct path
                    dir("${IMAGE_PATH}") {
                        bat 'docker build -t prac05q4 .'
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    bat 'docker run -p 3001:3000 prac05q4'
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up any dangling containers...'
            script {
                bat 'docker container prune -f'
            }
        }
    }
}
