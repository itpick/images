{ pkgs, lib, ... }:

# TODO: Add tests for tofu-controller-fips image
{
  name = "tofu-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tofu-controller-fips"
    exit 1
  '';
}
