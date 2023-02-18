terraform {
  backend "s3" {
    bucket = "private-a664ff17-1c36-6e30-5d46-9d1e365abdd7"
    region = "ap-northeast-1"
    key    = "terraform/terraform.tfstate"
  }
}
