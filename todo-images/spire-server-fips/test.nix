{ pkgs, lib, ... }:

# TODO: Add tests for spire-server-fips image
{
  name = "spire-server-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spire-server-fips"
    exit 1
  '';
}
