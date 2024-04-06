import boto3

def lambda_handler(event, context):
    try:
        print(event)
        print('Hello SQS Trigger!!')
        print(event['unknown'])    