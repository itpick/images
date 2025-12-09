{ pkgs, lib, ... }:

# TODO: Add tests for k8sgpt-operator image
{
  name = "k8sgpt-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k8sgpt-operator"
    exit 1
  '';
}
