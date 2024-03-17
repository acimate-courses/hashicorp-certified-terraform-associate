output acimate_bucket_retail{
    value = aws_s3_bucket.acimate_test_buckets[0].arn
}
output acimate_bucket_finance{
    value = aws_s3_bucket.acimate_test_buckets[1].arn
}

output acimate_bucket_hr{
    value = aws_s3_bucket.acimate_test_buckets[2].arn
}
