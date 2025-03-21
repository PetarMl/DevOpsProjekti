import boto3
import datetime

s3 = boto3.client('s3')

def lambda_handler(event, context):
    bucket_name = 'sistem-za-arhiviranje-fajlova'
    
    objects = s3.list_objects_v2(Bucket=bucket_name)
    if 'Contents' not in objects:
        print("Prazan bucket.")
        return
    
    for obj in objects['Contents']:
        file_key = obj['Key']
        print(f"Fajl u obradi: {file_key}")
        
        response = s3.head_object(Bucket=bucket_name, Key=file_key)
        last_modified = response['LastModified']
        file_age = (datetime.datetime.now(datetime.timezone.utc) - last_modified).total_seconds()
        print(f"Starost fajla: {file_age} sekundi")

        if file_age > 300:
            print(f"Fajl se arhivira: {file_key}")
            s3.copy_object(
                Bucket=bucket_name,
                CopySource={'Bucket': bucket_name, 'Key': file_key},
                Key=file_key,
                StorageClass='GLACIER'
            )
            print(f"Fajl {file_key} je arhiviran.")
        else:
            print(f"Fajl{file_key} nije dovoljno star za arhiviranje(MIN 5 minuta star.)")
