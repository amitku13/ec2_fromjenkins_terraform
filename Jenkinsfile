pipeline {
    agent any

    environment {
        // Ensure these credentials IDs match what you set up in Jenkins
        AWS_ACCESS_KEY_ID     = credentials('aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
    }

    stages {
        stage('Install Terraform') {
            steps {
                script {
                    // Check if Terraform is installed; if not, install it
                    sh '''
                        terraform --version || sudo yum -y install terraform
                    '''
                }
            }
        }

        stage('Checkout SCM') {
            steps {
                // Checkout code from SCM
                checkout scm
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
                    // Run terraform apply command to provision the instance
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
            // Clean the workspace
            // Wrapping the entire post action in a node block
            script {
                node {
                    cleanWs()
                }
            }
        }
    }
}
