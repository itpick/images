{ pkgs, lib, ... }:

# TODO: Add tests for kubectl-iamguarded image
{
  name = "kubectl-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubectl-iamguarded"
    exit 1
  '';
}
