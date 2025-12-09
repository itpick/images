{ pkgs, lib, ... }:

# TODO: Add tests for k8s-agents-operator-fips image
{
  name = "k8s-agents-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k8s-agents-operator-fips"
    exit 1
  '';
}
