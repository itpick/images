{ pkgs, lib, ... }:

# TODO: Add tests for longhorn-ui image
{
  name = "longhorn-ui";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for longhorn-ui"
    exit 1
  '';
}
