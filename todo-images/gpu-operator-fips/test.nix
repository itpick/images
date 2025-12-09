{ pkgs, lib, ... }:

# TODO: Add tests for gpu-operator-fips image
{
  name = "gpu-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gpu-operator-fips"
    exit 1
  '';
}
