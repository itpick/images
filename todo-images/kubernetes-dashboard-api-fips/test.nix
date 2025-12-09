{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-dashboard-api-fips image
{
  name = "kubernetes-dashboard-api-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-dashboard-api-fips"
    exit 1
  '';
}
