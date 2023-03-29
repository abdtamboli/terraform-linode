pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    stages{
        stage('provision server') {
            environment {
                TF_VAR_token = credentials('linode-api-token')
            }
            steps {
                script {
                    echo 'Provisioning Prod and Staging Server using Terraform.....'
                    dir('Terraform') {
                        sh "terraform init"
                        sh "terraform apply --auto-approve"
                        sh "bash ./server-cmd.sh"
                    }
                }
            }
        }
        stage('Deploying app on cluster'){
            steps{
                script{
                    dir('Ansible'){
                        sh "kubectl create secret generic regcred \
                           --from-file=.dockerconfigjson=/var/jenkins_home/.docker/config.json \
                           --type=kubernetes.io/dockerconfigjson"
                    }
                }
            }
        }

        

    }

}