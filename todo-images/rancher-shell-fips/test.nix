{ pkgs, lib, ... }:

# TODO: Add tests for rancher-shell-fips image
{
  name = "rancher-shell-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rancher-shell-fips"
    exit 1
  '';
}
