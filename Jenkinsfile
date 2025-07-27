pipeline {
    agent { label 'lin1' }  

      environment {
        TF_DIR = "${WORKSPACE}" 
    }

    stages {
         stage('Clone Repo') {
            steps {
                sh 'git clone --branch main https://github.com/tejgaming6/terraform-jenkins-pipeline.git .'
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
                    sh 'terraform plan -var-file="default.auto.tfvars"'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform apply -auto-approve -var-file="default.auto.tfvars"'
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
