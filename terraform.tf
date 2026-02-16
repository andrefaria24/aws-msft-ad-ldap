terraform {
  required_version = "~> 1.14"

  cloud {
    organization = "acfaria-hashicorp"

    workspaces {
      name = "lab-domain-controller"
    }
  }

  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}