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
					sh 'kubectl config use-context ${cluster-arn}'
				}
			}
		}
    stage('Deploy Blue Container') {
			steps {
				withAWS(region:'us-east-2', credentials:'pipeline') {
					sh 'kubectl apply -f ./deployments/blue-controller.json'
				}
			}
		}

		stage('Deploy Green Container') {
			steps {
				withAWS(region:'us-east-2', credentials:'pipeline') {
					sh 'kubectl apply -f ./deployments/green-controller.json'
				}
			}
		}

		stage('Redirect to Blue') {
			steps {
				withAWS(region:'us-east-2', credentials:'pipeline') {
					sh 'kubectl apply -f ./deployments/blue-service.json'
				}
			}
		}
    stage('User Approval') {
      steps {
          input "Ready to redirect traffic to green?"
      }
    }
    stage('Redirect to Green') {
			steps {
				withAWS(region:'us-east-2', credentials:'pipeline') {
					sh 'kubectl apply -f ./deployments/green-service.json'
				}
			}
		}
  }
}
