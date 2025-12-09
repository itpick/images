{ pkgs, lib, ... }:

# TODO: Add tests for tekton-webhook image
{
  name = "tekton-webhook";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-webhook"
    exit 1
  '';
}
