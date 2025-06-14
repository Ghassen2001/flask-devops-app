pipeline {
    agent any

    stages {
        stage('Docker Build') {
            steps {
                sh 'docker build -t flask-devops-app .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    docker tag flask-devops-app $DOCKER_USER/flask-devops-app:latest
                    docker push $DOCKER_USER/flask-devops-app:latest
                    '''
                }
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker run -d -p 5000:5000 flask-devops-app'
            }
        }
    }
}
