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
                        sh "export KUBE_VAR=`terraform output kubeconfig` && echo $KUBE_VAR | base64 -di > lke-cluster-config.yaml"
                        sh "export KUBECONFIG=lke-cluster-config.yaml"
                    }
                }
            }
        }

        

    }

}