{ pkgs, lib, ... }:

# TODO: Add tests for helm-operator image
{
  name = "helm-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for helm-operator"
    exit 1
  '';
}
