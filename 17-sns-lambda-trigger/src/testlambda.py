import boto3

def lambda_handler(event, context):
    print(event)
    print('Hello SNS Trigger!!')