pipeline {
  agent any
  stages {
    stage('Dockerfile Linter') {
      steps {
        sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
      }
    }
    stage("Build Docker File") {
      steps {
        sh 'docker build -t ${registry} .'
      }
    }
  }
}