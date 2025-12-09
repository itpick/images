{ pkgs, lib, ... }:

# TODO: Add tests for argo-cli image
{
  name = "argo-cli";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for argo-cli"
    exit 1
  '';
}
