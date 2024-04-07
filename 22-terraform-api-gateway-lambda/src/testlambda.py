import boto3

def lambda_handler(event, context):
    print(event)
    print('Hello API Gateway!!') 
    return {
        "statusCode": 200,
        "headers": {
            'Content-Type': 'text/html; charset=utf-8',
        },
        "body": "<p>Hello world!</p>",
    }
