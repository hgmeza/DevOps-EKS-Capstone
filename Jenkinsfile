pipeline {
  agent any
  stages {
    stage('Dockerfile Linter') {
      steps {
        sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
      }
    }
    stage('Build Docker File') {
      steps {
        sh 'docker build -t ${registry} .'
      }
    }
    stage('Push to Dockerhub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'dockerUser', passwordVariable: 'dockerPassword')]) {
          sh 'docker login -u $dockerUser -p $dockerPassword'
          sh 'docker tag ${registry} ${registry}'
          sh 'docker push ${registry}'
        }
      }
    }
  }
}