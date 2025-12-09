{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-dashboard-metrics-scraper-fips image
{
  name = "kubernetes-dashboard-metrics-scraper-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-dashboard-metrics-scraper-fips"
    exit 1
  '';
}
