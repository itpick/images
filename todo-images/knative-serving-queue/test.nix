{ pkgs, lib, ... }:

# TODO: Add tests for knative-serving-queue image
{
  name = "knative-serving-queue";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-serving-queue"
    exit 1
  '';
}
