{ pkgs, lib, ... }:

# TODO: Add tests for gha-runner-scale-set-controller image
{
  name = "gha-runner-scale-set-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gha-runner-scale-set-controller"
    exit 1
  '';
}
