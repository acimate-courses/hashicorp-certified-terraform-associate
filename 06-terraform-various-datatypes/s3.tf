resource "aws_s3_bucket" "acimate_test_buckets" {
  count = length(var.bucket_names)
  bucket   = "${var.org_prefix}-${var.bucket_names[count.index]}"

  tags = {
    datacategory = lookup(var.common_tag_map,"datacategory")
    datausage = lookup(var.common_tag_map,"datausage")
    bu_name = lookup(lookup(var.bu_specific_tag_map,split("-","${var.bucket_names[count.index]}")[0]),"bu_name")
    owner = lookup(lookup(var.bu_specific_tag_map,split("-","${var.bucket_names[count.index]}")[0]),"owner")
    cost_center = lookup(lookup(var.bu_specific_tag_map,split("-","${var.bucket_names[count.index]}")[0]),"cost_center")
  }
}

#########S3 public access block################
resource "aws_s3_bucket_public_access_block" "acimate_bucket_pub_acc_block" {
  count = length(var.bucket_names)
  bucket = aws_s3_bucket.acimate_test_buckets[count.index].id

  block_public_acls       = var.block_public_acls_config
  block_public_policy     = var.block_public_policy_config
  ignore_public_acls      = var.ignore_public_acls_config
  restrict_public_buckets = var.restrict_public_buckets_config
}
