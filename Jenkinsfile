pipeline {
  agent any
  stages {
    stage('Dockerfile Linter') {
      steps {
        sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
      }
    }

  }
}