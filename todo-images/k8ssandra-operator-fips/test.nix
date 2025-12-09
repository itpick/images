{ pkgs, lib, ... }:

# TODO: Add tests for k8ssandra-operator-fips image
{
  name = "k8ssandra-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k8ssandra-operator-fips"
    exit 1
  '';
}
