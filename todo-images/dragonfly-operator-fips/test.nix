{ pkgs, lib, ... }:

# TODO: Add tests for dragonfly-operator-fips image
{
  name = "dragonfly-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dragonfly-operator-fips"
    exit 1
  '';
}
