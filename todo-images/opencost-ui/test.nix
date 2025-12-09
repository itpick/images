{ pkgs, lib, ... }:

# TODO: Add tests for opencost-ui image
{
  name = "opencost-ui";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opencost-ui"
    exit 1
  '';
}
