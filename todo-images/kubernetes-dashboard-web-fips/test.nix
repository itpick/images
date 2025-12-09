{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-dashboard-web-fips image
{
  name = "kubernetes-dashboard-web-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-dashboard-web-fips"
    exit 1
  '';
}
