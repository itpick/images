{ pkgs, lib, ... }:

# TODO: Add tests for infinispan-operator image
{
  name = "infinispan-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for infinispan-operator"
    exit 1
  '';
}
