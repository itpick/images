{ pkgs, lib, ... }:

# TODO: Add tests for metallb-controller-fips image
{
  name = "metallb-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for metallb-controller-fips"
    exit 1
  '';
}
