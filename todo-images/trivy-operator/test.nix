{ pkgs, lib, ... }:

# TODO: Add tests for trivy-operator image
{
  name = "trivy-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for trivy-operator"
    exit 1
  '';
}
