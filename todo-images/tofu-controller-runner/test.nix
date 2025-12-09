{ pkgs, lib, ... }:

# TODO: Add tests for tofu-controller-runner image
{
  name = "tofu-controller-runner";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tofu-controller-runner"
    exit 1
  '';
}
