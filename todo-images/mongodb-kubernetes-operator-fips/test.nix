{ pkgs, lib, ... }:

# TODO: Add tests for mongodb-kubernetes-operator-fips image
{
  name = "mongodb-kubernetes-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mongodb-kubernetes-operator-fips"
    exit 1
  '';
}
