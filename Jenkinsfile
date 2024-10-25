pipeline {
    agent any

    environment {
        // Add AWS credentials in Jenkins (ensure they are correctly configured)
        AWS_ACCESS_KEY_ID     = credentials('aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the repository
                git 'https://github.com/amitku13/ec2_fromjenkins_terraform.git'
            }
        }

        stage('Install Terraform') {
            steps {
                // Check if Terraform is installed, if not, install it
                sh '''
                    if ! command -v terraform &> /dev/null; then
                        echo "Terraform not found. Installing..."
                        sudo yum -y install terraform
                    else
                        echo "Terraform is already installed."
                    fi
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    // Initialize Terraform
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    // Running terraform apply command to provision the instance
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Show Outputs') {
            steps {
                dir('terraform') {
                    // Show Terraform outputs
                    sh 'terraform output'
                }
            }
        }
    }

    post {
        always {
            // Clean the workspace after the build
            cleanWs()
        }
    }
}
