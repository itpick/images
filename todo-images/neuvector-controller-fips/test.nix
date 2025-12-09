{ pkgs, lib, ... }:

# TODO: Add tests for neuvector-controller-fips image
{
  name = "neuvector-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for neuvector-controller-fips"
    exit 1
  '';
}
