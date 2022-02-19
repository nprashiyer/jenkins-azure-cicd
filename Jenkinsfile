pipeline {
    agent any

    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }
        stage('Terraform Plan') {
            
                steps {
                    withCredentials([azureServicePrincipal('CSD-AMER')]) {
                        sh 'terraform plan'
                    }
                }
        }
            
    }
}
