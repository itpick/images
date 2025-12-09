{ pkgs, lib, ... }:

# TODO: Add tests for knative-serving image
{
  name = "knative-serving";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-serving"
    exit 1
  '';
}
