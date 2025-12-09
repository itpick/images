{ pkgs, lib, ... }:

# TODO: Add tests for tekton-resolvers image
{
  name = "tekton-resolvers";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-resolvers"
    exit 1
  '';
}
