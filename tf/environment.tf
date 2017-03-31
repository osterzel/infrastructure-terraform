terraform { 
   backend "s3" {
     bucket = "cloudsurge-terraform"
     key = "env.tfstate"
     region = "eu-west-1"
     lock_table = "terraform-lock"
   }
}
