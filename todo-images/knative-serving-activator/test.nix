{ pkgs, lib, ... }:

# TODO: Add tests for knative-serving-activator image
{
  name = "knative-serving-activator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-serving-activator"
    exit 1
  '';
}
