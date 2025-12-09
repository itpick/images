{ pkgs, lib, ... }:

# TODO: Add tests for rancher-fleet-fips image
{
  name = "rancher-fleet-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rancher-fleet-fips"
    exit 1
  '';
}
