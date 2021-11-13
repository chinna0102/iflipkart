pipeline{
    agent any
    stages{
       
        stage('SCM'){
            steps{
                git 'https://github.com/chinna0102/iflipkart.git'
            }
        }
        
         stage('Maven Build'){
            steps{
                sh 'mvn clean package'
            }
        }
        
         stage('Docker Build'){
            steps{
                sh 'docker build . -t chinna0102/cicd'
            }
        }
        
        stage('DockerHub Push'){
            steps{
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
                    sh "docker login -u chinna0102 -p ${dockerHubPwd}"
                }
                
                sh "docker push chinna0102/cicd"
            }
        }
        
        stage('Docker Deploy'){
            steps{
           
               ansiblePlaybook credentialsId: 'cicd-pipeline', disableHostKeyChecking: true, installation: 'ansible', inventory: 'dev.inv', playbook: 'deploy-docker-ansible.yaml'
            }
                
        }
    }
}
