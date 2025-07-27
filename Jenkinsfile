pipeline {
    agent { label 'lin1' }  

    stages {
         stage('Clone Repo') {
            steps {
                sh 'git clone --branch main https://github.com/tejgaming6/terraform-jenkins-pipeline.git .'
            }
        }

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
               
                    sh 'terraform plan -var-file="default.auto.tfvars"'
               
            }
        }

        stage('Terraform Apply') {
            steps {
               
                    sh 'terraform apply -auto-approve -var-file="default.auto.tfvars"'
               
            }
        }
    }

    post {
        success {
            echo 'file creation success.'
        }
        failure {
            echo 'Terraform failed.'
        }
    }
}
