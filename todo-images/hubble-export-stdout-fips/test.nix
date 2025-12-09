{ pkgs, lib, ... }:

# TODO: Add tests for hubble-export-stdout-fips image
{
  name = "hubble-export-stdout-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for hubble-export-stdout-fips"
    exit 1
  '';
}
