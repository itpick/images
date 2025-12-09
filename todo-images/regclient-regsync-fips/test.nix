{ pkgs, lib, ... }:

# TODO: Add tests for regclient-regsync-fips image
{
  name = "regclient-regsync-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for regclient-regsync-fips"
    exit 1
  '';
}
