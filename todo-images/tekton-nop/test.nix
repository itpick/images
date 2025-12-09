{ pkgs, lib, ... }:

# TODO: Add tests for tekton-nop image
{
  name = "tekton-nop";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-nop"
    exit 1
  '';
}
