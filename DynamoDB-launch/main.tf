/// Basic structure for launching a DynamoDB table

terraform {
 required_providers {
   aws = {
     source = "hashicorp/aws"
   }
 }
}
    
provider "aws" {
  region = "us-east-1"
  profile = "default"
}

// Link to Argument References
/* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table#argument-reference */

resource "aws_dynamodb_table" "test_table" {
  name = "example-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "TestTableHashKey"

  attribute {
    name = "TestTableHashKey"
    type = "S"
  }

}