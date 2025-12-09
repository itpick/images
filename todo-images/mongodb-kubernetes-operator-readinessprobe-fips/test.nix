{ pkgs, lib, ... }:

# TODO: Add tests for mongodb-kubernetes-operator-readinessprobe-fips image
{
  name = "mongodb-kubernetes-operator-readinessprobe-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mongodb-kubernetes-operator-readinessprobe-fips"
    exit 1
  '';
}
