# Terraform modules - Lambda

## Steps to run
  - cd 15-s3-notification-lambda-trigger
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply --auto-approve
  - terraform destroy --auto-approve
  - rm -r .terraform*
  - rm -r terraform.tfstate*
   

## Use Case demonstration
  - Create a Lambda Function, Lambda Permission
  - Create S3 bucket, object/folder, S3 bucket notification.
  - Add prefix and suffix filter - to trigger lambda only when any .jpg file is placed 
    into "demo/upload/" folder in the bucket.
  - Lambda will get trigger and it will get copied into another  bucket - 'image-processing' in the 
    demo/raw/ folder.
