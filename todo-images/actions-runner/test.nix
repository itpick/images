{ pkgs, lib, ... }:

# TODO: Add tests for actions-runner image
{
  name = "actions-runner";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for actions-runner"
    exit 1
  '';
}
