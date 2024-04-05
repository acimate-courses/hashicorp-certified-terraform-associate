import boto3

def lambda_handler(event, context):
    print(event)    
    source_bucket_name = event['Records'][0]['s3']['bucket']['name']
    img_file = event['Records'][0]['s3']['object']['key']    
    
    s3_client = boto3.client("s3")
    copy_object_details = {'Bucket':source_bucket_name,'Key':img_file}
    destination_bucket = "acimate-img-processing"
    dest_key = "demo/raw/myimage.jpg"
    #This will copy same folder structure as source
    #s3_client.copy_object(Bucket = destination_bucket,
    #        CopySource = copy_object_details,
    #        Key = img_file)
    s3_client.copy_object(Bucket = destination_bucket,
            CopySource = copy_object_details,
            Key = dest_key)
    
    print('file copied successfully.')            
    print('Hello CloudWatch!!')