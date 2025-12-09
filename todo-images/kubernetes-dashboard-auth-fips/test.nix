{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-dashboard-auth-fips image
{
  name = "kubernetes-dashboard-auth-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-dashboard-auth-fips"
    exit 1
  '';
}
