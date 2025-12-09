{ pkgs, lib, ... }:

# TODO: Add tests for node-fips image
{
  name = "node-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for node-fips"
    exit 1
  '';
}
