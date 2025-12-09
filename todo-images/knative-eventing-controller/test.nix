{ pkgs, lib, ... }:

# TODO: Add tests for knative-eventing-controller image
{
  name = "knative-eventing-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-eventing-controller"
    exit 1
  '';
}
