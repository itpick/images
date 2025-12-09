{ pkgs, lib, ... }:

# TODO: Add tests for knative-serving-controller image
{
  name = "knative-serving-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-serving-controller"
    exit 1
  '';
}
