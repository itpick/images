{ pkgs, lib, ... }:

# TODO: Add tests for spegel-fips image
{
  name = "spegel-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spegel-fips"
    exit 1
  '';
}
