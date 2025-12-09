{ pkgs, lib, ... }:

# TODO: Add tests for rancher-webhook-fips image
{
  name = "rancher-webhook-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rancher-webhook-fips"
    exit 1
  '';
}
