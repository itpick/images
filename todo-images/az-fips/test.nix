{ pkgs, lib, ... }:

# TODO: Add tests for az-fips image
{
  name = "az-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for az-fips"
    exit 1
  '';
}
