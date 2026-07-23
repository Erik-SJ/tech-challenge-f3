terraform {

  backend "s3" {

    bucket       = "s3-fiap-lhp"
    key          = "tf-f3/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
