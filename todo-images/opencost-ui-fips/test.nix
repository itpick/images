{ pkgs, lib, ... }:

# TODO: Add tests for opencost-ui-fips image
{
  name = "opencost-ui-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opencost-ui-fips"
    exit 1
  '';
}
