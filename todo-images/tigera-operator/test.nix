{ pkgs, lib, ... }:

# TODO: Add tests for tigera-operator image
{
  name = "tigera-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tigera-operator"
    exit 1
  '';
}
