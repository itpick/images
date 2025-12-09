{ pkgs, lib, ... }:

# TODO: Add tests for argo-exec image
{
  name = "argo-exec";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for argo-exec"
    exit 1
  '';
}
