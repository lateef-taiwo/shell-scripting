#!/bin/bash

# Variables
KEY_NAME="lampsh.pem"
INSTANCE_TYPE="t2.micro"
SECURITY_GROUP_NAME="lamp-security-group"
SECURITY_GROUP_DESC="LAMP Stack Security Group"
AMI_ID="ami-03951dc3553ee499f"  # Replace with the appropriate AMI ID for your desired Linux distribution

# Create security group
aws ec2 create-security-group --group-name $SECURITY_GROUP_NAME --description "$SECURITY_GROUP_DESC"
aws ec2 authorize-security-group-ingress --group-name $SECURITY_GROUP_NAME --protocol tcp --port 22 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-name $SECURITY_GROUP_NAME --protocol tcp --port 80 --cidr 0.0.0.0/0

# Launch an EC2 instance
INSTANCE_ID=$(aws ec2 run-instances --image-id $AMI_ID --count 1 --instance-type $INSTANCE_TYPE --key-name $KEY_NAME --security-groups $SECURITY_GROUP_NAME --query 'Instances[0].InstanceId' --output text)

echo "Waiting for instance to be in running state..."
aws ec2 wait instance-running --instance-ids $INSTANCE_ID

# Get the public IP address of the instance
PUBLIC_IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)

echo "Instance is running. Public IP: $PUBLIC_IP"

# Connect to the instance via SSH and run provisioning commands
echo "Connecting to the instance..."
ssh -i ~/.ssh/$KEY_NAME.pem ec2-user@$PUBLIC_IP << EOF
    sudo yum update -y
    sudo yum install -y httpd mysql-server php php-mysql

    # Configure Apache
    sudo service httpd start
    sudo chkconfig httpd on

    # Configure MySQL
    sudo service mysqld start
    sudo chkconfig mysqld on

    # Configure firewall
    sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT
    sudo service iptables save

    # Deploy your application (e.g., copy files to /var/www/html)

    exit
EOF

echo "Deployment completed."
