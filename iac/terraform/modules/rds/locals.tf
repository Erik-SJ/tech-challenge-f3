locals {

  name = "${var.project_name}-${var.environment}"

  databases = {

    auth = {
      identifier    = "auth-db"
      database_name = "auth"
    }

    flag = {
      identifier    = "flag-db"
      database_name = "flag"
    }

    targeting = {
      identifier    = "targeting-db"
      database_name = "targeting"
    }

  }

  common_tags = {

    Project     = var.project_name
    Environment = var.environment
    Terraform   = "true"

  }
}
