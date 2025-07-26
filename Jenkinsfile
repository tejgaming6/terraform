pipeline {
    agent { label 'codespace' }  

    environment {
        TF_DIR = "${WORKSPACE}"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/tejgaming6/terraform-jenkins-pipeline.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform plan -var-file="terraform.tfvars"'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform apply -auto-approve -var-file="terraform.tfvars"'
                }
            }
        }
    }

    post {
        success {
            echo 'Terraform provisioning completed.'
            sh 'ls -R ./output'
        }
        failure {
            echo 'Terraform failed.'
        }
    }
}
