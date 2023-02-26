resource "cloudflare_load_balancer_pool" "kix" {
  account_id = var.account_id
  name       = "kix-pool"
  origins {
    name    = "origin0"
    address = "aa57***ba18.cfargotunnel.com"
    enabled = true
    header {
      header = "Host"
      values = ["origin0.example.com"]
    }
  }
  latitude           = 34
  longitude          = 135
  description        = "example load balancer pool"
  enabled            = true
  minimum_origins    = 1
  monitor = cloudflare_load_balancer_monitor.monitor0.id
  notification_email = "someone@example.com"
  origin_steering {
    policy = "random"
  }
  check_regions = ["NEAS"]
}


resource "cloudflare_load_balancer_pool" "ewr" {
  account_id = var.account_id
  name       = "ewr-pool"
  origins {
    name    = "origin1"
    address = "ad8c***47f5.cfargotunnel.com"
    enabled = true
    header {
      header = "Host"
      values = ["origin1.example.com"]
    }
  }
  latitude           = 38
  longitude          = -77
  description        = "example load balancer pool"
  enabled            = true
  minimum_origins    = 1
  monitor = cloudflare_load_balancer_monitor.monitor0.id
  notification_email = "someone@example.com"
  origin_steering {
    policy = "random"
  }
  check_regions = ["ENAM"]
}