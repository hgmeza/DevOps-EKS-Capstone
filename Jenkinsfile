pipeline {
  agent any
  stages {
    stage('Dockerfile Linter') {
      steps {
        sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
      }
    }
    stage('Building Docker Image') {
      withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerPassword', usernameVariable: 'dockerUser')]) {
	     	sh "docker login -u ${env.dockerUser} -p ${env.dockerPassword}"
	     	sh "docker build -t ${registry} ."
	     	sh "docker push ${registry}"
      }
    }
  }
}