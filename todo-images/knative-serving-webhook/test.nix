{ pkgs, lib, ... }:

# TODO: Add tests for knative-serving-webhook image
{
  name = "knative-serving-webhook";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-serving-webhook"
    exit 1
  '';
}
