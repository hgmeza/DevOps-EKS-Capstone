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
    stage('Set Kubernetes Context') {
			steps {
				sh 'echo "i work"'
			}
		}
    stage('Deploy Blue Container') {
			steps {
				sh 'echo "i work"'
			}
		}

		stage('Deploy green container') {
			steps {
				sh 'echo "i work"'
			}
		}

		stage('Create the service in the cluster, redirect to blue') {
			steps {
				sh 'echo "i work"'
			}
		}
    stage('User Approval') {
      steps {
          sh 'echo "i work"'
      }
    }
    stage('Create the service in the cluster, redirect to green') {
			steps {
				sh 'echo "i work"'
			}
		}
  }
}