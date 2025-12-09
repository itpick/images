{ pkgs, lib, ... }:

# TODO: Add tests for frr-fips image
{
  name = "frr-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for frr-fips"
    exit 1
  '';
}
