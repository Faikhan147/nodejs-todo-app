pipeline {

    agent any

    environment {
        IMAGE_NAME = "faisalkhan35/nodejs-app:latest"
    }
  
    stages {

        stage('GitHub clone') {
    
            steps {
                git 'https://github.com/Faikhan147/nodejs-todo-app.git'
            }
        }

        stage('npm install dependencies') {
    
            steps {
                sh 'npm install --legacy-peer-deps'
            }
        }

        stage('npm unit test') {
    
            steps {
                sh 'npm test'
            }
        }


        stage('Docker Hub Login') {
    
            steps {
                sh 'docker login -u faisalkhan35 -p Faisalkhan35@'
            }
        }

        stage('Docker image build') {
    
            steps {
                sh 'docker build -t ${IMAGE_NAME} .'
            }
        }

        stage('Docker Hub push') {
    
            steps {
                sh 'docker push ${IMAGE_NAME}'
            }

        }

    }
}
