{ pkgs, lib, ... }:

# TODO: Add tests for knative-operator image
{
  name = "knative-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-operator"
    exit 1
  '';
}
