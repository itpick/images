{ pkgs, lib, ... }:

# TODO: Add tests for tekton-cli image
{
  name = "tekton-cli";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-cli"
    exit 1
  '';
}
