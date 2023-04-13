terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "terraform"
  region  = "us-east-1"
}

resource "aws_ecs_cluster" "allthecats" {
  name = "container-of-cats"
}

resource "aws_ecs_cluster_capacity_providers" "cantrill-example" {
  cluster_name = aws_ecs_cluster.allthecats.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}

resource "aws_ecs_task_definition" "test" {
  family                   = "test"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "containerofcatsweb",
    "image": "docker.io/devtitus/containerofcats",
    "cpu": 102,
    "memory": 2048,
    "essential": true,
    "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80
        }
      ]
  }
]
TASK_DEFINITION

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
}