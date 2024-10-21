# S3 Static Website

This project demonstrates how to host a simple static website using Amazon S3, fully managed through Terraform. The infrastructure comprises:

- **S3 Bucket**: Stores website files and serves them as a static website.
- **Public Access Block Configuration**: Manages public access settings to ensure security while allowing public read access via bucket policies.
- **Bucket Policy**: Grants public read permissions to all objects within the bucket.
- **Website Configuration**: Defines the index and error documents for the static website.
- **S3 Objects**: Uploads index.html and error.html to the S3 bucket.

```text
+---------------------+
|       Client        |
+---------+-----------+
          |
          v
+---------------------+
|     Amazon S3       |
|  Static Website     |
| +-----------------+ |
| | index.html      | |
| | error.html      | |
| +-----------------+ |
+---------------------+
```

## Installation

### 1. Clone the repository

```shell
git clone https://github.com/marvinlanhenke/aws-architectures.git
cd aws-architectures/static-website
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

### 3. Prepare Website Files

Place your index.html and error.html files inside the website/ directory:

```shell
static-website/
├── main.tf
├── website/
│   ├── index.html
│   └── error.html
└── README.md

```

### 4. Initialize Terraform

Initialize the Terraform project to download the necessary providers and set up the backend.

```shell
terraform init
```

### 5. Validate Configuration

Ensure your Terraform configuration files are syntactically correct.

```shell
terraform validate
```

### 6. Plan and Apply

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
