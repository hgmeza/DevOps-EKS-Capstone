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
				withAWS(region:'us-east-2', credentials:'pipeline') {
					echo 'i work'
				}
			}
		}
    stage('Deploy Blue Container') {
			steps {
				withAWS(region:'us-east-2', credentials:'pipeline') {
					echo 'i work'
				}
			}
		}

		stage('Deploy green container') {
			steps {
				withAWS(region:'us-east-2', credentials:'pipeline') {
					echo 'i work'
				}
			}
		}

		stage('Create the service in the cluster, redirect to blue') {
			steps {
				withAWS(region:'us-east-2', credentials:'pipeline') {
					echo 'i work'
				}
			}
		}
    stage('User Approval') {
      steps {
          echo 'i work'
      }
    }
    stage('Create the service in the cluster, redirect to green') {
			steps {
				withAWS(region:'us-east-2', credentials:'pipeline') {
					echo 'i work'
				}
			}
		}
  }
}