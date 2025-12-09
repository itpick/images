{ pkgs, lib, ... }:

# TODO: Add tests for chisel-fips image
{
  name = "chisel-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for chisel-fips"
    exit 1
  '';
}
