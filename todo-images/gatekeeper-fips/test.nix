{ pkgs, lib, ... }:

# TODO: Add tests for gatekeeper-fips image
{
  name = "gatekeeper-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gatekeeper-fips"
    exit 1
  '';
}
