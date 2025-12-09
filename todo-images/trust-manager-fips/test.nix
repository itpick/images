{ pkgs, lib, ... }:

# TODO: Add tests for trust-manager-fips image
{
  name = "trust-manager-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for trust-manager-fips"
    exit 1
  '';
}
