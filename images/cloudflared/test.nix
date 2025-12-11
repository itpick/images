{ pkgs, lib, ... }:

# TODO: Add tests for cloudflared image
{
  name = "cloudflared";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cloudflared"
    exit 1
  '';
}
