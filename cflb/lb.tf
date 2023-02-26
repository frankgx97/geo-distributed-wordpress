resource "cloudflare_load_balancer" "lb" {
  zone_id          = var.zone_id
  name             = var.hostname
  fallback_pool_id = cloudflare_load_balancer_pool.kix.id
  default_pool_ids = [cloudflare_load_balancer_pool.kix.id, cloudflare_load_balancer_pool.ewr.id]
  description      = "example load balancer using geo-balancing"
  proxied          = true
  steering_policy  = "proximity"
}