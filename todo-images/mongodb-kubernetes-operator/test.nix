{ pkgs, lib, ... }:

# TODO: Add tests for mongodb-kubernetes-operator image
{
  name = "mongodb-kubernetes-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mongodb-kubernetes-operator"
    exit 1
  '';
}
