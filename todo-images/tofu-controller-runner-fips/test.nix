{ pkgs, lib, ... }:

# TODO: Add tests for tofu-controller-runner-fips image
{
  name = "tofu-controller-runner-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tofu-controller-runner-fips"
    exit 1
  '';
}
