{ pkgs, lib, ... }:

# TODO: Add tests for tekton-events image
{
  name = "tekton-events";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-events"
    exit 1
  '';
}
