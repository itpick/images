{ pkgs, lib, ... }:

# TODO: Add tests for neuvector-enforcer-fips image
{
  name = "neuvector-enforcer-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for neuvector-enforcer-fips"
    exit 1
  '';
}
