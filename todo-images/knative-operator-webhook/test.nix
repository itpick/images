{ pkgs, lib, ... }:

# TODO: Add tests for knative-operator-webhook image
{
  name = "knative-operator-webhook";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-operator-webhook"
    exit 1
  '';
}
