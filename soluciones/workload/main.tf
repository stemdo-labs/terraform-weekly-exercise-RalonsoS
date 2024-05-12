terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.102.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "rg1ralonso-lab01"
      storage_account_name = "sta1ralonso"
      container_name       = "tfstate"
      key                  = "terraform_weekly.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "weekly_exercise" {
  source = "github.com/stemdo-labs/terraform-exercises-RalonsoS-1/soluciones/modulo-weekly-exercise"
  azure_infrastructure = var.azure_infrastructure
}