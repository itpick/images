{ pkgs, lib, ... }:

# TODO: Add tests for tekton-workingdirinit image
{
  name = "tekton-workingdirinit";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-workingdirinit"
    exit 1
  '';
}
