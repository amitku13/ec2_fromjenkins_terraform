pipeline {
    agent any
    parameters {
        string(name: 'AMI_ID', defaultValue: 'ami-06b21ccaeff8cd686', description: 'The AMI ID to use for the instance')
        string(name: 'INSTANCE_TAG_NAME', defaultValue: 'terraform', description: 'The name to assign to the instance')
        string(name: 'SUBNET_ID', defaultValue: 'subnet-09dc057c84389ffcb', description: 'The subnet ID to launch the instance in')
        string(name: 'VPC_ID', defaultValue: 'vpc-006993ee517a74e91', description: 'The VPC ID to use')
        string(name: 'VPC_CIDR', defaultValue: '172.31.0.0/16', description: 'The CIDR block of the VPC')
    }
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id') // Use Jenkins credentials
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key') // Use Jenkins credentials
    }
    stages {
        stage('AMI Configuration') {
            steps {
                script {
                    echo "Using AMI ID: ${params.AMI_ID}"
                }
            }
        }
        stage('Subnet Configuration') {
            steps {
                script {
                    echo "Using Subnet ID: ${params.SUBNET_ID}"
                }
            }
        }
        stage('VPC Configuration') {
            steps {
                script {
                    echo "Using VPC ID: ${params.VPC_ID}"
                    echo "Using VPC CIDR: ${params.VPC_CIDR}"
                }
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    sh 'cd ${WORKSPACE} && terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    sh """
                    cd ${WORKSPACE} && terraform plan \
                        -var="ami_id=${params.AMI_ID}" \
                        -var="instance_tag_name=${params.INSTANCE_TAG_NAME}" \
                        -var="subnet_id=${params.SUBNET_ID}" \
                        -var="vpc_id=${params.VPC_ID}" \
                        -var="vpc_cidr=${params.VPC_CIDR}"
                    """
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    sh """
                    cd ${WORKSPACE} && terraform apply -auto-approve \
                        -var="ami_id=${params.AMI_ID}" \
                        -var="instance_tag_name=${params.INSTANCE_TAG_NAME}" \
                        -var="subnet_id=${params.SUBNET_ID}" \
                        -var="vpc_id=${params.VPC_ID}" \
                        -var="vpc_cidr=${params.VPC_CIDR}"
                    """
                }
            }
        }
    }
}
