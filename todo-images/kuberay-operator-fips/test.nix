{ pkgs, lib, ... }:

# TODO: Add tests for kuberay-operator-fips image
{
  name = "kuberay-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kuberay-operator-fips"
    exit 1
  '';
}
