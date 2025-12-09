{ pkgs, lib, ... }:

# TODO: Add tests for boring-registry-fips image
{
  name = "boring-registry-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for boring-registry-fips"
    exit 1
  '';
}
