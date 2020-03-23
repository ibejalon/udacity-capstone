node {
   def commit_id
   stage('Preparation') {
     checkout scm
     sh "git rev-parse --short HEAD > .git/commit-id"                        
     commit_id = readFile('.git/commit-id').trim()
   }
   stage('test') {
     nodejs(nodeJSInstallationName: 'nodejs') {
       sh 'npm install --only=dev'
       sh 'npm test'
     }
   }

   stage ("lint Dockerfile") {
        echo 'Linting...'
      sh 'dockerlint Dockerfile'
  }

   stage('docker build/push') {
     docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
       def app = docker.build("ibudacity2020devops/docker-nodejs-demo:${commit_id}", '.').push()
     }
   }

   stage('Deploying') {
        withAWS(credentials: 'aws-credentials', region: 'us-east-2') {
            sh "kubectl apply -f ~/.kube/aws-auth-cm.yaml"
            sh "kubectl get nodes"
            sh "kubectl run nodeapp --image=ibudacity2020devops/docker-nodejs-demo:${commit_id} --port=3000"
            sh "kubectl get deployments"
            sh "kubectl get pods"
            sh "kubectl expose deployment nodeapp --type=LoadBalancer"
            sh "kubectl describe service/nodeapp"
        }
    }

    stage("Cleaning up") {
      echo 'Cleaning up...'
      sh "docker system prune"
    }

}
