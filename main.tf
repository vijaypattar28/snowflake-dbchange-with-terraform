terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "VRM"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "demo_db_vp" {
  name    = "demo_db_vp"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "demo_db_vp_schema"{
    database = snowflake_database.demo_db_vp
    name = "demo_schema"
    comment = "Schema created using the snowflake terraform"
}