pipeline {
    agent any

    environment {
        // Add AWS credentials in Jenkins (ensure they are correctly configured)
        AWS_ACCESS_KEY_ID     = credentials('aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
    }

    stages {
        stage('Install Terraform') {
            steps {
                sh '''
                    terraform --version || sudo yum -y install terraform
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh '''
                        terraform init
                    '''
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    // Running terraform apply command to provision the instance
                    sh '''
                        terraform apply -auto-approve
                    '''
                }
            }
        }

        stage('Show Outputs') {
            steps {
                dir('terraform') {
                    sh '''
                        terraform output
                    '''
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}

