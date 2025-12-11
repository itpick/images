{ pkgs, lib, ... }:

# TODO: Add tests for tailscale image
{
  name = "tailscale";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tailscale"
    exit 1
  '';
}
