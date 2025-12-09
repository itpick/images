{ pkgs, lib, ... }:

# TODO: Add tests for tekton-chains image
{
  name = "tekton-chains";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-chains"
    exit 1
  '';
}
