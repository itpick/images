{ pkgs, lib, ... }:

# TODO: Add tests for neuvector-manager-fips image
{
  name = "neuvector-manager-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for neuvector-manager-fips"
    exit 1
  '';
}
