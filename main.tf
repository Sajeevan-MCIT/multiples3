# Configure the AWS Provider
provider "aws" {
  region     = var.aws_region
}
variable "s3_bucket_names" {
  type = list
  default = ["dev-bucket.app", "uat-bucket.app", "prod-bucket.app"]
}
resource "aws_s3_bucket" "rugged_buckets" {
  count         = length(var.s3_bucket_names) 
  bucket        = var.s3_bucket_names[count.index]
  acl           = "private"
  region        = "us-east-1"
  force_destroy = true
}
