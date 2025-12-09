{ pkgs, lib, ... }:

# TODO: Add tests for tekton-controller image
{
  name = "tekton-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-controller"
    exit 1
  '';
}
