include "root" {
   path = find_in_parent_folders()
}

terraform {
   source = "${local.module_source_url}?ref=dev"
}

locals {
   module_source_url = "git@github.com:djole-kuzma/lambda_module.git//terraform"
}

inputs = {
   function_name = "node-app1"
   runtime       = "nodejs18.x"
   code_filename = "index.js"
   source_path = "${get_terragrunt_dir()}/./NodeCode"
   s3_bucket = "lambda-builds-225883"

   #package_url   = "https://raw.githubusercontent.com/djole-kuzma/terra-apps/main/node/app1/index.js"

   # Java Apps require following variables
   #package_name = "com.example"
   #class_name   = "Hello"
}