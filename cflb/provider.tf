terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "4.0.0-rc1"
    }
  }
}

provider "cloudflare" {
    //CLOUDFLARE_API_KEY=
    //CLOUDFLARE_EMAIL=
}