{ pkgs, lib, ... }:

# TODO: Add tests for regclient-fips image
{
  name = "regclient-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for regclient-fips"
    exit 1
  '';
}
