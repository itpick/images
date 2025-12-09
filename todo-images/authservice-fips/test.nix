{ pkgs, lib, ... }:

# TODO: Add tests for authservice-fips image
{
  name = "authservice-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for authservice-fips"
    exit 1
  '';
}
