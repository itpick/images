{ pkgs, lib, ... }:

# TODO: Add tests for tigera-operator-fips image
{
  name = "tigera-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tigera-operator-fips"
    exit 1
  '';
}
