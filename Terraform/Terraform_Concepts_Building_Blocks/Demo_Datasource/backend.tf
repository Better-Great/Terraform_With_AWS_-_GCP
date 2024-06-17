terraform {
    backend "s3" {
        bucket = "tf-remote-state-777"
        key    = "development/terraform_state"
        region = "us-east-2"
    }
}