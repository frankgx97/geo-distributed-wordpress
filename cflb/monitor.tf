resource "cloudflare_load_balancer_monitor" "monitor0" {
  account_id     = var.account_id
  type           = "https"
  expected_codes = "2xx"
  method         = "GET"
  timeout        = 7
  path           = "/"
  interval       = 60
  retries        = 5
  description    = "example http load balancer"
  header {
    header = "Host"
    values = [var.hostname]
  }
  allow_insecure   = true
  follow_redirects = true
}
