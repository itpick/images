{ pkgs, lib, ... }:

# TODO: Add tests for tekton-entrypoint image
{
  name = "tekton-entrypoint";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-entrypoint"
    exit 1
  '';
}
