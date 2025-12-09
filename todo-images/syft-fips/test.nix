{ pkgs, lib, ... }:

# TODO: Add tests for syft-fips image
{
  name = "syft-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for syft-fips"
    exit 1
  '';
}
