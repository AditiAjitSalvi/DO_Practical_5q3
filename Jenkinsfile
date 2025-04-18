pipeline {
    agent any

    environment {
        IMAGE_NAME = 'prac05q4'
        APP_PORT = '3000'
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
                    dir('prac05q4') {
                        docker.build("${IMAGE_NAME}", ".")
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image("${IMAGE_NAME}").run("-p ${APP_PORT}:${APP_PORT}")
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up any dangling containers...'
            script {
                sh "docker container prune -f"
            }
        }
    }
}
