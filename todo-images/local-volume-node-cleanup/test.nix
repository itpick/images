{ pkgs, lib, ... }:

# TODO: Add tests for local-volume-node-cleanup image
{
  name = "local-volume-node-cleanup";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for local-volume-node-cleanup"
    exit 1
  '';
}
