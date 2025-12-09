{ pkgs, lib, ... }:

# TODO: Add tests for flux image
{
  name = "flux";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux"
    exit 1
  '';
}
