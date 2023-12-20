terraform {
  cloud {
    organization = "natl-vsphere"
    workspaces {
      name = "okta-app-efront-external-dev"
    }
  }
  
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 4.6.3"
    }
  }
}

# Configure the Okta Provider
provider "okta" {
  org_name  = var.org_name
  base_url  = var.base_url
  api_token = var.api_token
}