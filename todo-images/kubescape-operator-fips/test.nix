{ pkgs, lib, ... }:

# TODO: Add tests for kubescape-operator-fips image
{
  name = "kubescape-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubescape-operator-fips"
    exit 1
  '';
}
