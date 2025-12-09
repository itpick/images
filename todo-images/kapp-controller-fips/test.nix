{ pkgs, lib, ... }:

# TODO: Add tests for kapp-controller-fips image
{
  name = "kapp-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kapp-controller-fips"
    exit 1
  '';
}
