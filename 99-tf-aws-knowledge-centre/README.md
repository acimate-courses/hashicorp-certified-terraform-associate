# AWS Tips or Best Practice

## Articles
  - CloudFront Distrobution, API Gateways, Application Load Balancers should be behind WAF ACL
  - Glue job is used to send data from S3 to AWS RDS using crawler job.
  - Follow tips if you receive datatype error while querying athena views.
  - Move data from S3 to SnowFlake
  - Best Approach to transfer 200M rows of data from on-prem db to snowflake warehouse?
  - Best process to migrate from one Sagemaker domain to another.
  - How to perform AWS QuickSight AD group Mapping?
  - AWS Job Orchestrations
    - Write Glue triggers
    - Glue job chaining using boto3 api ( one job calls others)
    - Step Functions
    - S3 event triggers custom lmabda which invokes glue job using boto3 api call
    - Along with there third party tools - airflow to be used for job orchestration.
  - Observability and Monitoring
    - How to use AWS Application Insights?
    - CloudWatch Logs Monitoring
    - Trigger alarm, SNS notifications
    - Configure CloudWatch Matrics
    - How to configure Xray tracing for Lambda, EC2, ECS, EKS? Also, use AWS Sidecar for container communication.
    - How to configure AWS Access portal to provide access to accounts for your users.
    - How to configure Identity Providers (Idp) to manage user identities outside AWS - OpenId connect, SAML provider (azure AD)
    - How can you ensure various controls in serverless resources. for exaple, Org wants to enforce that lambda, api-getway, ecs, ec2 etc. must be enabled with xray? How to ensure it? If user does not do this, it wont be deployed. AWS config rule is the solution.
    - the terraform resource creation can be categorized as below -
      - storage
      - compute
      - networking
      - data
      - integration
      - analytics
      - machine learning
      - monitoring and governance
      - platform engineering
      - devops
      - access - iam/roles/sso/cognito
      