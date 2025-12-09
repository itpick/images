{ pkgs, lib, ... }:

# TODO: Add tests for opencost-fips image
{
  name = "opencost-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opencost-fips"
    exit 1
  '';
}
