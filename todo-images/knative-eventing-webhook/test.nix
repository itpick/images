{ pkgs, lib, ... }:

# TODO: Add tests for knative-eventing-webhook image
{
  name = "knative-eventing-webhook";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-eventing-webhook"
    exit 1
  '';
}
