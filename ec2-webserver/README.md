# EC2 Simple Webserver

A simple web application on a single Amazon EC2 instance using Terraform. 
The goal is to create an infrastructure as code (IaC) solution that sets up 
all necessary AWS resources to run a web server accessible over the internet.

- **Amazon VPC** : The network container for AWS resources.
- **Subnet**: A public subnet within the VPC to host the EC2 instance.
- **Internet Gateway**: Enables internet access for resources within the VPC.
- **Route Table and Route Association**: Directs internet traffic to the Internet Gateway.
- **Security Groups**: Firewall rules to allow HTTP (port 80) and SSH (port 22) traffic.
- **Key Pair**: SSH key pair to securely connect to the EC2 instance.
- **Amazon EC2 Instance**: The virtual server running the web application

```text
[Internet]
     |
[Internet Gateway]
     |
[Public Subnet]
     |
[EC2 Instance (Web Server)]

```

## Installation

### 1. Clone the repository

```shell
git clone https://github.com/marvinlanhenke/aws-architectures.git
cd aws-architectures/ec2-webserver
```

### 2. Configure AWS Credentials

```shell
aws configure
```

Alternatively, set the following environment variables:

```shell
export AWS_ACCESS_KEY_ID="your_access_key_id"
export AWS_SECRET_ACCESS_KEY="your_secret_access_key"
export AWS_DEFAULT_REGION="eu-central-1"
```

### 3. Initialize Terraform

Initialize the Terraform project to download the necessary providers and set up the backend.

```shell
terraform init
```

### 4. Validate Configuration

Ensure your Terraform configuration files are syntactically correct.

```shell
terraform validate
```

### 5. Plan and Apply

Generate an execution plan to preview the changes Terraform will make, and apply.

```shell
terraform plan
terraform apply
```

## Cleanup

To remove all resources created by this Terraform configuration, run:

```shell
terraform destroy
```
