{ pkgs, lib, ... }:

# TODO: Add tests for ztunnel-fips image
{
  name = "ztunnel-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ztunnel-fips"
    exit 1
  '';
}
